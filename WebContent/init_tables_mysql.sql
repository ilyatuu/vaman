/* 
 * Name: mysql_init.sql
 * Created by: Isaac Lya2
 * Email: ilyatuu@gmail.com
 * Date: Feb 9th, 2018 
 * Purpose: Run this to initialize mysql tables for the va dashboard management app to run.
 * Run this once. This script will reset all tables for the va dashboard management app. 
 * DO NOT RUN this script if there exist data in the dashboard. This is because it will re-set all users and data
 * including va already coded.
 * */


DROP TABLE IF EXISTS _web_assignment,_web_messages,_web_users,_web_roles;
DROP TABLE IF EXISTS _web_icd10,_web_icd10_category;


-- create tables
CREATE TABLE _web_roles
(
  roleid integer NOT NULL,
  rolename character varying(50),
  CONSTRAINT _unique_role_id PRIMARY KEY (roleid),
  CONSTRAINT _unique_role_name UNIQUE (rolename)
);

INSERT INTO _web_roles(roleid,rolename) VALUES 
(0,'Read Only'),(1,'Data Manager'),(2,'Coder'),(3,'Administrator'),(4,'Mobile User');

CREATE TABLE _web_users
(
  username character varying(50),
  fullname character varying(50),
  password character varying(255),
  loginsession character varying(255),
  lastlogin timestamp,
  phone character varying(25),
  roleid integer,
  api_key integer,
  organization character varying(25),
  isActive tinyint(1) DEFAULT '1',
  id integer NOT NULL AUTO_INCREMENT,
  CONSTRAINT _web_users_pkey PRIMARY KEY (id),
  CONSTRAINT _web_users_roles FOREIGN KEY (roleid)
      REFERENCES _web_roles (roleid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT _web_users_username UNIQUE (username)
);

INSERT INTO `_web_users` (`username`, `fullname`, `password`, `loginsession`, `lastlogin`, `phone`, `roleid`, `organization`, `id`, `api_key`, `isActive`)
VALUES
	('admin','Administrator','0b554fcaea72b25879ffb1f9e51278c1','4578FA30473075558E9FEBA8043A4C95','2018-05-16 03:40:16','0678556677',3,'MoH',1,123456,1);

CREATE TABLE _web_notifications (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  notif_id varchar(10) DEFAULT NULL COMMENT 'notification id',
  notif_date datetime DEFAULT NULL COMMENT 'notification date',
  notif_by varchar(50) DEFAULT NULL COMMENT 'notified by name',
  notif_phone varchar(13) DEFAULT NULL COMMENT 'notified by phone',
  notif_method varchar(4) DEFAULT NULL COMMENT 'Notification method, PHONE, WEB',
  event_fname varchar(50) DEFAULT NULL,
  event_lname varchar(50) DEFAULT NULL,
  event_type varchar(5) DEFAULT NULL COMMENT 'notification type, BIRTH or DEATH',
  event_date datetime DEFAULT NULL,
  loc_level1 varchar(25) DEFAULT NULL,
  loc_level2 varchar(25) DEFAULT NULL,
  loc_level3 varchar(25) DEFAULT NULL,
  loc_details varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY `notification_id` (notif_id)
);

CREATE TABLE _web_messages
(
  id integer NOT NULL AUTO_INCREMENT,
  msg_from integer, -- references user id
  msg_to integer, -- references user id
  msg_date timestamp,
  msg_text character varying(1000),
  msg_va character varying(80), -- references va uri
  CONSTRAINT message_unique_id PRIMARY KEY (id),
  CONSTRAINT message_from_user FOREIGN KEY (msg_from)
      REFERENCES _web_users (id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT message_to_user FOREIGN KEY (msg_to)
      REFERENCES _web_users (id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE _web_icd10_category
(
  id integer NOT NULL AUTO_INCREMENT,
  name character varying(50),
  CONSTRAINT category_id PRIMARY KEY (id)
);


-- Insert
INSERT INTO _web_icd10_category(name) VALUES
('Communicable or notifiable diseases'),
('Trauma and Injury'),
('Non Communicable Diseases'),
('Gastro Intestinal Track'),
('Neonatal Conditions'),
('Maternal Deaths'),
('Toxic effects of substances chiefly non medicinal '),
('Poisoning by drugs, medicaments and biological sub'),
('Burns and corrosion of multiple and unspecified bo'),
('Other and unspecified effects of exgternal causes'),
('Complications of surgical and medical care, not el'),
('Assault'),
('Transport accidents'),
('Others');

CREATE TABLE _web_icd10
(
  id integer NOT NULL AUTO_INCREMENT,
  icdcode character varying(25),
  icdname character varying(255),
  category_id integer,
  CONSTRAINT primary_key_icd10 PRIMARY KEY (id),
  CONSTRAINT icd10_category FOREIGN KEY (category_id)
      REFERENCES _web_icd10_category (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- insert icd10
INSERT INTO _web_icd10 (icdcode, icdname, category_id) 
VALUES
('A00', 'Cholera', 1),
('A01', 'Typhoid fever (salmonellosis)', 1),
('A01', 'Typhoid', 1),
('A06', 'Dysentery Acute/Chronic', 1),
('A09', 'Diarrhoea', 1),
('A15', 'TB Confirmed', 1),
('A16', 'TB Not confirmed', 1),
('A20', 'Plague', 1),
('A33', 'Tetanus, Neonatal', 1),
('A41', 'Septicaemia', 1),
('A75', 'Relapsing Fever (Louse borne Typhus)', 1),
('B05', 'Measles', 1),
('B24', 'HIV and AIDS', 1),
('B45', 'Meningitis Cryptococal', 1),
('B53', 'Malaria confirmed', 1),
('B54', 'Malaria presumptive', 1),
('C80', 'Neoplasm', 1),
('G03', 'Meningitis', 1),
('G04', 'Encephalitis', 1),
('G83', 'Acute Flaccid Paralysis', 1),
('I50', 'Heart failure', 1),
('J06', 'Respiratory Infection Acute (ARI)', 1),
('J18', 'Pneumonia', 1),
('J45', 'Asthma', 1),
('J81', 'Pulmonary oedema', 1),
('J98', 'Pneumopathies', 1),
('K75', 'Hepatitis', 1),
('L08', 'Skin infections', 1),
('R09', 'Pleurisy (non-Tuberculosis)', 1),
('R50', 'Fever Chronic (> 1 month)', 1),
('S09', 'Head injury', 2),
('S36', 'Ruptured spleen', 2),
('T14', 'Fractures', 2),
('T14.9', 'Trauma Other', 2),
('T30', 'Burns', 2),
('C22', 'Cancer Liver', 3),
('C46', 'Kaposi''s sarcoma', 3),
('C50', 'Cancer Breast', 3),
('C55', 'Cancer Uterine', 3),
('C61', 'Cancer Prostate', 3),
('C80', 'Tumours Other malignant', 3),
('D48', 'Tumours Other non-malignant', 3),
('E14', 'Diabetes', 3),
('I10', 'Hypertension', 3),
('I42', 'Cardiomyopathy', 3),
('I64', 'Cerebrovascular accident', 3),
('A80', 'Acute Flacid Paralysis (polio)', 4),
('K25', 'Ulcer, gastro-duodenal', 4),
('K29', 'Gastritis', 4),
('K37', 'Appendicitis', 4),
('K46', 'Hernia', 4),
('K56', 'Intestinal occlusion', 4),
('K65', 'Peritonitis (non-Tuberculosis)', 4),
('K74', 'Cirrhosis of the liver', 4),
('K75', 'Hepatitis', 4),
('K92', 'Digestive tract Haemorrhages', 4),
('M86', 'Bone infections (including osteomyelitis)', 4),
('M89', 'Bone and joint disease other', 4),
('N04', 'Nephrotic syndrome', 4),
('N05', 'Glomerulonephritis', 4),
('N15', 'Kidney infections', 4),
('N39', 'Urinary tract infections', 4),
('N94', 'Gynecological problems', 4),
('B24', 'Paediatric AIDS', 5),
('P05', 'Low birth weight or Prematurity Complication', 5),
('P15', 'Birth trauma', 5),
('P21', 'Neonatal Asphyxia', 5),
('P22', 'Respiratory distress', 5),
('P23', 'Pneumonia', 5),
('P36', 'Neonatal Septicaemia', 5),
('P37', 'Malaria', 5),
('P54', 'Haemorrhage', 5),
('P74', 'Dehydration', 5),
('P78', 'Diarrhoea', 5),
('P95', 'Stillbirth (fresh)', 5),
('P95', 'Stillbirth (macerated)', 5),
('P95', 'Stillbirth', 5),
('Q05', 'Congenital hydrocephalus and spinal bifida', 5),
('Q24', 'Congenital malformation of the heart', 5),
('Q89', 'Other congenital malformation', 5),
('R95', 'Sudden infant death syndrome', 5),
('X49', 'Accidental poisoning by and exposure to noxious substances', 5),
('Y09', 'Assault', 5),
('O06', 'Abortion', 6),
('O16/O15', 'Severe Hypertension in pregnancy/ eclampsia', 6),
('O46', 'Antepartum Haemorrhage', 6),
('O66', 'Obstructed Labour', 6),
('O71', 'Rupture uterus', 6),
('O72', 'Post-partum haemorrhage', 6),
('O75', 'Unknown fever', 6),
('O75', 'Local herbs', 6),
('O85', 'Puerperal Sepsis /Septicaemia', 6),
('O98', 'Malaria in pregnancy', 6),
('O99', 'Pneumonia', 6),
('O99', 'Anaemia in Pregnancy', 6),
('O99', 'Pulmonary oedema', 6),
('O99', 'Meningitis', 6),
('O99.4', 'Cardiomyopathy', 6),
('Z21', 'Asymptomatic HIV', 6),
('T29', 'Burns and corrosions of multiple body regions', 7),
('T30', 'Burn and corrosion, body region unspecified', 7),
('T31', 'Burns classified according to extent of body surface involved', 7),
('T32', 'Corrosions classified according to extent of body surface involved', 7),
('T50', 'Poisoning by diuretics and other unspecified drugs, medicaments and biological substances', 8),
('T51', 'Toxic effect of alcohol', 9),
('T54', 'Toxic effect of corrosive substances', 9),
('T56', 'Toxic effect of metals', 9),
('T58', 'Toxic effect of carbon monoxide', 9),
('T59', 'Toxic effect of other gases, fumes and vapours', 9),
('T60', 'Toxic effect of pesticides', 9),
('T65', 'Toxic effect of other and unspecified substances', 9),
('T67', 'Effects of heat and light', 10),
('T70', 'Effects of air pressure and water pressure', 10),
('T71', 'Asphyxiation', 10),
('T80', 'Complications following infusion, transfusion and therapeutic injection', 11),
('T81', 'Complications of procedures, not elsewhere classified', 11),
('T83', 'Complications of genitourinary devices, implants and grafts', 11),
('Y08', 'Assault by other specified means', 12),
('Y09', 'Assault by other unspecified means', 12),
('V98', 'Other Specified transport accidents', 13),
('V99', 'Unspecified transport accidents', 13),
('V99', 'Test ICD 10 Value', 5);


CREATE TABLE _web_assignment
(
  va_uri character varying(80),
  coder1_assigned_date timestamp,
  coder1_completed_date timestamp,
  coder1_coda integer,
  coder1_codb integer,
  coder1_codc integer,
  coder1_codd integer,
  coder2_assigned_date timestamp,
  coder2_completed_date timestamp,
  coder2_coda integer,
  coder2_codb integer,
  coder2_codc integer,
  coder2_codd integer,
  coder1_comments character varying(1000),
  coder2_comments character varying(1000),
  id integer NOT NULL AUTO_INCREMENT,
  coder1_id integer,
  coder2_id integer,
  CONSTRAINT assignment_primary_key PRIMARY KEY (id),
  CONSTRAINT unique_uri UNIQUE (va_uri)
);