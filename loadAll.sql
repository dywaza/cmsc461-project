delete from score;
delete from earns_cert;
delete from has_skill;
delete from prereq;
delete from challenge_skills;
delete from challenge_event;
delete from challenge;
delete from counselling;
delete from contact_info;
delete from mentor;
delete from skillmaster;
delete from certificates;
delete from skills;
delete from trainee;


insert into trainee values ('15056', 'Sara Chidouin');
insert into trainee values ('89308', 'Joe Tazuna');
insert into trainee values ('36613', 'Keiji Shinogi');
insert into trainee values ('55808', 'Kanna Kizuchi');
insert into trainee values ('90562', 'Q-taro Burgerburg');
insert into trainee values ('04727', 'Shin Tsukimi');
insert into trainee values ('00769', 'Reko Yabusame');
insert into trainee values ('44825', 'Nao Egokoro');
insert into trainee values ('48288', 'Kai Satou');
insert into trainee values ('65143', 'Gin Ibushi');
insert into trainee values ('23035', 'Kazumi Mishima');
insert into trainee values ('56940', 'Alice Yabusame');
insert into trainee values ('70509', 'Ranmaru Kageyama');
insert into trainee values ('09569', 'Mai Tsurugi');
insert into trainee values ('61189', 'Hinako Mishuku');
insert into trainee values ('23744', 'Shunsuke Hayasaka');
insert into trainee values ('54754', 'Naomichi Kurumada');
insert into trainee values ('40068', 'Anzu Kinashi');
insert into trainee values ('96141', 'Kugie Kizuchi');
insert into trainee values ('60466', 'Megumi Sasahara');


insert into skills values ('Database Management', '0001');
insert into skills values ('Secure Programming', '0002');
insert into skills values ('Frontend Development', '0003');
insert into skills values ('Backend Development', '0004');
insert into skills values ('PC Repair', '0005');
insert into skills values ('Laptop Repair', '0006');
insert into skills values ('Scrum Management', '0007');
insert into skills values ('Surrealist Painting', '0008');
insert into skills values ('Singing, jazz', '0009');
insert into skills values ('Singing, opera', '0010');
insert into skills values ('Running Very Fast', '0011');
insert into skills values ('Card Game Strategies', '0012');
insert into skills values ('Bartending', '0013');
insert into skills values ('Escape Rooms', '0014');


insert into certificates values ('Visual Arts Acknowledgement Award', 'VAAA', 'Beginner');
insert into prereq values ('VAAA', null, 'Surrealist Painting', 3);

insert into certificates values ('Fullstack Developer', 'FSD', 'Beginner');
insert into prereq values ('FSD', null, 'Frontend Development', 3);
insert into prereq values ('FSD', null, 'Backend Development', 3);

insert into certificates values ('Database Admin', 'DBA', 'Beginner');
insert into prereq values ('DBA', null, 'Database Management', 4);
insert into prereq values ('DBA', null, 'Frontend Development', 2);
insert into prereq values ('DBA', null, 'Scrum Management', 3);

insert into certificates values ('Practical Repairperson', 'PR', 'Beginner');
insert into prereq values ('PR', null, 'PC Repair', 3);
insert into prereq values ('PR', null, 'Laptop Repair', 3);

insert into certificates values ('Certified Casino Cheater', 'CCC', 'Beginner');
insert into prereq values ('CCC', null, 'Card Game Strategies', 4);
insert into prereq values ('CCC', null, 'Running Very Fast', 3);

insert into certificates values ('Well-Rounded Musician', 'WRM', 'Beginner');
insert into prereq values ('WRM', null, 'Singing, jazz', 3);
insert into prereq values ('WRM', null, 'Singing, opera', 3);

insert into certificates values ('Certified Jazz Club Manager', 'CJCM', 'Beginner');
insert into prereq values ('CJCM', null, 'Singing, jazz', 2);
insert into prereq values ('CJCM', null, 'Bartending', 3);
insert into prereq values ('CJCM', null, 'Scrum Management', 3);

insert into certificates values ('Casino Secret Agent Operative', 'CSAO', 'Intermediate');
insert into prereq values ('CSAO', 'CCC', null, null);
insert into prereq values ('CSAO', null, 'Escape Rooms', 3);

insert into certificates values ('Good Fullstack Developer', 'GFSD', 'Intermediate');
insert into prereq values ('GFSD', 'FSD', null, null);
insert into prereq values ('GFSD', null, 'Secure Programming', 3);

insert into certificates values ('Saucy Casino Performer', 'SCP', 'Intermediate');
insert into prereq values ('SCP', 'CCC', null, null);
insert into prereq values ('SCP', 'WRM', null, null);

insert into certificates values ('Casino Operative Leader', 'COL', 'Advanced');
insert into prereq values ('COL', 'CSAO', null, null);
insert into prereq values ('COL', null, 'Scrum Management', 3);


insert into challenge values ('Painting in the Style of Picasso', 'PitSoP');
insert into challenge_skills values ('PitSoP', 'Surrealist Painting');

insert into challenge values ('Chip Swapping in Texas Hold\'em', 'CSiTH');
insert into challenge_skills values ('CSiTH', 'Card Game Strategies');
insert into challenge_skills values ('CSiTH', 'Running Very Fast');

insert into challenge values ('Update Tasks of a Group of Employees', 'UToaGoE');
insert into challenge_skills values ('UToaGoE', 'Scrum Management');
insert into challenge_skills values ('UToaGoE', 'Database Management');

insert into challenge values ('Writing Secure Web API Calls', 'WSWAC');
insert into challenge_skills values ('WSWAC', 'Frontend Development');
insert into challenge_skills values ('WSWAC', 'Secure Programming');

insert into challenge values ('Escape the Locked Barroom Closet!', 'EtLBC');
insert into challenge_skills values ('EtLBC', 'Escape Rooms');

insert into challenge values ('Run a Trial Jazz Club for a Day', 'RaTJCfaD');
insert into challenge_skills values ('RaTJCfaD', 'Bartending');
insert into challenge_skills values ('RaTJCfaD', 'Scrum Management');
insert into challenge_skills values ('RaTJCfaD', 'Singing, jazz');

insert into challenge values ('Fixing Bugs while in Production Stage', 'FBwiPS');
insert into challenge_skills values ('FBwiPS', 'Backend Development');
insert into challenge_skills values ('FBwiPS', 'Running Very Fast');
insert into challenge_skills values ('FBwiPS', 'Secure Programming');


insert into mentor values ('36613', 'Keiji Shinogi');
insert into skillmaster values ('36613', 'Keiji Shinogi', 'Escape Rooms');
insert into has_skill values ('36613', 'Escape Rooms', 4, null);
insert into skillmaster values ('36613', 'Keiji Shinogi', 'Bartending');
insert into has_skill values ('36613', 'Bartending', 4, null);
insert into skillmaster values ('36613', 'Keiji Shinogi', 'Card Game Strategies');
insert into has_skill values ('36613', 'Card Game Strategies', 4, null);
insert into skillmaster values ('36613', 'Keiji Shinogi', 'Running Very Fast');
insert into has_skill values ('36613', 'Running Very Fast', 4, null);

insert into mentor values ('48288', 'Kai Satou');
insert into skillmaster values ('48288', 'Kai Satou', 'Escape Rooms');
insert into has_skill values ('48288', 'Escape Rooms', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Card Game Strategies');
insert into has_skill values ('48288', 'Card Game Strategies', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Backend Development');
insert into has_skill values ('48288', 'Backend Development', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Frontend Development');
insert into has_skill values ('48288', 'Frontend Development', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Secure Programming');
insert into has_skill values ('48288', 'Secure Programming', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Running Very Fast');
insert into has_skill values ('48288', 'Running Very Fast', 4, null);
insert into skillmaster values ('48288', 'Kai Satou', 'Surrealist Painting');
insert into has_skill values ('48288', 'Surrealist Painting', 4, null);

insert into mentor values ('23035', 'Kazumi Mishima');
insert into skillmaster values ('23035', 'Kazumi Mishima', 'Surrealist Painting');
insert into has_skill values ('23035', 'Surrealist Painting', 4, null);
insert into skillmaster values ('23035', 'Kazumi Mishima', 'Bartending');
insert into has_skill values ('23035', 'Bartending', 4, null);

insert into mentor values ('04727', 'Shin Tsukimi');
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Backend Development');
insert into has_skill values ('04727', 'Backend Development', 4, null);
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Frontend Development');
insert into has_skill values ('04727', 'Frontend Development', 4, null);
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Secure Programming');
insert into has_skill values ('04727', 'Secure Programming', 4, null);
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Scrum Management');
insert into has_skill values ('04727', 'Scrum Management', 4, null);
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Escape Rooms');
insert into has_skill values ('04727', 'Escape Rooms', 4, null);
insert into skillmaster values ('04727', 'Shin Tsukimi', 'Running Very Fast');
insert into has_skill values ('04727', 'Running Very Fast', 4, null);


insert into mentor values ('23744', 'Shunsuke Hayasaka');
insert into skillmaster values ('23744', 'Shunsuke Hayasaka', 'Backend Development');
insert into has_skill values ('23744', 'Backend Development', 4, null);
insert into skillmaster values ('23744', 'Shunsuke Hayasaka', 'Frontend Development');
insert into has_skill values ('23744', 'Frontend Development', 4, null);
insert into skillmaster values ('23744', 'Shunsuke Hayasaka', 'Secure Programming');
insert into has_skill values ('23744', 'Secure Programming', 4, null);
insert into skillmaster values ('23744', 'Shunsuke Hayasaka', 'Database Management');
insert into has_skill values ('23744', 'Database Management', 4, null);
insert into skillmaster values ('23744', 'Shunsuke Hayasaka', 'Scrum Management');
insert into has_skill values ('23744', 'Scrum Management', 4, null);

insert into mentor values ('60466', 'Megumi Sasahara');
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Escape Rooms');
insert into has_skill values ('60466', 'Escape Rooms', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Card Game Strategies');
insert into has_skill values ('60466', 'Card Game Strategies', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Backend Development');
insert into has_skill values ('60466', 'Backend Development', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Frontend Development');
insert into has_skill values ('60466', 'Frontend Development', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Secure Programming');
insert into has_skill values ('60466', 'Secure Programming', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Running Very Fast');
insert into has_skill values ('60466', 'Running Very Fast', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Singing, jazz');
insert into has_skill values ('60466', 'Singing, jazz', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Singing, opera');
insert into has_skill values ('60466', 'Singing, opera', 4, null);
insert into skillmaster values ('60466', 'Megumi Sasahara', 'Surrealist Painting');
insert into has_skill values ('60466', 'Surrealist Painting', 4, null);


insert into counselling values ('000001', '44825', '23035', 'Surrealist Painting', '2019-12-12', '2020-01-22');

insert into challenge_event values ('000001', 'PitSoP', '2020-01-24', '44825');
/*insert into score values ('000001', '23035', 'Surrealist Painting', 4);
insert into score values ('000001', '60466', 'Surrealist Painting', 4);
insert into score values ('000001', '48288', 'Surrealist Painting', 3);*/
insert into score values ('000001', 'Surrealist Painting', '44825', '23035', 4, '60466', 4, '48288', 4, null);

insert into challenge_event values ('000002', 'WSWAC', '2020-01-26', '15056');
/*insert into score values ('000002', '48288', 'Frontend Development', 3);
insert into score values ('000002', '04727', 'Frontend Development', 3);
insert into score values ('000002', '23744', 'Frontend Development', 3);*/
insert into score values ('000002', 'Frontend Development', '15056', '48288', 3, '04727', 3, '23744', 3, null);
/*insert into score values ('000002', '48288', 'Secure Programming', 2);
insert into score values ('000002', '04727', 'Secure Programming', 1);
insert into score values ('000002', '23744', 'Secure Programming', 1);*/
insert into score values ('000002', 'Secure Programming', '15056', '48288', 2, '04727', 1, '23744', 1, null);

insert into challenge_event values ('000003', 'CSiTH', '2020-02-02', '61189');
/*insert into score values ('000003', '60466', 'Card Game Strategies', 4);
insert into score values ('000003', '48288', 'Card Game Strategies', 4);
insert into score values ('000003', '36613', 'Card Game Strategies', 4);*/
insert into score values ('000003', 'Card Game Strategies', '61189', '60466', 4, '48288', 4, '36613', 4, null);
/*insert into score values ('000003', '60466', 'Running Very Fast', 4);
insert into score values ('000003', '48288', 'Running Very Fast', 4);
insert into score values ('000003', '36613', 'Running Very Fast', 4);*/
insert into score values ('000003', 'Running Very Fast', '61189', '60466', 4, '48288', 4, '36613', 4, null);

insert into counselling values ('000002', '15056', '04727', 'Secure Programming', '2020-01-31', '2020-02-18');

insert into challenge_event values ('000004', 'FBwiPS', '2020-02-20', '15056');
/*insert into score values ('000004', '36613', 'Running Very Fast', 4);
insert into score values ('000004', '23744', 'Running Very Fast', 4);
insert into score values ('000004', '48288', 'Running Very Fast', 4);*/
insert into score values ('000004', 'Running Very Fast', '15056', '36613', 4, '23744', 4, '48288', 4, null);
/*insert into score values ('000004', '36613', 'Secure Programming', 2);
insert into score values ('000004', '23744', 'Secure Programming', 1);
insert into score values ('000004', '48288', 'Secure Programming', 1);*/
insert into score values ('000004', 'Secure Programming', '15056', '36613', 2, '23744', 3, '48288', 3, null);
/*insert into score values ('000004', '36613', 'Backend Development', 4);
insert into score values ('000004', '23744', 'Backend Development', 3);
insert into score values ('000004', '48288', 'Backend Development', 3);*/
insert into score values ('000004', 'Backend Development', '15056', '36613', 4, '23744', 3, '48288', 3, null);

insert into counselling values ('000003', '15056', '04727', 'Scrum Management', '2020-02-24', null);

insert into counselling values ('000004', '00769', '61189', 'Running Very Fast', '2020-03-01', '2020-04-06');
/*This query should only work if updating occurs correctly!*/



SELECT DISTINCT user_id, skill_name, grade, challenge_inst_id
FROM earns_cert natural join has_skill
WHERE earns_cert.user_id = '15056'
ORDER BY challenge_inst_id;

SELECT trainee.user_id, trainee.name, has_skill.skill_name, has_skill.grade, has_skill.challenge_inst_id
FROM trainee right outer join has_skill on has_skill.user_id = trainee.user_id
ORDER BY trainee.user_id;

SELECT DISTINCT session_id, trainee_id, trainee.name, skmaster_id, skillmaster.name, counselling.skill_name, date_beginning, date_ending 
FROM counselling join trainee on trainee.user_id = counselling.trainee_id join skillmaster on skillmaster.user_id = counselling.skmaster_id
ORDER BY date_beginning;






