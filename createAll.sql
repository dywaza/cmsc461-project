create table skills
	(skill_name varchar(32),
    skill_id	numeric(4,0),
    
    primary key (skill_name)
    );
		
create table certificates
	(cert_title	varchar(64),
    cert_acronym	varchar(12),
    classification	varchar(12) check(classification in ('Beginner', 'Intermediate', 'Advanced')),
    
    primary key(cert_acronym)
    );

create table trainee
	(user_id	numeric(5,0),
    name	varchar(128),
    
    primary key (user_id)
    );
    

    
create table mentor
	(user_id	numeric(5,0),
	name	varchar(128),
    
	foreign key (user_id) references trainee(user_id) 
		on delete cascade
    );
    
create table skillmaster
	(user_id	numeric(5,0),
    name	varchar(128),
    skill_name varchar(32),
    
	foreign key (user_id) references trainee(user_id) 
		on delete cascade,
	foreign key (skill_name) references skills(skill_name)
    );
    
create table contact_info
	(user_id	numeric(5,0),
	street_adr	varchar(64),
    city	varchar(32),
    zip_code	numeric(5,0),
    phone_no	varchar(16),
    category	varchar(32),
    
    foreign key (user_id) references trainee(user_id)
		on delete cascade
    );
    
create table counselling
	(session_id numeric(6,0),
    trainee_id	numeric(5,0),
    skmaster_id	numeric(5,0),
    skill_name varchar(32),
    date_beginning	date,
    date_ending	date,
    
    primary key (session_id),
    foreign key (trainee_id) references trainee(user_id),
    foreign key (skmaster_id) references skillmaster(user_id),
    foreign key (skill_name) references skills(skill_name)
    );
    
create table challenge
	(challenge_name	varchar(64),
    challenge_acronym	varchar(12),
    
    primary key (challenge_acronym)
    );
    
create table challenge_skills
	(challenge_acronym	varchar(12),
    skill_name varchar(32),
    
    foreign key (challenge_acronym) references challenge(challenge_acronym),
    foreign key (skill_name) references skills(skill_name)
    );
    
create table challenge_event
	(challenge_inst_id	numeric(6,0),
    challenge_acronym	varchar(12),
    date_held	date,
    graded_trainee	numeric(5,0),
    
    primary key (challenge_inst_id),
    foreign key (challenge_acronym) references challenge(challenge_acronym),
    foreign key (graded_trainee) references trainee(user_id)
    );

create table score
	(challenge_inst_id	numeric(6,0),
	skill_name	varchar(32),
    trainee_id numeric(5,0),
    mentor1_id	numeric(5,0),
    grade1	tinyint check (grade1 >= 0 and grade1 <= 4),
	mentor2_id	numeric(5,0),
    grade2	tinyint check (grade2 >= 0 and grade2 <= 4),
	mentor3_id	numeric(5,0),
    grade3	tinyint check (grade3 >= 0 and grade3 <= 4),
    grade_avg tinyint check (grade_avg >= 0 and grade_avg <= 4),
    
    foreign key (challenge_inst_id) references challenge_event(challenge_inst_id)
		on delete cascade,
	foreign key (trainee_id) references trainee(user_id),
	foreign key (mentor1_id) references mentor(user_id),
	foreign key (mentor2_id) references mentor(user_id),
	foreign key (mentor3_id) references mentor(user_id),
    foreign key (skill_name) references skills(skill_name)
	);
    
create table has_skill
	(user_id	numeric(5,0),
    skill_name	varchar(32),
    grade	tinyint check (grade >= 0 and grade <= 4),
    challenge_inst_id	numeric(6,0),
    
    foreign key (user_id) references trainee(user_id),
    foreign key (skill_name) references skills(skill_name),
    foreign key (challenge_inst_id) references challenge_event(challenge_inst_id)
    );

create table prereq
	(cert_acronym	varchar(12),
    prereq_acronym	varchar(12),
    skill_name	varchar(32),
    grade	tinyint check (grade >= 0 and grade <=4),
    
    foreign key(cert_acronym) references certificates(cert_acronym)
		on delete cascade,
	foreign key(prereq_acronym) references certificates(cert_acronym)
		on delete set null,
	foreign key (skill_name) references skills(skill_name)
		on delete set null
    );
    
create table earns_cert
	(user_id	numeric(5,0),
    cert_acronym	varchar(12),
    
    foreign key (user_id) references trainee(user_id),
    foreign key (cert_acronym) references certificates(cert_acronym)
    );

delimiter //
create trigger GetGradeAvg before insert on score
for each row
begin
		set new.grade_avg = ((new.grade1+new.grade2+new.grade3)/3);
end//
delimiter ;

delimiter //
create trigger AddNewSkillset after insert on score
for each row
begin
		insert into has_skill (user_id, skill_name, grade, challenge_inst_id)
        values (new.trainee_id, new.skill_name, new.grade_avg, new.challenge_inst_id);
        if (new.grade_avg = 4) then
			insert into skillmaster (user_id, name, skill_name)
            values (new.trainee_id, null, new.skill_name);
            UPDATE skillmaster sm, trainee tr
			SET sm.name = tr.name
			WHERE sm.user_id = tr.user_id;
		end if;
end//
delimiter ;

delimiter //
create trigger GiveNewCertificates after insert on has_skill
for each row
begin
		declare x INT default 0;
		declare y INT default 0;
        create temporary table Titles (t_acronym varchar(15));
        create temporary table Fitles (t_acronym varchar(15));
        create temporary table Bitles (t_acronym varchar(15));
        
        SET x = 0;
        SELECT DISTINCT COUNT(cert_acronym)
			FROM certificates
			INTO y;
		INSERT INTO Titles (t_acronym) 
			SELECT DISTINCT cert_acronym 
			FROM certificates;
		INSERT INTO Fitles (t_acronym) 
			SELECT DISTINCT cert_acronym 
			FROM certificates;
		INSERT INTO Bitles (t_acronym)
			SELECT DISTINCT cert_acronym
            FROM certificates;
                
		WHILE x < y DO
        /*black magic*/
			IF(NOT EXISTS(
				
                SELECT *
                FROM (
				SELECT skill_name
                FROM prereq
                WHERE prereq.cert_acronym =
					(SELECT Titles.t_acronym
					FROM Titles
                    LIMIT x,1)
				) AS t1
				LEFT JOIN (
				(SELECT skill_name
                FROM has_skill
                WHERE has_skill.user_id = new.user_id)
                ) AS t2
                ON t1.skill_name = t2.skill_name
                WHERE t2.skill_name is null and t1.skill_name is not null)
                
                AND NOT EXISTS(
                SELECT *
                FROM (
                SELECT prereq_acronym
                FROM prereq
                WHERE prereq.cert_acronym = 
					(SELECT Fitles.t_acronym
                    FROM Fitles
                    LIMIT x,1)
				) AS v1
				LEFT JOIN (
                (SELECT cert_acronym
                FROM earns_cert
                WHERE earns_cert.user_id = new.user_id)
                ) AS v2
                ON v1.prereq_acronym = v2.cert_acronym
                WHERE v2.cert_acronym is null and v1.prereq_acronym is not null
                
			)
            
				AND NOT EXISTS(
                SELECT *
                FROM (
				SELECT skill_name, grade
                FROM prereq
                WHERE prereq.cert_acronym =
					(SELECT Bitles.t_acronym
					FROM Bitles
                    LIMIT x,1)
				) AS z0
				INNER JOIN (
				(SELECT skill_name, MAX(grade) as maxgrade
                FROM has_skill
                WHERE has_skill.user_id = new.user_id)
                ) AS z1
                ON z0.skill_name = z1.skill_name
                WHERE z0.grade > z1.maxgrade
            
            )) THEN
            
            if (not exists(SELECT * FROM earns_cert WHERE user_id = new.user_id and cert_acronym = (SELECT * FROM Fitles LIMIT x,1))) then
				insert into earns_cert (user_id, cert_acronym)
				values (new.user_id, (SELECT * FROM Fitles LIMIT x,1));
                
                if (((SELECT classification FROM certificates WHERE cert_acronym = (SELECT * FROM Titles LIMIT x,1)) = 'Intermediate' or
					(SELECT classification FROM certificates WHERE cert_acronym = (SELECT * FROM Bitles LIMIT x,1)) = 'Advanced') and
                    not exists(SELECT user_id FROM mentor WHERE user_id = new.user_id)) then
						insert into mentor (user_id, name)
						values (new.user_id, null);
						UPDATE mentor mn, trainee tr
						SET mn.name = tr.name
						WHERE mn.user_id = tr.user_id;
					end if;
				end if;            
            
            END IF;

		SET x = x + 1;
		END WHILE;
        
		DROP TEMPORARY TABLE Titles;
		DROP TEMPORARY TABLE Fitles;
        DROP TEMPORARY TABLE Bitles;

			
end//
delimiter ;


		

        
        
    


    

    
    