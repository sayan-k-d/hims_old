#
# TABLE STRUCTURE FOR: ambulance_call
#

DROP TABLE IF EXISTS `ambulance_call`;

CREATE TABLE `ambulance_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `call_from` varchar(200) NOT NULL,
  `call_to` varchar(200) NOT NULL,
  `charge_category_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `standard_charge` int(11) DEFAULT NULL,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `discount` float(10,2) DEFAULT 0.00,
  `tax_percentage` float(10,2) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `net_amount` float(10,2) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `generated_by` (`generated_by`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `charge_id` (`charge_id`),
  KEY `idx_contact_no` (`contact_no`),
  KEY `idx_vehicle_model` (`vehicle_model`),
  KEY `idx_driver` (`driver`),
  KEY `index_date` (`date`),
  KEY `index_call_from` (`call_from`),
  KEY `index_call_to` (`call_to`),
  KEY `index_charge_category_id` (`charge_category_id`),
  KEY `index_standard_charge` (`standard_charge`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_discount` (`discount`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_amount` (`amount`),
  KEY `index_net_amount` (`net_amount`),
  CONSTRAINT `ambulance_call_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ambulance_call_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ambulance_call_ibfk_3` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ambulance_call_ibfk_4` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ambulance_call_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ambulance_call_ibfk_6` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: annual_calendar
#

DROP TABLE IF EXISTS `annual_calendar`;

CREATE TABLE `annual_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_type` int(11) NOT NULL COMMENT '1 for holiday , 2 for activity , 3 for vacation',
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `description` text NOT NULL COMMENT 'Holiday Description',
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT '1 for active 0 for inactive',
  `holiday_color` varchar(200) NOT NULL,
  `front_site` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_holiday_type` (`holiday_type`),
  KEY `idx_created_by` (`created_by`),
  KEY `index_from_date` (`from_date`) USING BTREE,
  KEY `index_to_date` (`to_date`) USING BTREE,
  CONSTRAINT `annual_calendar_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: antenatal_examine
#

DROP TABLE IF EXISTS `antenatal_examine`;

CREATE TABLE `antenatal_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_examine_id` int(11) NOT NULL,
  `visit_details_id` int(11) DEFAULT NULL,
  `ipdid` int(11) DEFAULT NULL,
  `uter_size` varchar(250) DEFAULT NULL,
  `uterus_size` varchar(250) DEFAULT NULL,
  `presentation_position` varchar(250) DEFAULT NULL,
  `brim_presentation` varchar(250) DEFAULT NULL,
  `foeta_heart` varchar(250) DEFAULT NULL,
  `blood_pressure` varchar(250) DEFAULT NULL,
  `antenatal_oedema` varchar(250) DEFAULT NULL,
  `antenatal_weight` varchar(250) DEFAULT NULL,
  `urine_sugar` varchar(250) DEFAULT NULL,
  `urine` varchar(250) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `next_visit` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `visit_details_id` (`visit_details_id`),
  KEY `ipdid` (`ipdid`),
  KEY `index_uter_size` (`uter_size`),
  KEY `index_uterus_size` (`uterus_size`),
  KEY `index_presentation_position` (`presentation_position`),
  KEY `index_brim_presentation` (`brim_presentation`),
  KEY `index_foeta_heart` (`foeta_heart`),
  KEY `index_blood_pressure` (`blood_pressure`),
  KEY `index_antenatal_oedema` (`antenatal_oedema`),
  KEY `index_antenatal_weight` (`antenatal_weight`),
  KEY `index_urine_sugar` (`urine_sugar`),
  KEY `index_urine` (`urine`),
  KEY `primary_examine_id` (`primary_examine_id`),
  CONSTRAINT `antenatal_examine_ibfk_1` FOREIGN KEY (`visit_details_id`) REFERENCES `visit_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `antenatal_examine_ibfk_2` FOREIGN KEY (`ipdid`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `antenatal_examine_ibfk_3` FOREIGN KEY (`primary_examine_id`) REFERENCES `primary_examine` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: appoint_priority
#

DROP TABLE IF EXISTS `appoint_priority`;

CREATE TABLE `appoint_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appoint_priority` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_appoint_priority` (`appoint_priority`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (1, 'Normal', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (2, 'Urgent', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (3, 'Very Urgent', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (5, 'Low', '2021-09-24 13:28:40');


#
# TABLE STRUCTURE FOR: appointment
#

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `visit_details_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `priority` varchar(100) NOT NULL,
  `specialist` varchar(100) NOT NULL,
  `doctor` int(11) DEFAULT NULL,
  `amount` varchar(200) NOT NULL,
  `message` text DEFAULT NULL,
  `appointment_status` varchar(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `is_opd` varchar(10) NOT NULL,
  `is_ipd` varchar(10) NOT NULL,
  `doctor_shift_time_id` int(11) DEFAULT NULL,
  `doctor_global_shift_id` int(11) DEFAULT NULL,
  `is_queue` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `rejected_time` datetime DEFAULT NULL,
  `live_consult` varchar(50) DEFAULT NULL,
  `live_consult_link` int(11) NOT NULL DEFAULT 1 COMMENT '1 (link created) 0 (not created)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor` (`doctor`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `visit_details_id` (`visit_details_id`),
  KEY `doctor_shift_time_id` (`doctor_shift_time_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`visit_details_id`) REFERENCES `visit_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`doctor_shift_time_id`) REFERENCES `doctor_shift_time` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `appointment` (`id`, `patient_id`, `case_reference_id`, `visit_details_id`, `date`, `priority`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `is_opd`, `is_ipd`, `doctor_shift_time_id`, `doctor_global_shift_id`, `is_queue`, `created_time`, `rejected_time`, `live_consult`, `live_consult_link`, `created_at`) VALUES (1, 8, 8, 5, '2025-07-07 11:00:00', '1', '', 12, '', '', 'approved', 'Offline', '', '', 1, 1, 1, NULL, NULL, 'no', 1, '2025-07-02 08:51:24');
INSERT INTO `appointment` (`id`, `patient_id`, `case_reference_id`, `visit_details_id`, `date`, `priority`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `is_opd`, `is_ipd`, `doctor_shift_time_id`, `doctor_global_shift_id`, `is_queue`, `created_time`, `rejected_time`, `live_consult`, `live_consult_link`, `created_at`) VALUES (2, 13, 9, 6, '2025-07-02 19:30:00', '1', '', 12, '', '', 'approved', 'Offline', '', '', 3, 3, 0, NULL, NULL, 'no', 1, '2025-07-02 09:01:40');


#
# TABLE STRUCTURE FOR: appointment_payment
#

DROP TABLE IF EXISTS `appointment_payment`;

CREATE TABLE `appointment_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `standard_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `tax` float(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` float(10,2) NOT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `charge_id` (`charge_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `index_standard_amount` (`standard_amount`),
  KEY `index_tax` (`tax`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_paid_amount` (`paid_amount`),
  KEY `index_payment_mode` (`payment_mode`),
  KEY `index_payment_type` (`payment_type`),
  CONSTRAINT `appointment_payment_ibfk_2` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_payment_ibfk_3` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `appointment_payment` (`id`, `appointment_id`, `charge_id`, `standard_amount`, `tax`, `discount_percentage`, `paid_amount`, `payment_mode`, `payment_type`, `transaction_id`, `note`, `date`, `created_at`) VALUES (1, 1, 5, '400.00', '0.00', '0.00', '400.00', NULL, 'Offline', NULL, NULL, '2025-07-02 08:51:24', '2025-07-02 08:51:24');
INSERT INTO `appointment_payment` (`id`, `appointment_id`, `charge_id`, `standard_amount`, `tax`, `discount_percentage`, `paid_amount`, `payment_mode`, `payment_type`, `transaction_id`, `note`, `date`, `created_at`) VALUES (2, 2, 5, '400.00', '0.00', '0.00', '400.00', NULL, 'Offline', NULL, NULL, '2025-07-02 09:01:40', '2025-07-02 09:01:40');


#
# TABLE STRUCTURE FOR: appointment_queue
#

DROP TABLE IF EXISTS `appointment_queue`;

CREATE TABLE `appointment_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `date` date NOT NULL DEFAULT '2021-01-11',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `staff_id` (`staff_id`),
  KEY `global_shift_id` (`shift_id`),
  CONSTRAINT `appointment_queue_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_queue_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_queue_ibfk_3` FOREIGN KEY (`shift_id`) REFERENCES `doctor_shift_time` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `appointment_queue` (`id`, `appointment_id`, `staff_id`, `position`, `shift_id`, `date`, `created_at`) VALUES (1, 1, 12, 1, 1, '2025-07-07', '2025-07-02 08:55:10');


#
# TABLE STRUCTURE FOR: bed
#

DROP TABLE IF EXISTS `bed`;

CREATE TABLE `bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int(11) DEFAULT NULL,
  `bed_group_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `bed_type_id` (`bed_type_id`),
  KEY `bed_group_id` (`bed_group_id`),
  KEY `index_name` (`name`),
  CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bed_ibfk_2` FOREIGN KEY (`bed_group_id`) REFERENCES `bed_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bed_ibfk_3` FOREIGN KEY (`bed_group_id`) REFERENCES `bed_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (1, 'Bed 1', 1, 1, 'no', '2025-07-01 14:05:23');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (2, 'Bed 2', 1, 1, 'no', '2025-07-01 14:05:32');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (3, 'Bed 3', 2, 1, 'yes', '2025-07-01 14:05:50');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (4, 'Bed 4', 2, 1, 'yes', '2025-07-01 14:06:02');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (5, 'Bed 5', 3, 2, 'no', '2025-07-01 14:06:12');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (6, 'Bed 6', 3, 2, 'yes', '2025-07-01 14:06:23');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (7, 'Bed 7', 3, 2, 'yes', '2025-07-01 14:06:31');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (8, 'Bed 8', 4, 2, 'yes', '2025-07-01 14:06:41');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`, `created_at`) VALUES (9, 'Bed 9', 1, 3, 'no', '2025-07-01 14:06:55');


#
# TABLE STRUCTURE FOR: bed_group
#

DROP TABLE IF EXISTS `bed_group`;

CREATE TABLE `bed_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '#f4f4f4',
  `description` text NOT NULL,
  `floor` int(11) NOT NULL,
  `bed_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `bed_group` (`id`, `name`, `color`, `description`, `floor`, `bed_cost`, `is_active`, `created_at`) VALUES (1, 'General Ward', '#f4f4f4', '', 2, '0.00', 0, '2025-07-01 14:03:56');
INSERT INTO `bed_group` (`id`, `name`, `color`, `description`, `floor`, `bed_cost`, `is_active`, `created_at`) VALUES (2, 'ICU (Intensive Care Unit)', '#bababa', '', 1, '0.00', 0, '2025-07-01 14:04:13');
INSERT INTO `bed_group` (`id`, `name`, `color`, `description`, `floor`, `bed_cost`, `is_active`, `created_at`) VALUES (3, 'Day Care Unit', '#f4f4f4', '', 2, '0.00', 0, '2025-07-01 14:04:36');


#
# TABLE STRUCTURE FOR: bed_type
#

DROP TABLE IF EXISTS `bed_type`;

CREATE TABLE `bed_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `bed_type` (`id`, `name`, `created_at`) VALUES (1, 'Standard Bed', '2025-07-01 14:04:46');
INSERT INTO `bed_type` (`id`, `name`, `created_at`) VALUES (2, 'Electric Bed', '2025-07-01 14:04:53');
INSERT INTO `bed_type` (`id`, `name`, `created_at`) VALUES (3, 'ICU Bed (with monitors)', '2025-07-01 14:05:01');
INSERT INTO `bed_type` (`id`, `name`, `created_at`) VALUES (4, 'Ventilator-Supported Bed', '2025-07-01 14:05:07');


#
# TABLE STRUCTURE FOR: bill
#

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `attachment` mediumtext DEFAULT NULL,
  `attachment_name` mediumtext DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: birth_report
#

DROP TABLE IF EXISTS `birth_report`;

CREATE TABLE `birth_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_name` varchar(200) NOT NULL,
  `child_pic` text NOT NULL,
  `gender` varchar(200) NOT NULL,
  `birth_date` datetime DEFAULT NULL,
  `weight` varchar(200) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `mother_pic` text NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `father_pic` text NOT NULL,
  `birth_report` mediumtext DEFAULT NULL,
  `document` text NOT NULL,
  `address` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `patient_id` (`patient_id`),
  KEY `index_child_name` (`child_name`),
  KEY `index_gender` (`gender`),
  KEY `index_weight` (`weight`),
  KEY `index_contact` (`contact`),
  CONSTRAINT `birth_report_ibfk_1` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `birth_report_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: blood_bank_products
#

DROP TABLE IF EXISTS `blood_bank_products`;

CREATE TABLE `blood_bank_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_blood_group` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (1, 'O+', 1, '2025-07-02 05:35:29');
INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (2, 'A+', 1, '2025-07-02 05:35:41');
INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (3, 'B+', 1, '2025-07-02 05:36:44');
INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (4, 'AB+', 1, '2025-07-02 05:37:04');
INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (5, 'O-', 1, '2025-07-02 05:37:15');
INSERT INTO `blood_bank_products` (`id`, `name`, `is_blood_group`, `created_at`) VALUES (6, 'AB-', 1, '2025-07-02 05:37:25');


#
# TABLE STRUCTURE FOR: blood_donor
#

DROP TABLE IF EXISTS `blood_donor`;

CREATE TABLE `blood_donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `blood_bank_product_id` int(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `blood_bank_product_id` (`blood_bank_product_id`),
  KEY `index_donor_name` (`donor_name`),
  KEY `index_gender` (`gender`),
  KEY `index_father_name` (`father_name`),
  KEY `index_contact_no` (`contact_no`),
  CONSTRAINT `blood_donor_ibfk_1` FOREIGN KEY (`blood_bank_product_id`) REFERENCES `blood_bank_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `blood_donor` (`id`, `donor_name`, `date_of_birth`, `blood_bank_product_id`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (1, 'Arjun Mehra	', '1994-02-22', 2, 'Male', 'Rajesh Mehra	', '12/A Park Lane, New Delhi	', '+91-9812345670', '2025-07-02 08:37:03');
INSERT INTO `blood_donor` (`id`, `donor_name`, `date_of_birth`, `blood_bank_product_id`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (2, 'Sneha Gupta', '1999-05-12', 3, 'Female', 'Vinod Gupta	', '45 Vivekananda Road, Kolkata	', '+91-9900112233', '2025-07-02 08:43:34');
INSERT INTO `blood_donor` (`id`, `donor_name`, `date_of_birth`, `blood_bank_product_id`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (3, 'Jamuna Sen', '2005-07-02', 1, 'Female', '', '	12/A Park Lane, Kolkata', '7890123568', '2025-07-02 09:41:18');


#
# TABLE STRUCTURE FOR: blood_donor_cycle
#

DROP TABLE IF EXISTS `blood_donor_cycle`;

CREATE TABLE `blood_donor_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_donor_cycle_id` int(11) NOT NULL,
  `blood_bank_product_id` int(11) DEFAULT NULL,
  `blood_donor_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `donate_date` date DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `standard_charge` float(10,2) DEFAULT NULL,
  `apply_charge` float(10,2) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `institution` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `tax_percentage` float(10,2) DEFAULT 0.00,
  `volume` varchar(100) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `blood_bank_product_id` (`blood_bank_product_id`),
  KEY `blood_donor_id` (`blood_donor_id`),
  KEY `charge_id` (`charge_id`),
  KEY `index_bag_no` (`bag_no`),
  KEY `index_lot` (`lot`),
  KEY `index_amount` (`amount`),
  KEY `index_unit` (`unit`),
  KEY `index_volume` (`volume`),
  KEY `index_quantity` (`quantity`),
  KEY `index_standard_charge` (`standard_charge`),
  KEY `index_apply_charge` (`apply_charge`),
  CONSTRAINT `blood_donor_cycle_ibfk_1` FOREIGN KEY (`blood_bank_product_id`) REFERENCES `blood_bank_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_donor_cycle_ibfk_2` FOREIGN KEY (`blood_donor_id`) REFERENCES `blood_donor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_donor_cycle_ibfk_3` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `blood_donor_cycle` (`id`, `blood_donor_cycle_id`, `blood_bank_product_id`, `blood_donor_id`, `charge_id`, `donate_date`, `bag_no`, `lot`, `quantity`, `standard_charge`, `apply_charge`, `amount`, `institution`, `note`, `discount_percentage`, `tax_percentage`, `volume`, `unit`, `available`, `created_at`) VALUES (1, 0, 3, 2, 6, '2025-07-02', 'BGN0725201', 'LOTA2301', 1, '400.00', '400.00', '400.00', '', '', '0.00', '0.00', '450 ml', 1, 0, '2025-07-02 09:22:23');
INSERT INTO `blood_donor_cycle` (`id`, `blood_donor_cycle_id`, `blood_bank_product_id`, `blood_donor_id`, `charge_id`, `donate_date`, `bag_no`, `lot`, `quantity`, `standard_charge`, `apply_charge`, `amount`, `institution`, `note`, `discount_percentage`, `tax_percentage`, `volume`, `unit`, `available`, `created_at`) VALUES (2, 0, 1, 3, 6, '2025-07-02', 'BGN0725202', 'LOTA2302', 1, '400.00', '400.00', '400.00', '', '', '0.00', '0.00', '450ml', 1, 1, '2025-07-02 09:42:11');
INSERT INTO `blood_donor_cycle` (`id`, `blood_donor_cycle_id`, `blood_bank_product_id`, `blood_donor_id`, `charge_id`, `donate_date`, `bag_no`, `lot`, `quantity`, `standard_charge`, `apply_charge`, `amount`, `institution`, `note`, `discount_percentage`, `tax_percentage`, `volume`, `unit`, `available`, `created_at`) VALUES (3, 0, 2, 1, 6, '2025-07-02', 'BGN0725203', 'LOTA2303', 1, '400.00', '400.00', '400.00', '', '', '0.00', '0.00', '450 ml', 1, 1, '2025-07-02 09:54:09');


#
# TABLE STRUCTURE FOR: blood_issue
#

DROP TABLE IF EXISTS `blood_issue`;

CREATE TABLE `blood_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `blood_donor_cycle_id` int(11) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `hospital_doctor` int(11) DEFAULT NULL,
  `reference` text DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `standard_charge` int(11) NOT NULL,
  `tax_percentage` float(10,2) NOT NULL,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `amount` float(10,2) DEFAULT NULL,
  `net_amount` float(10,2) NOT NULL,
  `institution` text DEFAULT NULL,
  `technician` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `insurance_validity` date DEFAULT NULL,
  `insurance_id` varchar(250) DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `blood_donor_cycle_id` (`blood_donor_cycle_id`),
  KEY `patient_id` (`patient_id`),
  KEY `charge_id` (`charge_id`),
  KEY `generated_by` (`generated_by`),
  KEY `organisation_id` (`organisation_id`),
  KEY `index_standard_charge` (`standard_charge`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_amount` (`amount`),
  KEY `index_net_amount` (`net_amount`),
  KEY `hospital_doctor` (`hospital_doctor`),
  CONSTRAINT `blood_issue_ibfk_1` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_2` FOREIGN KEY (`blood_donor_cycle_id`) REFERENCES `blood_donor_cycle` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_4` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_5` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_6` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blood_issue_ibfk_7` FOREIGN KEY (`hospital_doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `blood_issue` (`id`, `patient_id`, `case_reference_id`, `blood_donor_cycle_id`, `date_of_issue`, `hospital_doctor`, `reference`, `charge_id`, `standard_charge`, `tax_percentage`, `discount_percentage`, `amount`, `net_amount`, `institution`, `technician`, `remark`, `organisation_id`, `insurance_validity`, `insurance_id`, `generated_by`, `created_at`) VALUES (1, 4, NULL, 1, '2025-07-02 14:59:00', 5, 'Sandeep Sharma (D004)', 6, 700, '0.00', '0.00', '700.00', '700.00', NULL, '', '', NULL, NULL, NULL, 1, '2025-07-02 09:29:58');


#
# TABLE STRUCTURE FOR: captcha
#

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (1, 'userlogin', 0, '2021-10-22 05:21:32');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (2, 'login', 0, '2021-10-22 05:21:38');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (3, 'appointment', 0, '2021-10-22 05:21:40');


#
# TABLE STRUCTURE FOR: case_references
#

DROP TABLE IF EXISTS `case_references`;

CREATE TABLE `case_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `discount_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_references_ibfk_1` (`bill_id`),
  CONSTRAINT `case_references_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (1, NULL, '0.00', '2025-06-17 19:50:10');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (2, NULL, '0.00', '2025-07-01 14:10:46');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (3, NULL, '0.00', '2025-07-01 14:13:49');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (4, NULL, '0.00', '2025-07-02 04:58:25');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (5, NULL, '0.00', '2025-07-02 05:02:27');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (6, NULL, '0.00', '2025-07-02 05:04:04');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (7, NULL, '0.00', '2025-07-02 06:11:40');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (8, NULL, '0.00', '2025-07-02 08:51:24');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (9, NULL, '0.00', '2025-07-02 09:01:40');
INSERT INTO `case_references` (`id`, `bill_id`, `discount_percentage`, `created_at`) VALUES (10, NULL, '0.00', '2025-07-02 10:47:34');


#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text DEFAULT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` text NOT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = patients',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_patient_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`, `updated_at`, `created_at`) VALUES (12, 'Sample Patient File Cover', '<table class=\"table table-bordered\" width=\"100%\">\r\n <tr>\r\n  <td width=\"50%\">Patient Name  </td>\r\n  <td width=\"50%\">[name] ([patient_id]) </td>\r\n </tr>\r\n <tr>\r\n  <td>Date of birth</td>\r\n  <td valign=\"top\">[dob]</td>\r\n </tr>\r\n <tr>\r\n  <td>Age</td>\r\n  <td valign=\"top\">[age]</td>\r\n </tr>\r\n <tr>\r\n  <td>Gender</td>\r\n  <td valign=\"top\">[gender]</td>\r\n </tr>\r\n \r\n <tr>\r\n  <td>Phone</td>\r\n  <td valign=\"top\">[phone]</td>\r\n </tr>\r\n <tr>\r\n  <td>Guardian Name</td>\r\n  <td valign=\"top\">[guardian_name]</td>\r\n </tr>\r\n <tr>\r\n  <td>Address</td>\r\n  <td valign=\"top\">[address]</td>\r\n </tr>\r\n <tr>\r\n  <td>Email</td>\r\n  <td valign=\"top\">[email]</td>\r\n </tr>\r\n <tr>\r\n  <td>OPD/IPD NO</td>\r\n  <td valign=\"top\">[opd_ipd_no]</td>\r\n </tr>\r\n  <tr>\r\n  <td>OPD Checkup Id</td>\r\n  <td valign=\"top\">[opd_checkup_id]</td>\r\n </tr>\r\n <tr>\r\n  <td>Consultant Doctor</td>\r\n  <td valign=\"top\">[consultant_doctor]</td>\r\n </tr>\r\n</table>', '<h2>Patient Detail</h2>', '', '', '', '', '', 'certificate.jpg', 2, 1, 140, 300, 700, 600, 1, 200, NULL, '2021-10-28 22:58:45');


#
# TABLE STRUCTURE FOR: charge_categories
#

DROP TABLE IF EXISTS `charge_categories`;

CREATE TABLE `charge_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_type_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `short_code` varchar(30) DEFAULT NULL,
  `is_default` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `charge_type_id` (`charge_type_id`),
  KEY `index_name` (`name`),
  CONSTRAINT `charge_categories_ibfk_1` FOREIGN KEY (`charge_type_id`) REFERENCES `charge_type_master` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (1, 2, 'OPD Doctor Fees', 'OPD Doctor Fees', NULL, '', '2025-07-02 07:06:35');
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (2, 4, 'Pathology Fees', 'Pathology Fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (3, 5, 'Radiology Fees', 'Radiology Fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (4, 3, 'IPD Doctor Fees', 'IPD Doctor Fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (5, 1, 'Appointment Fees', 'app fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (6, 6, 'Blood Bank Charges', 'Blood Bank Charges', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (7, 3, 'Bed Charges', 'Bed Charges', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (8, 7, 'Ambulance Fees', 'Ambulance Fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (9, 8, 'Specialist Consultation Fees', 'Specialist Consultation Fees', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (10, 8, 'Nebulization', 'Nebulization', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (11, 10, 'Medical Consumables', 'Medical Consumables', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (12, 10, 'Hospital Equipment', 'Hospital Equipment', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (13, 11, 'Surgeon’s Fee', 'Surgeon’s Fee', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (14, 11, 'Anesthesia Charges', 'Anesthesia Charges', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (15, 11, 'OT Charges	', 'OT Charges	', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (16, 12, 'Registration Charges	', 'Registration Charges	', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (17, 12, 'Late Discharge Charges	', 'Late Discharge Charges	', NULL, '', NULL);
INSERT INTO `charge_categories` (`id`, `charge_type_id`, `name`, `description`, `short_code`, `is_default`, `created_at`) VALUES (18, 12, 'Utility Charges	', 'Utility Charges	', NULL, '', NULL);


#
# TABLE STRUCTURE FOR: charge_type_master
#

DROP TABLE IF EXISTS `charge_type_master`;

CREATE TABLE `charge_type_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_type` varchar(200) NOT NULL,
  `is_default` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_charge_type` (`charge_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (1, 'Appointment', 'yes', 'yes', '2021-09-24 14:10:32');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (2, 'OPD', 'yes', 'yes', '2021-09-24 14:10:02');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (3, 'IPD', 'yes', 'yes', '2021-09-24 14:10:47');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (4, 'Pathology', 'yes', 'yes', '2021-10-22 21:40:03');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (5, 'Radiology', 'yes', 'yes', '2021-10-22 22:10:21');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (6, 'Blood Bank', 'yes', 'yes', '2021-10-22 22:10:33');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (7, 'Ambulance', 'yes', 'yes', '2021-10-22 22:10:44');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (8, 'Procedures', 'yes', 'yes', '2018-08-17 13:40:07');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (9, 'Investigations', 'yes', 'yes', '2018-08-17 13:40:07');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (10, 'Supplier', 'yes', 'yes', '2018-08-17 13:40:07');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (11, 'Operations', 'yes', 'yes', '2018-08-17 13:40:07');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (12, 'Others', 'yes', 'yes', '2018-08-17 13:40:07');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`, `created_at`) VALUES (13, 'Bed Charges', 'no', 'yes', '2025-07-02 09:10:37');


#
# TABLE STRUCTURE FOR: charge_type_module
#

DROP TABLE IF EXISTS `charge_type_module`;

CREATE TABLE `charge_type_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_type_master_id` int(11) DEFAULT NULL,
  `module_shortcode` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `charge_type_master_id` (`charge_type_master_id`),
  CONSTRAINT `charge_type_module_ibfk_1` FOREIGN KEY (`charge_type_master_id`) REFERENCES `charge_type_master` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (2, 1, 'appointment', '2021-10-23 03:52:42');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (4, 2, 'opd', '2021-10-23 03:52:45');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (5, 3, 'ipd', '2021-10-23 03:52:49');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (6, 4, 'pathology', '2021-10-23 03:52:52');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (7, 5, 'radiology', '2021-10-23 03:52:54');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (8, 6, 'blood_bank', '2021-10-23 03:52:56');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (9, 7, 'ambulance', '2021-10-23 03:52:59');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (10, 8, 'opd', '2021-10-23 03:53:03');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (11, 8, 'ipd', '2021-10-23 03:53:04');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (13, 9, 'pathology', '2021-10-23 03:53:09');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (14, 9, 'radiology', '2021-10-23 03:53:11');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (15, 10, 'opd', '2021-10-23 03:53:14');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (16, 10, 'ipd', '2021-10-23 03:53:16');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (17, 11, 'opd', '2021-10-23 03:53:18');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (18, 11, 'ipd', '2021-10-23 03:53:18');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (19, 12, 'appointment', '2021-10-23 03:53:20');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (20, 12, 'opd', '2021-10-23 03:53:21');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (21, 12, 'ipd', '2021-10-23 03:53:21');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (24, 12, 'pathology', '2021-10-23 03:53:25');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (25, 12, 'radiology', '2021-10-23 03:53:27');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (26, 12, 'blood_bank', '2021-10-23 03:53:30');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (27, 12, 'ambulance', '2021-10-23 03:53:31');
INSERT INTO `charge_type_module` (`id`, `charge_type_master_id`, `module_shortcode`, `created_at`) VALUES (28, 13, 'ipd', '2025-07-02 09:10:37');


#
# TABLE STRUCTURE FOR: charge_units
#

DROP TABLE IF EXISTS `charge_units`;

CREATE TABLE `charge_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `charge_units` (`id`, `unit`, `is_active`, `created_at`) VALUES (1, 'Each', 0, '2025-06-17 19:46:33');


#
# TABLE STRUCTURE FOR: charges
#

DROP TABLE IF EXISTS `charges`;

CREATE TABLE `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_category_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `charge_unit_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `standard_charge` float(10,2) DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `charge_category_id` (`charge_category_id`),
  KEY `tax_category_id` (`tax_category_id`),
  KEY `charge_unit_id` (`charge_unit_id`),
  KEY `index_name` (`name`),
  KEY `index_standard_charge` (`standard_charge`),
  KEY `index_date` (`date`),
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `charges_ibfk_2` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `charges_ibfk_3` FOREIGN KEY (`charge_unit_id`) REFERENCES `charge_units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (1, 1, 1, 1, 'OPD Doctor Fees', '800.00', NULL, '', '', '2025-06-17 19:47:56');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (2, 2, 1, 1, 'Pathology Fees', '500.00', NULL, '', '', '2025-07-01 13:51:45');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (3, 3, 1, 1, 'Radiology Test Fees', '450.00', NULL, '', '', '2025-07-02 06:35:14');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (4, 4, 1, 1, 'IPD Doctor Fees', '500.00', NULL, '', '', '2025-07-02 07:07:22');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (5, 5, 1, 1, 'Appointment Fees', '400.00', NULL, '', '', '2025-07-02 08:10:14');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (6, 6, 1, 1, 'Blood Bank Charges', '700.00', NULL, '', '', '2025-07-02 08:43:32');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (7, 9, 1, 1, 'Specialist Consultation Fees', '400.00', NULL, '', '', '2025-07-02 09:19:45');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (8, 10, 1, 1, 'Nebulization Fees', '500.00', NULL, '', '', '2025-07-02 09:20:06');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (9, 11, 1, 1, 'Medical Consumables Fees', '500.00', NULL, '', '', '2025-07-02 09:20:33');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (10, 12, 1, 1, 'Hospital Equipment Fees', '600.00', NULL, '', '', '2025-07-02 09:21:01');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (11, 13, 1, 1, 'Surgeon’s Fees', '500.00', NULL, '', '', '2025-07-02 09:21:19');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (12, 14, 1, 1, 'Anesthesia Charges', '200.00', NULL, '', '', '2025-07-02 09:21:31');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (13, 15, 1, 1, 'OT Charges', '450.00', NULL, '', '', '2025-07-02 09:21:51');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (14, 16, 1, 1, 'Registration Charges	', '150.00', NULL, '', '', '2025-07-02 09:22:06');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (15, 17, 1, 1, 'Late Discharge Charges	', '300.00', NULL, '', '', '2025-07-02 09:22:19');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (16, 18, 1, 1, 'Utility Charges	', '350.00', NULL, '', '', '2025-07-02 09:22:35');
INSERT INTO `charges` (`id`, `charge_category_id`, `tax_category_id`, `charge_unit_id`, `name`, `standard_charge`, `date`, `description`, `status`, `created_at`) VALUES (17, 7, 1, 1, 'Bed Charges', '250.00', NULL, '', '', '2025-07-02 09:23:20');


#
# TABLE STRUCTURE FOR: chat_connections
#

DROP TABLE IF EXISTS `chat_connections`;

CREATE TABLE `chat_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_one` (`chat_user_one`),
  KEY `chat_user_two` (`chat_user_two`),
  CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: chat_messages
#

DROP TABLE IF EXISTS `chat_messages`;

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(11) DEFAULT 0,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_id` (`chat_user_id`),
  KEY `chat_connection_id` (`chat_connection_id`),
  CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: chat_users
#

DROP TABLE IF EXISTS `chat_users`;

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_patient_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `patient_id` (`patient_id`),
  KEY `create_staff_id` (`create_staff_id`),
  KEY `create_patient_id` (`create_patient_id`),
  CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_3` FOREIGN KEY (`create_staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_4` FOREIGN KEY (`create_patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type_id` int(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text DEFAULT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `complaint_type_id` (`complaint_type_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`complaint_type_id`) REFERENCES `complaint_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_complaint_type` (`complaint_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (1, 'Facility & Infrastructure', 'Long waiting time at reception or consultation.', '2025-07-02 11:34:04');
INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (2, 'Facility & Infrastructure', 'AC not working in waiting area/room.', '2025-07-02 11:34:04');


#
# TABLE STRUCTURE FOR: conference_staff
#

DROP TABLE IF EXISTS `conference_staff`;

CREATE TABLE `conference_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conference_id` (`conference_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `conference_staff_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conference_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: conferences
#

DROP TABLE IF EXISTS `conferences`;

CREATE TABLE `conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(200) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `visit_details_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `host_video` int(11) NOT NULL,
  `client_video` int(11) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `timezone` text DEFAULT NULL,
  `return_response` text DEFAULT NULL,
  `api_type` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `live_consult_link` int(11) NOT NULL DEFAULT 1 COMMENT 'appointment zoom link for front user status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_details_id` (`visit_details_id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `created_id` (`created_id`),
  CONSTRAINT `conferences_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_ibfk_3` FOREIGN KEY (`visit_details_id`) REFERENCES `visit_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_ibfk_4` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_ibfk_5` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: conferences_history
#

DROP TABLE IF EXISTS `conferences_history`;

CREATE TABLE `conferences_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `total_hit` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conference_id` (`conference_id`),
  KEY `staff_id` (`staff_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `conferences_history_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_history_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_history_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: consult_charges
#

DROP TABLE IF EXISTS `consult_charges`;

CREATE TABLE `consult_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor` int(11) DEFAULT NULL,
  `standard_charge` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `doctor` (`doctor`),
  CONSTRAINT `consult_charges_ibfk_1` FOREIGN KEY (`doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: consultant_register
#

DROP TABLE IF EXISTS `consultant_register`;

CREATE TABLE `consultant_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ins_date` date DEFAULT NULL,
  `instruction` text DEFAULT NULL,
  `cons_doctor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `cons_doctor` (`cons_doctor`),
  CONSTRAINT `consultant_register_ibfk_1` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `consultant_register_ibfk_2` FOREIGN KEY (`cons_doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `consultant_register` (`id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`, `created_at`) VALUES (1, 4, '2025-07-02 16:29:00', '2025-07-02', 'Continue prescribed medication for 5 more days. Review CBC and LFT reports on next visit. Patient advised to maintain hydration and take adequate rest. Follow-up after 7 days or earlier if symptoms worsen.', 11, '2025-07-02 10:59:48');


#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: content_types
#

DROP TABLE IF EXISTS `content_types`;

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `file` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: custom_field_values
#

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `index_field_value` (`field_value`),
  KEY `index_belong_table_id` (`belong_table_id`),
  KEY `index_custom_field_id` (`custom_field_id`),
  CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(11) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` mediumtext DEFAULT NULL,
  `visible_on_print` int(11) DEFAULT NULL,
  `visible_on_report` int(11) DEFAULT NULL,
  `visible_on_table` int(11) DEFAULT NULL,
  `visible_on_patient_panel` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_belong_to` (`belong_to`),
  KEY `index_type` (`type`),
  KEY `index_visible_on_table` (`visible_on_table`),
  KEY `index_visible_on_print` (`visible_on_print`),
  KEY `index_visible_on_report` (`visible_on_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: death_report
#

DROP TABLE IF EXISTS `death_report`;

CREATE TABLE `death_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `attachment` text NOT NULL,
  `attachment_name` text DEFAULT NULL,
  `death_date` datetime NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `death_report` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `death_report_ibfk_1` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `death_report_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (1, 'Cardiology, Cardiothoracic Surgery', 'yes', '2025-07-01 13:33:06');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (2, 'Neurology, Neurosurgery', 'yes', '2025-07-01 13:33:20');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (3, 'Pulmonology / Respiratory Medicine', 'yes', '2025-07-01 13:33:34');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (4, 'Urology', 'yes', '2025-07-01 13:33:47');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (5, 'Gastroenterology', 'yes', '2025-07-01 13:33:58');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (6, 'Hepatology', 'yes', '2025-07-01 13:35:04');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (7, 'Hematology', 'yes', '2025-07-01 13:35:22');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (8, 'Administrative staff', 'yes', '2025-07-02 08:06:41');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (9, 'Pharmacy', 'yes', '2025-07-02 09:43:22');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (10, 'Pathology', 'yes', '2025-07-02 10:08:55');
INSERT INTO `department` (`id`, `department_name`, `is_active`, `created_at`) VALUES (11, 'Radiology', 'yes', '2025-07-02 10:09:08');


#
# TABLE STRUCTURE FOR: discharge_card
#

DROP TABLE IF EXISTS `discharge_card`;

CREATE TABLE `discharge_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_reference_id` int(11) DEFAULT NULL,
  `opd_details_id` int(11) DEFAULT NULL,
  `ipd_details_id` int(11) DEFAULT NULL,
  `discharge_by` int(11) DEFAULT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `discharge_status` int(11) NOT NULL,
  `death_date` datetime DEFAULT NULL,
  `refer_date` datetime DEFAULT NULL,
  `refer_to_hospital` varchar(255) DEFAULT NULL,
  `reason_for_referral` varchar(255) DEFAULT NULL,
  `operation` varchar(225) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `investigations` text DEFAULT NULL,
  `treatment_home` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `opd_details_id` (`opd_details_id`),
  KEY `ipd_details_id` (`ipd_details_id`),
  KEY `discharge_by` (`discharge_by`),
  CONSTRAINT `discharge_card_ibfk_1` FOREIGN KEY (`ipd_details_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discharge_card_ibfk_2` FOREIGN KEY (`discharge_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discharge_card_ibfk_3` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discharge_card_ibfk_4` FOREIGN KEY (`opd_details_id`) REFERENCES `opd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discharge_card_ibfk_5` FOREIGN KEY (`ipd_details_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discharge_card_ibfk_6` FOREIGN KEY (`discharge_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_reference_no` (`reference_no`),
  KEY `index_to_title` (`to_title`),
  KEY `index_from_title` (`from_title`),
  KEY `index_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: doctor_absent
#

DROP TABLE IF EXISTS `doctor_absent`;

CREATE TABLE `doctor_absent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `index_date` (`date`),
  CONSTRAINT `doctor_absent_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: doctor_global_shift
#

DROP TABLE IF EXISTS `doctor_global_shift`;

CREATE TABLE `doctor_global_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `global_shift_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `global_shift_id` (`global_shift_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `doctor_global_shift_ibfk_1` FOREIGN KEY (`global_shift_id`) REFERENCES `global_shift` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_global_shift_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (1, 12, 1, '2025-07-02 07:39:56');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (2, 12, 3, '2025-07-02 07:43:05');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (4, 2, 1, '2025-07-02 07:58:45');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (5, 3, 2, '2025-07-02 07:58:49');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (6, 4, 1, '2025-07-02 07:58:51');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (7, 4, 3, '2025-07-02 07:58:52');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (8, 5, 1, '2025-07-02 07:59:00');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (9, 6, 3, '2025-07-02 07:59:04');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (10, 7, 3, '2025-07-02 07:59:06');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (11, 7, 2, '2025-07-02 07:59:09');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (12, 9, 1, '2025-07-02 07:59:14');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (13, 8, 1, '2025-07-02 07:59:17');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (14, 10, 2, '2025-07-02 07:59:20');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (15, 10, 1, '2025-07-02 07:59:24');
INSERT INTO `doctor_global_shift` (`id`, `staff_id`, `global_shift_id`, `created_at`) VALUES (16, 11, 3, '2025-07-02 07:59:27');


#
# TABLE STRUCTURE FOR: doctor_shift_time
#

DROP TABLE IF EXISTS `doctor_shift_time`;

CREATE TABLE `doctor_shift_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `doctor_global_shift_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `doctor_global_shift_id` (`doctor_global_shift_id`),
  KEY `index_day` (`day`),
  CONSTRAINT `doctor_shift_time_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_shift_time_ibfk_3` FOREIGN KEY (`doctor_global_shift_id`) REFERENCES `doctor_global_shift` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `doctor_shift_time` (`id`, `day`, `staff_id`, `doctor_global_shift_id`, `start_time`, `end_time`, `created_at`) VALUES (1, 'Monday', 12, 1, '10:00:00', '12:00:00', '2025-07-02 08:48:27');
INSERT INTO `doctor_shift_time` (`id`, `day`, `staff_id`, `doctor_global_shift_id`, `start_time`, `end_time`, `created_at`) VALUES (2, 'Wednesday', 12, 1, '10:00:00', '12:00:00', '2025-07-02 08:58:38');
INSERT INTO `doctor_shift_time` (`id`, `day`, `staff_id`, `doctor_global_shift_id`, `start_time`, `end_time`, `created_at`) VALUES (3, 'Wednesday', 12, 2, '18:30:00', '20:00:00', '2025-07-02 09:00:45');


#
# TABLE STRUCTURE FOR: dose_duration
#

DROP TABLE IF EXISTS `dose_duration`;

CREATE TABLE `dose_duration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (1, '3 to 5 days', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (2, 'Until fever/pain subsides (max 5–7 days)', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (3, 'Short-term, 3–5 days', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (4, '4–8 weeks (gastritis/GERD)', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (5, '3–7 days for allergies, can be extended', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (6, 'Long-term / chronic use', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (7, 'Long-term / chronic use', '2025-07-02 07:26:46');
INSERT INTO `dose_duration` (`id`, `name`, `created_at`) VALUES (8, 'Until wound heals (3–10 days)', '2025-07-02 07:26:46');


#
# TABLE STRUCTURE FOR: dose_interval
#

DROP TABLE IF EXISTS `dose_interval`;

CREATE TABLE `dose_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (1, 'Once daily (every 24 hours) for 3–5 days', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (2, 'Every 6 hours (max 4 doses/day)', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (3, 'Every 6–8 hours as needed (max 4/day)', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (4, 'Once daily before breakfast', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (5, 'Apply 1–2 times daily on affected area', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (6, 'Once daily (preferably at night)', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (7, 'Twice daily with meals (morning and evening)', '2025-07-02 07:17:56');
INSERT INTO `dose_interval` (`id`, `name`, `created_at`) VALUES (8, 'Twice daily (morning and night)', '2025-07-02 07:17:56');


#
# TABLE STRUCTURE FOR: duty_roster_assign
#

DROP TABLE IF EXISTS `duty_roster_assign`;

CREATE TABLE `duty_roster_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `roster_duty_date` date DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `duty_roster_list_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `duty_roster_list_id` (`duty_roster_list_id`),
  KEY `department_id` (`department_id`),
  KEY `staff_id` (`staff_id`),
  KEY `floor_id` (`floor_id`),
  KEY `index_roster_duty_date` (`roster_duty_date`),
  CONSTRAINT `duty_roster_assign_ibfk_1` FOREIGN KEY (`duty_roster_list_id`) REFERENCES `duty_roster_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_roster_assign_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_roster_assign_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_roster_assign_ibfk_4` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (1, 1, '2025-06-01', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (2, 1, '2025-06-02', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (3, 1, '2025-06-03', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (4, 1, '2025-06-04', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (5, 1, '2025-06-05', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (6, 1, '2025-06-06', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (7, 1, '2025-06-07', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (8, 1, '2025-06-08', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (9, 1, '2025-06-09', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (10, 1, '2025-06-10', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (11, 1, '2025-06-11', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (12, 1, '2025-06-12', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (13, 1, '2025-06-13', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (14, 1, '2025-06-14', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (15, 1, '2025-06-15', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (16, 1, '2025-06-16', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (17, 1, '2025-06-17', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (18, 1, '2025-06-18', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (19, 1, '2025-06-19', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (20, 1, '2025-06-20', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (21, 1, '2025-06-21', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (22, 1, '2025-06-22', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (23, 1, '2025-06-23', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (24, 1, '2025-06-24', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (25, 1, '2025-06-25', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (26, 1, '2025-06-26', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (27, 1, '2025-06-27', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (28, 1, '2025-06-28', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (29, 1, '2025-06-29', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (30, 1, '2025-06-30', 1, 1, 5, 1, '2025-07-02 08:27:36');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (31, 2, '2025-06-01', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (32, 2, '2025-06-02', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (33, 2, '2025-06-03', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (34, 2, '2025-06-04', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (35, 2, '2025-06-05', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (36, 2, '2025-06-06', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (37, 2, '2025-06-07', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (38, 2, '2025-06-08', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (39, 2, '2025-06-09', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (40, 2, '2025-06-10', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (41, 2, '2025-06-11', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (42, 2, '2025-06-12', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (43, 2, '2025-06-13', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (44, 2, '2025-06-14', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (45, 2, '2025-06-15', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (46, 2, '2025-06-16', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (47, 2, '2025-06-17', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (48, 2, '2025-06-18', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (49, 2, '2025-06-19', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (50, 2, '2025-06-20', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (51, 2, '2025-06-21', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (52, 2, '2025-06-22', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (53, 2, '2025-06-23', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (54, 2, '2025-06-24', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (55, 2, '2025-06-25', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (56, 2, '2025-06-26', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (57, 2, '2025-06-27', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (58, 2, '2025-06-28', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (59, 2, '2025-06-29', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (60, 2, '2025-06-30', 1, 2, 2, 1, '2025-07-02 08:27:53');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (61, 3, '2025-06-01', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (62, 3, '2025-06-02', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (63, 3, '2025-06-03', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (64, 3, '2025-06-04', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (65, 3, '2025-06-05', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (66, 3, '2025-06-06', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (67, 3, '2025-06-07', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (68, 3, '2025-06-08', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (69, 3, '2025-06-09', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (70, 3, '2025-06-10', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (71, 3, '2025-06-11', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (72, 3, '2025-06-12', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (73, 3, '2025-06-13', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (74, 3, '2025-06-14', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (75, 3, '2025-06-15', 1, 3, 4, 2, '2025-07-02 08:28:12');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (76, 4, '2025-06-15', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (77, 4, '2025-06-16', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (78, 4, '2025-06-17', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (79, 4, '2025-06-18', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (80, 4, '2025-06-19', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (81, 4, '2025-06-20', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (82, 4, '2025-06-21', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (83, 4, '2025-06-22', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (84, 4, '2025-06-23', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (85, 4, '2025-06-24', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (86, 4, '2025-06-25', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (87, 4, '2025-06-26', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (88, 4, '2025-06-27', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (89, 4, '2025-06-28', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (90, 4, '2025-06-29', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (91, 4, '2025-06-30', 2, 6, 3, 3, '2025-07-02 08:28:54');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (92, 5, '2025-07-01', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (93, 5, '2025-07-02', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (94, 5, '2025-07-03', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (95, 5, '2025-07-04', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (96, 5, '2025-07-05', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (97, 5, '2025-07-06', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (98, 5, '2025-07-07', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (99, 5, '2025-07-08', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (100, 5, '2025-07-09', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (101, 5, '2025-07-10', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (102, 5, '2025-07-11', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (103, 5, '2025-07-12', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (104, 5, '2025-07-13', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (105, 5, '2025-07-14', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (106, 5, '2025-07-15', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (107, 5, '2025-07-16', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (108, 5, '2025-07-17', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (109, 5, '2025-07-18', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (110, 5, '2025-07-19', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (111, 5, '2025-07-20', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (112, 5, '2025-07-21', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (113, 5, '2025-07-22', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (114, 5, '2025-07-23', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (115, 5, '2025-07-24', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (116, 5, '2025-07-25', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (117, 5, '2025-07-26', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (118, 5, '2025-07-27', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (119, 5, '2025-07-28', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (120, 5, '2025-07-29', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (121, 5, '2025-07-30', 2, 5, 8, 4, '2025-07-02 08:29:11');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (122, 6, '2025-07-01', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (123, 6, '2025-07-02', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (124, 6, '2025-07-03', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (125, 6, '2025-07-04', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (126, 6, '2025-07-05', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (127, 6, '2025-07-06', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (128, 6, '2025-07-07', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (129, 6, '2025-07-08', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (130, 6, '2025-07-09', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (131, 6, '2025-07-10', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (132, 6, '2025-07-11', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (133, 6, '2025-07-12', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (134, 6, '2025-07-13', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (135, 6, '2025-07-14', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (136, 6, '2025-07-15', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (137, 6, '2025-07-16', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (138, 6, '2025-07-17', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (139, 6, '2025-07-18', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (140, 6, '2025-07-19', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (141, 6, '2025-07-20', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (142, 6, '2025-07-21', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (143, 6, '2025-07-22', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (144, 6, '2025-07-23', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (145, 6, '2025-07-24', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (146, 6, '2025-07-25', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (147, 6, '2025-07-26', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (148, 6, '2025-07-27', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (149, 6, '2025-07-28', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (150, 6, '2025-07-29', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (151, 6, '2025-07-30', 1, 7, 9, 4, '2025-07-02 08:29:25');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (152, 7, '2025-07-15', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (153, 7, '2025-07-16', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (154, 7, '2025-07-17', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (155, 7, '2025-07-18', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (156, 7, '2025-07-19', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (157, 7, '2025-07-20', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (158, 7, '2025-07-21', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (159, 7, '2025-07-22', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (160, 7, '2025-07-23', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (161, 7, '2025-07-24', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (162, 7, '2025-07-25', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (163, 7, '2025-07-26', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (164, 7, '2025-07-27', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (165, 7, '2025-07-28', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (166, 7, '2025-07-29', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (167, 7, '2025-07-30', 2, 4, 17, 5, '2025-07-02 08:29:40');
INSERT INTO `duty_roster_assign` (`id`, `code`, `roster_duty_date`, `floor_id`, `department_id`, `staff_id`, `duty_roster_list_id`, `created_at`) VALUES (168, 7, '2025-07-31', 2, 4, 17, 5, '2025-07-02 08:29:40');


#
# TABLE STRUCTURE FOR: duty_roster_list
#

DROP TABLE IF EXISTS `duty_roster_list`;

CREATE TABLE `duty_roster_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duty_roster_shift_id` int(11) NOT NULL,
  `duty_roster_start_date` date NOT NULL,
  `duty_roster_end_date` date NOT NULL,
  `duty_roster_total_day` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `duty_roster_shift_id` (`duty_roster_shift_id`),
  KEY `index_duty_roster_start_date` (`duty_roster_start_date`),
  KEY `index_duty_roster_end_date` (`duty_roster_end_date`),
  CONSTRAINT `duty_roster_list_ibfk_1` FOREIGN KEY (`duty_roster_shift_id`) REFERENCES `duty_roster_shift` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `duty_roster_list` (`id`, `duty_roster_shift_id`, `duty_roster_start_date`, `duty_roster_end_date`, `duty_roster_total_day`, `created_at`) VALUES (1, 1, '2025-06-01', '2025-06-30', 30, '2025-07-02 08:26:00');
INSERT INTO `duty_roster_list` (`id`, `duty_roster_shift_id`, `duty_roster_start_date`, `duty_roster_end_date`, `duty_roster_total_day`, `created_at`) VALUES (2, 2, '2025-06-01', '2025-06-15', 15, '2025-07-02 08:26:16');
INSERT INTO `duty_roster_list` (`id`, `duty_roster_shift_id`, `duty_roster_start_date`, `duty_roster_end_date`, `duty_roster_total_day`, `created_at`) VALUES (3, 3, '2025-06-15', '2025-06-30', 16, '2025-07-02 08:26:50');
INSERT INTO `duty_roster_list` (`id`, `duty_roster_shift_id`, `duty_roster_start_date`, `duty_roster_end_date`, `duty_roster_total_day`, `created_at`) VALUES (4, 4, '2025-07-01', '2025-07-30', 30, '2025-07-02 08:27:00');
INSERT INTO `duty_roster_list` (`id`, `duty_roster_shift_id`, `duty_roster_start_date`, `duty_roster_end_date`, `duty_roster_total_day`, `created_at`) VALUES (5, 5, '2025-07-15', '2025-07-31', 17, '2025-07-02 08:27:13');


#
# TABLE STRUCTURE FOR: duty_roster_shift
#

DROP TABLE IF EXISTS `duty_roster_shift`;

CREATE TABLE `duty_roster_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(255) NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `shift_hour` time NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_shift_name` (`shift_name`),
  KEY `index_shift_start` (`shift_start`),
  KEY `index_shift_end` (`shift_end`),
  KEY `index_shift_hour` (`shift_hour`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `duty_roster_shift` (`id`, `shift_name`, `shift_start`, `shift_end`, `shift_hour`, `is_active`, `created_at`) VALUES (1, 'Morning Shift	', '19:00:00', '15:00:00', '04:00:00', 1, '2025-07-02 08:23:37');
INSERT INTO `duty_roster_shift` (`id`, `shift_name`, `shift_start`, `shift_end`, `shift_hour`, `is_active`, `created_at`) VALUES (2, 'Afternoon Shift', '15:00:00', '23:00:00', '08:00:00', 1, '2025-07-02 08:24:11');
INSERT INTO `duty_roster_shift` (`id`, `shift_name`, `shift_start`, `shift_end`, `shift_hour`, `is_active`, `created_at`) VALUES (3, 'Night Shift', '23:00:00', '07:00:00', '16:00:00', 1, '2025-07-02 08:24:41');
INSERT INTO `duty_roster_shift` (`id`, `shift_name`, `shift_start`, `shift_end`, `shift_hour`, `is_active`, `created_at`) VALUES (4, 'Emergency Backup	', '10:00:00', '18:00:00', '08:00:00', 1, '2025-07-02 08:25:05');
INSERT INTO `duty_roster_shift` (`id`, `shift_name`, `shift_start`, `shift_end`, `shift_hour`, `is_active`, `created_at`) VALUES (5, 'Weekend Rotation', '08:00:00', '20:00:00', '12:00:00', 1, '2025-07-02 08:25:30');


#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `is_active`, `created_at`) VALUES (1, 'sendmail', '', '', '', '', '', 'true', 'yes', '2021-09-24 12:44:21');


#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`),
  KEY `index_end_date` (`end_date`),
  KEY `index_event_type` (`event_type`) USING BTREE,
  KEY `index_event_color` (`event_color`) USING BTREE,
  KEY `index_event_title` (`event_title`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `is_deleted` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_exp_category` (`exp_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `is_deleted` varchar(10) DEFAULT 'no',
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `exp_head_id` (`exp_head_id`),
  KEY `generated_by` (`generated_by`),
  KEY `index_invoice_no` (`invoice_no`),
  KEY `index_name` (`name`),
  KEY `index_date` (`date`) USING BTREE,
  KEY `index_amount` (`amount`) USING BTREE,
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`exp_head_id`) REFERENCES `expense_head` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: filetypes
#

DROP TABLE IF EXISTS `filetypes`;

CREATE TABLE `filetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: finding
#

DROP TABLE IF EXISTS `finding`;

CREATE TABLE `finding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `finding_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `finding_category_id` (`finding_category_id`),
  KEY `index_name` (`name`),
  CONSTRAINT `finding_ibfk_1` FOREIGN KEY (`finding_category_id`) REFERENCES `finding_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `finding` (`id`, `name`, `description`, `finding_category_id`, `created_at`) VALUES (1, 'Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented', '', 1, '2025-07-02 07:43:06');
INSERT INTO `finding` (`id`, `name`, `description`, `finding_category_id`, `created_at`) VALUES (2, 'BP: 130/80 mmHg, Pulse: 82 bpm, Temperature: 98.6°F, SpO₂: 98%', '', 2, '2025-07-02 07:43:25');
INSERT INTO `finding` (`id`, `name`, `description`, `finding_category_id`, `created_at`) VALUES (3, 'Normal heart sounds, No murmurs, Irregular rhythm', '', 3, '2025-07-02 07:43:40');
INSERT INTO `finding` (`id`, `name`, `description`, `finding_category_id`, `created_at`) VALUES (4, 'Vaginal discharge, Cervical tenderness, Normal uterus size', '', 4, '2025-07-02 07:44:03');
INSERT INTO `finding` (`id`, `name`, `description`, `finding_category_id`, `created_at`) VALUES (5, 'Throat congested, Tonsils enlarged, Oral ulcers present', '', 5, '2025-07-02 07:44:17');


#
# TABLE STRUCTURE FOR: finding_category
#

DROP TABLE IF EXISTS `finding_category`;

CREATE TABLE `finding_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `finding_category` (`id`, `category`, `created_at`) VALUES (1, 'General Examination', '2025-07-02 07:42:36');
INSERT INTO `finding_category` (`id`, `category`, `created_at`) VALUES (2, 'Vitals', '2025-07-02 07:42:36');
INSERT INTO `finding_category` (`id`, `category`, `created_at`) VALUES (3, 'Cardiovascular System', '2025-07-02 07:42:36');
INSERT INTO `finding_category` (`id`, `category`, `created_at`) VALUES (4, 'Gynecological', '2025-07-02 07:42:36');
INSERT INTO `finding_category` (`id`, `category`, `created_at`) VALUES (5, 'ENT / Oral Cavity', '2025-07-02 07:42:36');


#
# TABLE STRUCTURE FOR: floor
#

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `floor` (`id`, `name`, `description`, `created_at`) VALUES (1, 'Floor 1', '', '2025-07-01 14:02:25');
INSERT INTO `floor` (`id`, `name`, `description`, `created_at`) VALUES (2, 'Floor 2', '', '2025-07-01 14:02:32');


#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext DEFAULT NULL,
  `vid_title` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` mediumtext DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` mediumtext DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (1, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no', '2018-07-14 03:14:12');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 1, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no', '2021-09-27 12:04:57');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (3, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no', '2019-01-24 03:18:17');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (4, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no', '2019-11-02 10:54:41');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` mediumtext DEFAULT NULL,
  `ext_url_link` mediumtext DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 03:54:49');
INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 03:54:55');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(11) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` int(11) DEFAULT 0,
  `sidebar` int(11) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (1, 'default', 1, 'Home page first new', 'page/home-page-first-new', 'page', 'home-page-first-new', '', '', '', '', '<p>Home page first</p>', '0000-00-00', 1, 1, 'no', '2021-09-28 15:49:10');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class=\"col-md-12 col-sm-12\">\r\n<h2 class=\"text-center\">&nbsp;</h2>\r\n\r\n<p class=\"text-center\">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no', '2019-01-24 03:00:12');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (3, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<title></title>\r\n<p>404 page found</p>', '0000-00-00', 0, NULL, 'no', '2021-09-24 11:35:15');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (4, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no', '2021-09-24 06:27:54');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (5, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action=\"welcome/appointment\" method=\"get\">First name: <input name=\"fname\" type=\"text\" /><br />\r\nLast name: <input name=\"lname\" type=\"text\" /><br />\r\n<input type=\"submit\" value=\"Submit\" />&nbsp;</form>', '0000-00-00', 0, 1, 'no', '2021-09-24 11:35:25');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `feature_image` text DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` varchar(10) NOT NULL DEFAULT '0',
  `sidebar` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(11) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_online_appointment` int(11) DEFAULT NULL,
  `is_active_sidebar` int(11) DEFAULT 0,
  `logo` text DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` mediumtext DEFAULT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_online_appointment`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (1, 'turquoise_blue', NULL, NULL, NULL, NULL, '', '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '', '', '2024-08-21 09:29:55');


#
# TABLE STRUCTURE FOR: gateway_ins
#

DROP TABLE IF EXISTS `gateway_ins`;

CREATE TABLE `gateway_ins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `online_appointment_id` int(11) DEFAULT NULL,
  `type` varchar(30) NOT NULL COMMENT 'patient_bill,appointment	',
  `gateway_name` varchar(50) NOT NULL,
  `module_type` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `parameter_details` mediumtext NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_type` (`type`),
  KEY `index_gateway_name` (`gateway_name`),
  KEY `index_module_type` (`module_type`),
  KEY `index_unique_id` (`unique_id`),
  KEY `online_appointment_id` (`online_appointment_id`),
  CONSTRAINT `gateway_ins_ibfk_1` FOREIGN KEY (`online_appointment_id`) REFERENCES `appointment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: gateway_ins_response
#

DROP TABLE IF EXISTS `gateway_ins_response`;

CREATE TABLE `gateway_ins_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_ins_id` int(11) DEFAULT NULL,
  `posted_data` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `gateway_ins_id` (`gateway_ins_id`),
  CONSTRAINT `gateway_ins_response_ibfk_1` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `call_duration` varchar(50) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `call_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_contact` (`contact`),
  KEY `index_date` (`date`),
  KEY `index_call_duration` (`call_duration`),
  KEY `index_follow_up_date` (`follow_up_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: global_shift
#

DROP TABLE IF EXISTS `global_shift`;

CREATE TABLE `global_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_start_time` (`start_time`),
  KEY `index_end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `global_shift` (`id`, `name`, `start_time`, `end_time`, `date_created`) VALUES (1, 'Morning Shift', '08:00:00', '12:00:00', '2025-07-02 07:40:50');
INSERT INTO `global_shift` (`id`, `name`, `start_time`, `end_time`, `date_created`) VALUES (2, 'Afternoon Shift', '13:00:00', '16:00:00', '2025-07-02 07:41:17');
INSERT INTO `global_shift` (`id`, `name`, `start_time`, `end_time`, `date_created`) VALUES (3, 'Evening Shift', '17:11:00', '20:00:00', '2025-07-02 07:41:43');


#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_deleted` varchar(10) DEFAULT 'no',
  `documents` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inc_head_id` (`inc_head_id`),
  KEY `generated_by` (`generated_by`),
  KEY `index_name` (`name`),
  KEY `index_invoice_no` (`invoice_no`),
  KEY `index_date` (`date`),
  KEY `index_amount` (`amount`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`inc_head_id`) REFERENCES `income_head` (`id`) ON DELETE CASCADE,
  CONSTRAINT `income_ibfk_2` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_income_category` (`income_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: ipd_details
#

DROP TABLE IF EXISTS `ipd_details`;

CREATE TABLE `ipd_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `bed` int(11) DEFAULT NULL,
  `bed_group_id` int(11) DEFAULT NULL,
  `case_type` varchar(100) NOT NULL,
  `casualty` varchar(100) NOT NULL,
  `symptoms` longtext NOT NULL,
  `known_allergies` varchar(200) DEFAULT NULL,
  `patient_old` varchar(50) NOT NULL,
  `note` text DEFAULT NULL,
  `refference` varchar(200) NOT NULL,
  `cons_doctor` int(11) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `credit_limit` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `is_antenatal` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `cons_doctor` (`cons_doctor`),
  KEY `bed_group_id` (`bed_group_id`),
  KEY `bed` (`bed`),
  CONSTRAINT `ipd_details_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_details_ibfk_2` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_details_ibfk_3` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_details_ibfk_4` FOREIGN KEY (`cons_doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_details_ibfk_5` FOREIGN KEY (`bed_group_id`) REFERENCES `bed_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_details_ibfk_6` FOREIGN KEY (`bed`) REFERENCES `bed` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `ipd_details` (`id`, `patient_id`, `case_reference_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `patient_old`, `note`, `refference`, `cons_doctor`, `organisation_id`, `credit_limit`, `payment_mode`, `date`, `discharged`, `live_consult`, `generated_by`, `is_antenatal`, `created_at`) VALUES (1, 4, 2, NULL, NULL, '', '', '', NULL, 5, 2, 'Hepatitis B', 'No', 'Abdominal Pain\r\n', NULL, '', NULL, '', 5, NULL, '20000', '', '2025-06-17 19:37:00', 'no', 'no', 1, NULL, '2025-07-01 14:10:46');
INSERT INTO `ipd_details` (`id`, `patient_id`, `case_reference_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `patient_old`, `note`, `refference`, `cons_doctor`, `organisation_id`, `credit_limit`, `payment_mode`, `date`, `discharged`, `live_consult`, `generated_by`, `is_antenatal`, `created_at`) VALUES (2, 5, 3, NULL, NULL, '', '', '', NULL, 1, 1, 'Headache', 'No', 'Fever\r\n', NULL, '', NULL, '', 3, NULL, '20000', '', '2025-04-10 19:42:00', 'no', 'no', 1, NULL, '2025-07-01 14:13:49');
INSERT INTO `ipd_details` (`id`, `patient_id`, `case_reference_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `patient_old`, `note`, `refference`, `cons_doctor`, `organisation_id`, `credit_limit`, `payment_mode`, `date`, `discharged`, `live_consult`, `generated_by`, `is_antenatal`, `created_at`) VALUES (3, 11, 7, NULL, NULL, '', '', '', NULL, 9, 3, 'Abdominal Pain', 'No', 'Abdominal Pain\r\n', NULL, 'Yes', '', '', 6, NULL, '0', '', '2025-07-01 11:41:00', 'no', 'no', 1, NULL, '2025-07-02 07:09:00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `case_reference_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `patient_old`, `note`, `refference`, `cons_doctor`, `organisation_id`, `credit_limit`, `payment_mode`, `date`, `discharged`, `live_consult`, `generated_by`, `is_antenatal`, `created_at`) VALUES (4, 15, 10, NULL, NULL, '', '', '', NULL, 2, 1, '', 'Yes', '', NULL, '', NULL, '', 8, NULL, '0', '', '2025-07-02 16:16:00', 'no', 'no', 1, NULL, '2025-07-02 10:47:34');


#
# TABLE STRUCTURE FOR: ipd_doctors
#

DROP TABLE IF EXISTS `ipd_doctors`;

CREATE TABLE `ipd_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_id` int(11) NOT NULL,
  `consult_doctor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `consult_doctor` (`consult_doctor`),
  CONSTRAINT `ipd_doctors_ibfk_1` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_doctors_ibfk_2` FOREIGN KEY (`consult_doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: ipd_prescription_basic
#

DROP TABLE IF EXISTS `ipd_prescription_basic`;

CREATE TABLE `ipd_prescription_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_id` int(11) DEFAULT NULL,
  `visit_details_id` int(11) DEFAULT NULL,
  `attachment` text NOT NULL,
  `attachment_name` text NOT NULL,
  `header_note` text DEFAULT NULL,
  `footer_note` text DEFAULT NULL,
  `finding_description` text DEFAULT NULL,
  `is_finding_print` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `prescribe_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `visit_details_id` (`visit_details_id`),
  KEY `generated_by` (`generated_by`),
  KEY `index_date` (`date`),
  KEY `prescribe_by` (`prescribe_by`),
  CONSTRAINT `ipd_prescription_basic_ibfk_1` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_basic_ibfk_2` FOREIGN KEY (`visit_details_id`) REFERENCES `visit_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_basic_ibfk_3` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_basic_ibfk_4` FOREIGN KEY (`prescribe_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `ipd_prescription_basic` (`id`, `ipd_id`, `visit_details_id`, `attachment`, `attachment_name`, `header_note`, `footer_note`, `finding_description`, `is_finding_print`, `date`, `generated_by`, `prescribe_by`, `created_at`) VALUES (1, 1, NULL, '', '', '', '', '', 'yes', '2025-07-02', 1, 5, '2025-07-02 10:56:01');
INSERT INTO `ipd_prescription_basic` (`id`, `ipd_id`, `visit_details_id`, `attachment`, `attachment_name`, `header_note`, `footer_note`, `finding_description`, `is_finding_print`, `date`, `generated_by`, `prescribe_by`, `created_at`) VALUES (2, 4, NULL, '', '', '<p>\r\n\r\nGeneral Examination\r\n\r\n<br></p>', '', 'Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  ', 'yes', '2025-07-02', 1, 8, '2025-07-02 11:09:38');


#
# TABLE STRUCTURE FOR: ipd_prescription_details
#

DROP TABLE IF EXISTS `ipd_prescription_details`;

CREATE TABLE `ipd_prescription_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `dosage` int(11) DEFAULT NULL,
  `dose_interval_id` int(11) DEFAULT NULL,
  `dose_duration_id` int(11) DEFAULT NULL,
  `instruction` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `basic_id` (`basic_id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  KEY `index_dosage` (`dosage`),
  KEY `index_dose_interval_id` (`dose_interval_id`),
  KEY `index_dose_duration_id` (`dose_duration_id`),
  CONSTRAINT `ipd_prescription_details_ibfk_1` FOREIGN KEY (`basic_id`) REFERENCES `ipd_prescription_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_details_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_details_ibfk_3` FOREIGN KEY (`dose_interval_id`) REFERENCES `dose_interval` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_details_ibfk_4` FOREIGN KEY (`dose_duration_id`) REFERENCES `dose_interval` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `ipd_prescription_details` (`id`, `basic_id`, `pharmacy_id`, `dosage`, `dose_interval_id`, `dose_duration_id`, `instruction`, `created_at`) VALUES (1, 2, 2, 1, 7, 1, '', '2025-07-02 10:58:55');
INSERT INTO `ipd_prescription_details` (`id`, `basic_id`, `pharmacy_id`, `dosage`, `dose_interval_id`, `dose_duration_id`, `instruction`, `created_at`) VALUES (2, 2, 1, 2, 2, 2, '', '2025-07-02 10:58:55');


#
# TABLE STRUCTURE FOR: ipd_prescription_test
#

DROP TABLE IF EXISTS `ipd_prescription_test`;

CREATE TABLE `ipd_prescription_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_prescription_basic_id` int(11) DEFAULT NULL,
  `pathology_id` int(11) DEFAULT NULL,
  `radiology_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ipd_prescription_basic_id` (`ipd_prescription_basic_id`),
  KEY `pathology_id` (`pathology_id`),
  KEY `radiology_id` (`radiology_id`),
  CONSTRAINT `ipd_prescription_test_ibfk_1` FOREIGN KEY (`ipd_prescription_basic_id`) REFERENCES `ipd_prescription_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_test_ibfk_2` FOREIGN KEY (`pathology_id`) REFERENCES `pathology` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipd_prescription_test_ibfk_3` FOREIGN KEY (`radiology_id`) REFERENCES `radio` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `ipd_prescription_test` (`id`, `ipd_prescription_basic_id`, `pathology_id`, `radiology_id`, `created_at`) VALUES (1, 1, 1, NULL, '2025-07-02 10:56:01');
INSERT INTO `ipd_prescription_test` (`id`, `ipd_prescription_basic_id`, `pathology_id`, `radiology_id`, `created_at`) VALUES (2, 2, 4, NULL, '2025-07-02 11:03:10');
INSERT INTO `ipd_prescription_test` (`id`, `ipd_prescription_basic_id`, `pathology_id`, `radiology_id`, `created_at`) VALUES (3, 2, NULL, 2, '2025-07-02 11:03:10');


#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `item_category_id` (`item_category_id`),
  KEY `index_name` (`name`),
  KEY `index_unit` (`unit`),
  KEY `index_quantity` (`quantity`),
  KEY `index_date` (`date`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (3, 2, 'IV Cannula 22G', 'piece', NULL, 'Sterile single-use catheter for intravenous fluid or drug administration.', 0, NULL, '2025-07-02 07:37:03');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (4, 2, 'Sterile Surgical Gloves (Size M)', 'Box of 50 pairs', NULL, 'Disposable latex gloves used for surgical and medical procedures.', 0, NULL, '2025-07-02 07:37:49');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (5, 1, 'Portable ECG Machine', 'piece', NULL, 'Compact 12-lead ECG device for heart monitoring and diagnostics.', 0, NULL, '2025-07-02 07:38:49');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (6, 1, 'Digital Blood Pressure Monitor', 'piece', NULL, 'Automatic device for measuring and displaying blood pressure readings.', 0, NULL, '2025-07-02 07:39:26');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (7, 4, 'Dressing Forceps 6-inch', 'piece', NULL, 'Reusable stainless-steel forceps used for dressing wounds.', 0, NULL, '2025-07-02 07:40:01');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (8, 4, 'Scalpel Handle with Blade No. 10', 'piece', NULL, 'Standard surgical cutting instrument for incisions.', 0, NULL, '2025-07-02 07:40:42');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (9, 5, 'A4 Copier Paper', 'ream (pack of 500 sheets)', NULL, 'Standard white sheets for hospital printing and documentation.', 0, NULL, '2025-07-02 07:42:48');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `quantity`, `date`, `created_at`) VALUES (10, 5, 'Floor Disinfectant Liquid', '5 ltr can', NULL, 'Surface disinfectant for hospital floors and general cleaning.', 0, NULL, '2025-07-02 07:43:30');


#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'yes',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_item_category` (`item_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (1, 'Medical Equipment', 'yes', 'Durable, often high-cost devices used in diagnosis, treatment, or monitoring.', '2025-07-02 05:57:57');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (2, 'Medical Consumables & Disposables', 'yes', 'Items used once or for a limited time, often per patient or per procedure.', '2025-07-02 05:57:57');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (4, 'Surgical Instruments', 'yes', 'Reusable tools used in surgeries and medical procedures.', '2025-07-02 05:57:57');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (5, 'General Supplies', 'yes', 'Non-clinical items essential for hospital functioning.', '2025-07-02 05:57:57');


#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` int(11) DEFAULT NULL,
  `issue_to` int(11) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_returned` int(11) NOT NULL DEFAULT 1,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  KEY `issue_to` (`issue_to`),
  KEY `index_issue_date` (`issue_date`),
  KEY `index_return_date` (`return_date`),
  KEY `index_quantity` (`quantity`),
  KEY `index_is_returned` (`is_returned`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_3` FOREIGN KEY (`issue_to`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `is_active`, `created_at`) VALUES (1, 8, 18, 'Super Admin', '2025-07-02', '0000-00-00', 5, 9, 2, 'not for return', 1, 'no', '2025-07-02 08:19:22');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `is_active`, `created_at`) VALUES (2, 9, 16, 'Super Admin', '2025-07-01', '0000-00-00', 2, 4, 5, 'not for return', 1, 'no', '2025-07-02 08:20:17');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `is_active`, `created_at`) VALUES (3, 9, 16, 'Super Admin', '2025-07-02', '2025-07-31', 1, 6, 2, '', 1, 'no', '2025-07-02 08:21:00');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `is_active`, `created_at`) VALUES (4, 3, 8, 'Super Admin', '2025-07-02', '2025-07-05', 4, 7, 2, 'for OT surgery', 1, 'no', '2025-07-02 08:21:43');


#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` float(10,2) DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  KEY `index_quantity` (`quantity`),
  KEY `index_purchase_price` (`purchase_price`),
  KEY `index_date` (`date`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (2, 4, 3, '+', 2, 50, '350.00', '2025-07-02', NULL, 'Gloves issued for emergency department use.', 'yes', '2025-07-02 07:53:56');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (3, 6, 6, '+', 3, 10, '5000.00', '2025-07-02', NULL, 'Issued for new OPD consultation room setup.', 'yes', '2025-07-02 07:55:03');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (4, 7, 6, '+', 5, 10, '1200.00', '2025-07-02', NULL, 'Issued to CSSD for sterilization and OT use.', 'yes', '2025-07-02 07:56:16');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (5, 9, 5, '+', 4, 20, '4400.00', '2025-07-02', NULL, ' Issued for admin department document printing.', 'yes', '2025-07-02 07:56:57');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (6, 4, 4, '+', 2, 30, '3050.00', '2025-07-02', NULL, '', 'yes', '2025-07-02 09:43:06');


#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_item_store` (`item_store`),
  KEY `index_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`, `created_at`) VALUES (2, 'Surgical Consumables Store', 'SURC-', 'Holds single-use surgical supplies like syringes, sutures, gloves, catheters, and dressing materials used in OT and emergency care.\r\n\r\n', '2025-07-02 06:02:54');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`, `created_at`) VALUES (3, 'Medical Equipment Store', 'MEDE-', 'Stores capital equipment and devices like ECG machines, infusion pumps, wheelchairs, and diagnostic tools. Often tagged for tracking and maintenance.', '2025-07-02 06:03:34');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`, `created_at`) VALUES (4, 'General Store / Administrative Supplies', 'GENS-', 'Manages non-medical items including office stationery, printer cartridges, housekeeping items, and uniforms.', '2025-07-02 06:04:36');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`, `created_at`) VALUES (5, 'Central Sterile Services Department Store', 'CSSD-', 'Handles sterilized instruments and trays post-cleaning, ready for use in surgeries or wards. Maintains strict inventory cycles to ensure sterility.', '2025-07-02 06:05:25');


#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_item_supplier` (`item_supplier`),
  KEY `index_phone` (`phone`),
  KEY `index_email` (`email`),
  KEY `index_address` (`address`),
  KEY `index_contact_person_name` (`contact_person_name`),
  KEY `index_contact_person_phone` (`contact_person_phone`),
  KEY `index_contact_person_email` (`contact_person_email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`, `created_at`) VALUES (1, 'Arjun', '', '', '', '', '', '', '', '2025-07-02 06:05:29');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`, `created_at`) VALUES (3, 'SurgiMed Disposables', '+911127584482', 'sales@surgimed.in', '14/6 Industrial Area, Wazirpur, New Delhi 110052', 'Ms. Preeti Verma', '+919811722976', 'preeti.verma@surgimed.in', 'Supplier of high-quality disposable surgical items such as gloves, catheters, sutures, and sterile dressing packs.', '2025-07-02 06:13:07');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`, `created_at`) VALUES (4, 'TechHealth Instruments & Devices', '+914023339821', 'support@techhealthdevices.com', 'Plot No. 12, Medtech Zone, Gachibowli, Hyderabad, Telangana 500032', 'Mr. Nikhil Reddy', '+919701987654', 'nik.reddy@techhealthdevices.com', ' Authorized dealer of diagnostic and monitoring devices including ECG machines, defibrillators, patient monitors, and ventilators.', '2025-07-02 06:16:39');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`, `created_at`) VALUES (5, 'OfficeMart Essentials', '+918022554499', 'sales@officemart.in', ' #42, 2nd Cross, Rajajinagar, Bengaluru, Karnataka 560010', 'Mrs. Sneha Desai', '+919986045599', 'sneha.desai@officemart.in', 'Supplies hospital-grade stationery, janitorial supplies, and administrative materials required for day-to-day operations.', '2025-07-02 06:18:54');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`, `created_at`) VALUES (6, 'SteriTech Medical Systems', '+914428906610', 'contact@steritechmed.com', '7/11B, Guindy Industrial Estate, Chennai, Tamil Nadu 600032', 'Mr. Anil Krishnan', '+919444089331', 'anil.krishnan@steritechmed.com', 'Specializes in sterile instrument kits, autoclave supplies, and CSSD logistics. Complies with ISO 13485 and NABH standards.', '2025-07-02 06:20:20');


#
# TABLE STRUCTURE FOR: lab
#

DROP TABLE IF EXISTS `lab`;

CREATE TABLE `lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `lab` (`id`, `lab_name`, `created_at`) VALUES (1, 'X-Ray', '2025-07-01 13:47:14');
INSERT INTO `lab` (`id`, `lab_name`, `created_at`) VALUES (2, 'Ultrasound (USG)', '2025-07-01 13:47:21');
INSERT INTO `lab` (`id`, `lab_name`, `created_at`) VALUES (3, 'CT Scan (Computed Tomography)', '2025-07-01 13:47:28');
INSERT INTO `lab` (`id`, `lab_name`, `created_at`) VALUES (4, 'MRI (Magnetic Resonance Imaging)', '2025-07-01 13:47:36');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_rtl` varchar(10) NOT NULL DEFAULT 'no',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_language` (`language`),
  KEY `index_short_code` (`short_code`),
  KEY `index_country_code` (`country_code`),
  KEY `index_is_deleted` (`is_deleted`),
  KEY `index_is_rtl` (`is_rtl`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Azerbaijan', 'az', 'az', 'no', 'no', 'no', '2021-09-28 09:51:22', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Albanian', 'sq', 'al', 'no', 'no', 'no', '2021-09-28 10:08:10', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Amharic', 'am', 'am', 'no', 'no', 'no', '2021-09-28 09:50:47', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'English', 'en', 'us', 'no', 'no', 'no', '2021-09-16 05:20:47', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Arabic', 'ar', 'sa', 'no', 'no', 'no', '2021-09-28 09:50:48', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'Afrikaans', 'af', 'af', 'no', 'no', 'no', '2021-09-28 10:51:19', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'Basque', 'eu', 'es', 'no', 'no', 'no', '2021-09-24 06:58:21', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'Bengali', 'bn', 'in', 'no', 'no', 'no', '2021-09-24 06:58:25', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'Bosnian', 'bs', 'bs', 'no', 'no', 'no', '2021-09-24 06:58:28', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (10, 'Welsh', 'cy', 'cy', 'no', 'no', 'no', '2021-09-24 06:58:31', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'Hungarian', 'hu', 'hu', 'no', 'no', 'no', '2021-09-24 06:58:35', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (12, 'Vietnamese', 'vi', 'vi', 'no', 'no', 'no', '2021-09-24 06:58:39', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'Haitian', 'ht', 'ht', 'no', 'no', 'no', '2021-09-24 06:58:43', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'Galician', 'gl', 'gl', 'no', 'no', 'no', '2021-09-24 06:58:47', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'Dutch', 'nl', 'nl', 'no', 'no', 'no', '2021-09-24 06:58:51', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'Greek', 'el', 'gr', 'no', 'no', 'no', '2021-09-24 06:58:53', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'Georgian', 'ka', 'ge', 'no', 'no', 'no', '2021-09-24 06:58:56', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'Gujarati', 'gu', 'in', 'no', 'no', 'no', '2021-09-24 06:58:59', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'Danish', 'da', 'dk', 'no', 'no', 'no', '2021-09-24 06:59:01', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (20, 'Hebrew', 'he', 'il', 'no', 'no', 'no', '2021-09-24 06:59:04', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'Yiddish', 'yi', 'il', 'no', 'no', 'no', '2021-09-24 06:59:07', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (22, 'Indonesian', 'id', 'id', 'no', 'no', 'no', '2021-09-24 06:59:10', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (23, 'Irish', 'ga', 'ga', 'no', 'no', 'no', '2021-09-24 06:59:14', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (24, 'Italian', 'it', 'it', 'no', 'no', 'no', '2021-09-24 06:59:17', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (25, 'Icelandic', 'is', 'is', 'no', 'no', 'no', '2021-09-24 06:59:20', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (26, 'Spanish', 'es', 'es', 'no', 'no', 'no', '2021-09-24 06:59:29', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (27, 'Kannada', 'kn', 'kn', 'no', 'no', 'no', '2021-09-24 06:59:32', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (28, 'Catalan', 'ca', 'ca', 'no', 'no', 'no', '2021-09-24 06:59:34', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (29, 'Chinese', 'zh', 'cn', 'no', 'no', 'no', '2021-09-24 06:59:36', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (30, 'Korean', 'ko', 'kr', 'no', 'no', 'no', '2021-09-24 06:59:39', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (31, 'Xhosa', 'xh', 'ls', 'no', 'no', 'no', '2021-09-24 06:59:42', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (32, 'Latin', 'la', 'la', 'no', 'no', 'no', '2021-09-24 06:59:45', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (33, 'Latvian', 'lv', 'lv', 'no', 'no', 'no', '2021-09-24 06:59:47', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (34, 'Lithuanian', 'lt', 'lt', 'no', 'no', 'no', '2021-09-24 06:59:50', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (35, 'Malagasy', 'mg', 'mg', 'no', 'no', 'no', '2021-09-24 06:59:52', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (36, 'Malay', 'ms', 'ms', 'no', 'no', 'no', '2021-09-24 07:00:01', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (37, 'Malayalam', 'ml', 'ml', 'no', 'no', 'no', '2021-09-24 07:00:05', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (38, 'Maltese', 'mt', 'mt', 'no', 'no', 'no', '2021-09-24 07:00:26', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (39, 'Macedonian', 'mk', 'mk', 'no', 'no', 'no', '2021-09-24 07:00:41', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (40, 'Maori', 'mi', 'nz', 'no', 'no', 'no', '2021-09-24 07:00:44', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (41, 'Marathi', 'mr', 'in', 'no', 'no', 'no', '2021-09-24 07:00:51', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (42, 'Mongolian', 'mn', 'mn', 'no', 'no', 'no', '2021-09-24 07:01:15', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (43, 'German', 'de', 'de', 'no', 'no', 'no', '2021-09-24 07:01:18', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (44, 'Nepali', 'ne', 'ne', 'no', 'no', 'no', '2021-09-24 07:01:21', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (45, 'Norwegian', 'no', 'no', 'no', 'no', 'no', '2021-09-24 07:01:41', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (46, 'Punjabi', 'pa', 'in', 'no', 'no', 'no', '2021-09-24 07:01:43', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (47, 'Persian', 'fa', 'ir', 'no', 'no', 'no', '2021-09-24 07:01:49', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (48, 'Portuguese', 'pt', 'pt', 'no', 'no', 'no', '2021-09-24 07:01:52', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (49, 'Romanian', 'ro', 'ro', 'no', 'no', 'no', '2021-09-24 07:01:56', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (50, 'Russian', 'ru', 'ru', 'no', 'no', 'no', '2021-09-24 07:01:59', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (51, 'Cebuano', 'ceb', 'ph', 'no', 'no', 'no', '2021-09-24 07:02:02', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (52, 'Sinhala', 'si', 'si', 'no', 'no', 'no', '2021-09-24 07:02:04', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (53, 'Slovakian', 'sk', 'sk', 'no', 'no', 'no', '2021-09-24 07:02:07', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (54, 'Slovenian', 'sl', 'sl', 'no', 'no', 'no', '2021-09-24 07:02:10', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (55, 'Swahili', 'sw', 'ke', 'no', 'no', 'no', '2021-09-24 07:02:12', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (56, 'Sundanese', 'su', 'sd', 'no', 'no', 'no', '2021-09-24 07:02:15', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (57, 'Thai', 'th', 'th', 'no', 'no', 'no', '2021-09-24 07:02:18', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (58, 'Tagalog', 'tl', 'tl', 'no', 'no', 'no', '2021-09-24 07:02:21', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (59, 'Tamil', 'ta', 'in', 'no', 'no', 'no', '2021-09-24 07:02:23', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (60, 'Telugu', 'te', 'in', 'no', 'no', 'no', '2021-09-24 07:02:26', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (61, 'Turkish', 'tr', 'tr', 'no', 'no', 'no', '2021-09-24 07:02:29', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (62, 'Uzbek', 'uz', 'uz', 'no', 'no', 'no', '2021-09-24 07:02:31', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (63, 'Urdu', 'ur', 'pk', 'no', 'no', 'no', '2021-09-24 07:02:34', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (64, 'Finnish', 'fi', 'fi', 'no', 'no', 'no', '2021-09-24 07:02:37', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (65, 'French', 'fr', 'fr', 'no', 'no', 'no', '2021-09-24 07:02:39', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (66, 'Hindi', 'hi', 'in', 'no', 'no', 'no', '2021-09-24 07:02:41', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (67, 'Czech', 'cs', 'cz', 'no', 'no', 'no', '2021-09-24 07:02:44', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (68, 'Swedish', 'sv', 'sv', 'no', 'no', 'no', '2021-09-24 07:02:46', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (69, 'Scottish', 'gd', 'gd', 'no', 'no', 'no', '2021-09-24 07:02:49', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (70, 'Estonian', 'et', 'et', 'no', 'no', 'no', '2021-09-24 07:02:52', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (71, 'Esperanto', 'eo', 'br', 'no', 'no', 'no', '2021-09-24 07:02:55', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (72, 'Javanese', 'jv', 'id', 'no', 'no', 'no', '2021-09-24 07:02:58', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (73, 'Japanese', 'ja', 'jp', 'no', 'no', 'no', '2021-09-24 07:03:01', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (74, 'Polish', 'pl', 'pl', 'no', 'no', 'no', '2021-09-28 06:39:06', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (75, 'Croatia', 'hr', 'hr', 'no', 'no', 'no', '2021-10-25 07:56:41', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (76, 'Kurdish', 'ku', 'iq', 'no', 'no', 'no', '2021-10-25 07:56:44', NULL);
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_rtl`, `is_active`, `created_at`, `updated_at`) VALUES (77, 'Lao', 'lo', 'la', 'no', 'no', 'no', '2021-10-25 07:56:47', NULL);


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `leave_types` (`id`, `type`, `is_active`, `created_at`) VALUES (1, 'Paid Leave', 'yes', '2025-07-02 08:13:31');
INSERT INTO `leave_types` (`id`, `type`, `is_active`, `created_at`) VALUES (2, 'Casual Leave', 'yes', '2025-07-02 08:13:40');
INSERT INTO `leave_types` (`id`, `type`, `is_active`, `created_at`) VALUES (3, 'Sick Leave', 'yes', '2025-07-02 08:14:24');


#
# TABLE STRUCTURE FOR: logs
#

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `record_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `agent` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (1, 'Record updated On Settings id 1', 1, 0, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 138.0', '2025-05-22 06:34:20', '2025-05-22');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 'Record updated On Settings id 1', 1, 0, 'Update', '127.0.0.1', 'Windows 10', 'Firefox 138.0', '2025-05-22 06:34:24', '2025-05-22');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (3, 'Record updated For Staff id 2', 2, 0, 'Update', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 12:03:53', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (4, 'New Record inserted On Patient id 1', 1, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:09:59', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (5, 'Record updated On Patient id 1', 1, 0, 'Update', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:09:59', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (6, 'New Record inserted On Charge Categories id 1', 1, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:16:08', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (7, 'New Record inserted On Charge Units id 1', 1, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:16:33', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (8, 'New Record inserted On Tax Category id 1', 1, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:17:28', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (9, 'New Record inserted On Patient id 2', 2, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:18:24', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (10, 'Record updated On Patient id 2', 2, 0, 'Update', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:18:24', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (11, 'New Record inserted On Patient id 3', 3, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:19:44', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (12, 'Record updated On Patient id 3', 3, 0, 'Update', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:19:44', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (13, 'Record updated On Patient id 3', 3, 0, 'Update', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:20:10', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (14, 'New Record inserted On Transactions id 1', 1, 0, 'Insert', '::1', 'Windows 10', 'Chrome 137.0.0.0', '2025-06-17 14:20:10', '2025-06-17');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (15, 'New Record inserted On Pathology Category id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:25:50', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (16, 'Record deleted On Pathology Category id 1', 1, 0, 'Delete', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:26:18', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (17, 'New Record inserted On Medicine Category id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:26:35', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (18, 'New Record inserted On Medicine Category id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:26:54', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (19, 'New Record inserted On Medicine Category id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:27:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (20, 'New Record inserted On Medicine Category id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:27:26', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (21, 'New Record inserted On Medicine Category id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:27:36', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (22, 'New Record inserted On Pathology Category id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:27:43', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (23, 'New Record inserted On Medicine Category id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:27:47', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (24, 'New Record inserted On Pathology Category id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:27:57', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (25, 'New Record inserted On Pathology Category id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:28:45', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (26, 'New Record inserted On Pathology Category id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:29:17', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (27, 'New Record inserted On Pathology Category id 6', 6, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:29:29', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (28, 'New Record inserted On Company id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:29:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (29, 'New Record inserted On Staff Designation id 1', 1, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:29:58', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (30, 'New Record inserted On Company id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:30:09', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (31, 'New Record inserted On Company id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:30:47', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (32, 'New Record inserted On Company id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:30:47', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (33, 'New Record inserted On Company id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:30:47', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (34, 'New Record inserted On Staff Designation id 2', 2, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (35, 'New Record inserted On Staff Designation id 3', 3, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:30', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (36, 'New Record inserted On Unit id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (37, 'New Record inserted On Unit id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (38, 'New Record inserted On Unit id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (39, 'New Record inserted On Unit id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (40, 'New Record inserted On Unit id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:31:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (41, 'New Record inserted On Staff Designation id 4', 4, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (42, 'New Record inserted On medicine group id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (43, 'New Record inserted On medicine group id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (44, 'New Record inserted On medicine group id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (45, 'New Record inserted On medicine group id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (46, 'New Record inserted On medicine group id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:32:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (47, 'New Record inserted On Department id 1', 1, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:33:06', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (48, 'New Record inserted On Department id 2', 2, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:33:20', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (49, 'New Record inserted On Department id 3', 3, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:33:34', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (50, 'New Record inserted On Department id 4', 4, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:33:47', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (51, 'New Record inserted On Unit id 6', 6, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:33:57', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (52, 'New Record inserted On Department id 5', 5, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:33:58', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (53, 'New Record inserted On Unit id 7', 7, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:34:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (54, 'New Record inserted On Unit id 8', 8, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:34:34', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (55, 'Record updated On Department id 4', 4, 0, 'Update', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:34:39', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (56, 'New Record inserted On Unit id 9', 9, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:34:43', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (57, 'Record updated On Department id 4', 4, 0, 'Update', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:34:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (58, 'New Record inserted On Unit id 10', 10, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:34:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (59, 'Record updated On Department id 5', 5, 0, 'Update', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:34:55', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (60, 'New Record inserted On Unit id 11', 11, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:34:59', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (61, 'New Record inserted On Department id 6', 6, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:35:04', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (62, 'New Record inserted On Unit id 12', 12, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:35:12', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (63, 'New Record inserted On Department id 7', 7, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:35:22', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (64, 'New Record inserted On Unit id 13', 13, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:35:23', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (65, 'New Record inserted On Unit id 14', 14, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:35:41', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (66, 'New Record inserted On Unit id 15', 15, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:36:02', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (67, 'New Record inserted On Unit id 16', 16, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:36:19', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (68, 'New Record inserted On Pharmacy id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:36:27', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (69, 'New Record inserted On Unit id 17', 17, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:36:29', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (70, 'New Record inserted On Specialist id 1', 1, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:36:38', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (71, 'New Record inserted On Unit id 18', 18, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:36:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (72, 'New Record inserted On Specialist id 2', 2, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:36:50', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (73, 'New Record inserted On Unit id 19', 19, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:36:58', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (74, 'New Record inserted On Specialist id 3', 3, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:04', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (75, 'New Record inserted On Specialist id 4', 4, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:12', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (76, 'New Record inserted On medicine group id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (77, 'New Record inserted On Specialist id 5', 5, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:25', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (78, 'New Record inserted On Specialist id 6', 6, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:42', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (79, 'New Record inserted On Specialist id 7', 7, 0, 'Insert', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:37:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (80, 'New Record inserted On Pharmacy id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:39:25', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (81, 'New Record inserted On Pathology Parameter id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:40:57', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (82, 'New Record inserted On Pharmacy id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:41:53', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (83, 'New Record inserted On Medicine Category id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:45:42', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (84, 'New Record inserted On Lab id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:47:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (85, 'New Record inserted On Lab id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:47:21', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (86, 'New Record inserted On Lab id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:47:28', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (87, 'New Record inserted On Lab id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:47:36', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (88, 'New Record inserted On Unit id 20', 20, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:47:53', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (89, 'New Record inserted On Unit id 21', 21, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:00', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (90, 'New Record inserted On Unit id 22', 22, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:07', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (91, 'New Record inserted On Unit id 23', 23, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (92, 'New Record inserted On Unit id 24', 24, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:21', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (93, 'New Record inserted On Pharmacy id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:48:22', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (94, 'New Record inserted On Unit id 25', 25, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:30', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (95, 'New Record inserted On Unit id 26', 26, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:40', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (96, 'New Record inserted On Unit id 27', 27, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:48', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (97, 'New Record inserted On Unit id 28', 28, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:48:53', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (98, 'New Record inserted On Charge Categories id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:49:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (99, 'New Record inserted On Medicine Category id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:51:33', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (100, 'New Record inserted On Unit id 29', 29, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:51:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (101, 'New Record inserted On Pharmacy id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:53:21', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (102, 'Record updated For Staff id 3', 3, 0, 'Update', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:53:25', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (103, 'Record updated On Pathology Parameter id 1', 1, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:55:01', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (104, 'New Record inserted On Pathology Parameter id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:57:03', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (105, 'New Record inserted On Pathology Parameter id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:57:25', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (106, 'New Record inserted On Pathology Parameter id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:57:42', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (107, 'New Record inserted On Pathology Parameter id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:58:03', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (108, 'Record updated On Pathology Parameter id 1', 1, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:58:23', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (109, 'New Record inserted On Read System Notification id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:58:31', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (110, 'New Record inserted On Read System Notification id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:58:33', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (111, 'New Record inserted On Pathology Parameter id 6', 6, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:58:44', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (112, 'Record updated For Staff id 3', 3, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:58:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (113, 'Record updated For Staff id 3', 3, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 13:58:51', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (114, 'New Record inserted On Pathology Parameter id 7', 7, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 13:59:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (115, 'Record deleted On  OPD  id 1', 1, 0, 'Delete', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:00:24', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (116, 'New Record inserted On Floor id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:02:25', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (117, 'New Record inserted On Floor id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:02:32', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (118, 'New Record inserted On Symptoms Classification id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (119, 'New Record inserted On Symptoms Classification id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (120, 'New Record inserted On Symptoms Classification id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (121, 'New Record inserted On Symptoms Classification id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (122, 'New Record inserted On Symptoms Classification id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (123, 'New Record inserted On Symptoms Classification id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:02:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (124, 'New Record inserted On Symptoms id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:03:09', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (125, 'New Record inserted On Symptoms id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:03:26', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (126, 'Record updated For Staff id 4', 4, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:03:48', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (127, 'New Record inserted On Bed Group id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:03:56', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (128, 'New Record inserted On Symptoms id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:04:05', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (129, 'New Record inserted On Bed Group id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:04:13', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (130, 'New Record inserted On Symptoms id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:04:23', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (131, 'New Record inserted On Bed Group id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:04:36', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (132, 'New Record inserted On Symptoms id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:04:52', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (133, 'New Record inserted On Bed id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:05:23', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (134, 'New Record inserted On Bed id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:05:32', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (135, 'New Record inserted On Bed id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:05:50', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (136, 'New Record inserted On Bed id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:02', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (137, 'New Record inserted On Bed id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:12', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (138, 'New Record inserted On Bed id 6', 6, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:23', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (139, 'New Record inserted On Bed id 7', 7, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:31', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (140, 'New Record inserted On Bed id 8', 8, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:41', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (141, 'Record updated For Staff id 5', 5, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:06:53', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (142, 'New Record inserted On Bed id 9', 9, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:06:55', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (143, 'New Record inserted On Patient id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (144, 'Record updated On Patient id 4', 4, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (145, 'Record updated On Patient id 4', 4, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (146, 'New Record inserted On IPD id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (147, 'Record updated On Bed id 5', 5, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (148, 'New Record inserted On Patient bed history id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:10:46', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (149, 'Record updated For Staff id 6', 6, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:11:11', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (150, 'New Record inserted On Patient id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:11:52', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (151, 'Record updated On Patient id 5', 5, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:11:52', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (152, 'Record updated On Patient id 5', 5, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:13:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (153, 'New Record inserted On IPD id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:13:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (154, 'Record updated On Bed id 1', 1, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:13:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (155, 'New Record inserted On Patient bed history id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-01 14:13:49', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (156, 'Record updated For Staff id 7', 7, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:15:14', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (157, 'Record updated For Staff id 8', 8, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:16:24', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (158, 'Record updated For Staff id 9', 9, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:18:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (159, 'Record updated For Staff id 10', 10, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:19:11', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (160, 'Record updated For Staff id 11', 11, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:20:02', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (161, 'Record updated For Staff id 11', 11, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:29:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (162, 'Record updated For Staff id 11', 11, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:29:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (163, 'Record updated For Staff id 12', 12, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-01 14:30:15', '2025-07-01');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (164, 'New Record inserted On Patient id 6', 6, 0, 'Insert', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 02:45:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (165, 'Record updated On Patient id 6', 6, 0, 'Update', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 02:45:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (166, 'New Record inserted On Patient id 7', 7, 0, 'Insert', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 02:57:15', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (167, 'Record updated On Patient id 7', 7, 0, 'Update', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 02:57:15', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (168, 'Record updated On Settings id 1', 1, 0, 'Update', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 03:07:21', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (169, 'New Record inserted On Patient id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 04:57:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (170, 'Record updated On Patient id 8', 8, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 04:57:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (171, 'Record updated On Patient id 8', 8, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 04:58:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (172, 'New Record inserted On Transactions id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 04:58:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (173, 'New Record inserted On Patient id 9', 9, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:01:38', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (174, 'Record updated On Patient id 9', 9, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:01:38', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (175, 'Record updated On Patient id 9', 9, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:02:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (176, 'New Record inserted On Transactions id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:02:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (177, 'New Record inserted On Patient id 10', 10, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:03:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (178, 'Record updated On Patient id 10', 10, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:03:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (179, 'Record updated On Patient id 10', 10, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:04:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (180, 'New Record inserted On Transactions id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:04:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (181, 'Record updated On Transactions id 4', 4, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:04:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (182, 'Record updated On Visit Details id 4', 4, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:04:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (183, 'Record updated On Transactions id 3', 3, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:05:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (184, 'Record updated On Visit Details id 3', 3, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:05:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (185, 'Record updated On Transactions id 4', 4, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:06:07', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (186, 'Record updated On Visit Details id 4', 4, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:06:07', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (187, 'New Record inserted On Read System Notification id 3', 3, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:46:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (188, 'New Record inserted On Read System Notification id 4', 4, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 05:46:29', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (189, 'New Record inserted On Item Category id 1', 1, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 05:57:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (190, 'New Record inserted On Item Category id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 05:57:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (191, 'New Record inserted On Item Category id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 05:57:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (192, 'New Record inserted On Item Category id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 05:57:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (193, 'New Record inserted On Item Category id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 05:57:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (194, 'New Record inserted On Item Store id 1', 1, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:02:07', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (195, 'New Record inserted On Item Store id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:02:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (196, 'New Record inserted On Item Store id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:03:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (197, 'New Record inserted On Item Store id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:04:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (198, 'New Record inserted On Item Store id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:05:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (199, 'New Record inserted On Item supplier id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:05:29', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (200, 'New Record inserted On Patient id 11', 11, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:10:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (201, 'Record updated On Patient id 11', 11, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:10:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (202, 'New Record inserted On Item supplier id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:10:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (203, 'Record updated On Patient id 11', 11, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:11:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (204, 'New Record inserted On IPD id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:11:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (205, 'Record updated On Bed id 9', 9, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:11:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (206, 'New Record inserted On Patient bed history id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:11:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (207, 'New Record inserted On Medicine Supplier id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:12:35', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (208, 'Record updated On Medicine Supplier id 1', 1, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:12:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (209, 'New Record inserted On Unit id 30', 30, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:12:50', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (210, 'New Record inserted On Unit id 31', 31, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:13:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (211, 'New Record inserted On Item supplier id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:13:07', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (212, 'New Record inserted On Supplier Bill Basic id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:15:39', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (213, 'New Record inserted On Item supplier id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:16:39', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (214, 'New Record inserted On Radiology Parameter id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:16:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (215, 'New Record inserted On Supplier Bill Basic id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:17:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (216, 'New Record inserted On Item supplier id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:18:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (217, 'New Record inserted On Item supplier id 6', 6, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:20:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (218, 'Record updated For Staff id 13', 13, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:28:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (219, 'New Record inserted On Radiology Parameter id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:31:07', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (220, 'Record updated For Staff id 14', 14, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:31:14', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (221, 'New Record inserted On Radiology Parameter id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:32:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (222, 'New Record inserted On Radiology Parameter id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:32:18', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (223, 'New Record inserted On Charge Categories id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:34:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (224, 'Record updated For Staff id 15', 15, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:35:52', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (225, 'Record updated For Staff id 16', 16, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:37:05', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (226, 'Record updated For Staff id 17', 17, 0, 'Update', '103.77.139.193', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 06:40:49', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (227, 'New Record inserted On Supplier Bill Basic id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:40:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (228, 'Record updated On Medicine Supplier id 1', 1, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:41:52', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (229, 'New Record inserted On Medicine Supplier id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:42:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (230, 'New Record inserted On Supplier Bill Basic id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 06:50:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (231, 'New Record inserted On pathology Test id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:00:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (232, 'New Record inserted On Company id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:01:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (233, 'New Record inserted On Company id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:01:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (234, 'New Record inserted On Company id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:01:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (235, 'New Record inserted On pathology Test id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:02:39', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (236, 'New Record inserted On pathology Test id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:03:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (237, 'New Record inserted On pathology Test id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:03:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (238, 'New Record inserted On Pharmacy id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:04:19', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (239, 'New Record inserted On Unit id 32', 32, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:04:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (240, 'New Record inserted On Pathology Parameter id 8', 8, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:05:06', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (241, 'New Record inserted On Pathology Parameter id 9', 9, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:05:26', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (242, 'New Record inserted On Pathology Parameter id 10', 10, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:05:59', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (243, 'Record updated On Charge Categories id 1', 1, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:06:35', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (244, 'New Record inserted On pathology Test id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:06:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (245, 'New Record inserted On Charge Categories id 4', 4, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:06:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (246, 'New Record inserted On Pharmacy id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:07:33', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (247, 'New Record inserted On Pathology Parameter id 11', 11, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:08:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (248, 'New Record inserted On Pathology Parameter id 12', 12, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:08:21', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (249, 'Record updated On Bed id 9', 9, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:09:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (250, 'Record updated On IPD id 3', 3, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:09:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (251, 'Record updated On Patient id 11', 11, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:09:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (252, 'New Record inserted On pathology Test id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:09:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (253, 'New Record inserted On Radio id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:10:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (254, 'New Record inserted On Radio id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:11:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (255, 'New Record inserted On Dose Interval id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (256, 'New Record inserted On Dose Interval id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (257, 'New Record inserted On Dose Interval id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (258, 'New Record inserted On Dose Interval id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (259, 'New Record inserted On Dose Interval id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (260, 'New Record inserted On Dose Interval id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (261, 'New Record inserted On Dose Interval id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (262, 'New Record inserted On Dose Interval id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:17:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (263, 'New Record inserted On Medicine Dosage id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:21:35', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (264, 'New Record inserted On Medicine Dosage id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:22:05', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (265, 'New Record inserted On Medicine Dosage id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:22:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (266, 'New Record inserted On Dose Duration id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (267, 'New Record inserted On Dose Duration id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (268, 'New Record inserted On Dose Duration id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (269, 'New Record inserted On Dose Duration id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (270, 'New Record inserted On Dose Duration id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (271, 'New Record inserted On Dose Duration id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (272, 'New Record inserted On Dose Duration id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (273, 'New Record inserted On Dose Duration id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:26:46', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (274, 'New Record inserted On Medicine Supplier id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (275, 'New Record inserted On Medicine Supplier id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:27:50', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (276, 'New Record inserted On Medication Report id 1', 1, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:28:51', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (277, 'New Record inserted On medicine group id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:30:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (278, 'New Record inserted On medicine group id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:31:37', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (279, 'New Record inserted On medicine group id 9', 9, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:33:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (280, 'New Record inserted On medicine group id 10', 10, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:33:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (281, 'New Record inserted On Item id 1', 1, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:35:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (282, 'New Record inserted On Item id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:35:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (283, 'New Record inserted On Item id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:37:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (284, 'New Record inserted On Item id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:37:49', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (285, 'New Record inserted On Global Shift id 1', 1, 0, 'Insert', '103.77.139.128', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:38:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (286, 'New Record inserted On Item id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:38:49', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (287, 'New Record inserted On Item id 6', 6, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:39:26', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (288, 'New Record inserted On Global Shift id 2', 2, 0, 'Insert', '103.77.139.128', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:39:31', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (289, 'New Record inserted On Item id 7', 7, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:40:01', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (290, 'New Record inserted On Item id 8', 8, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:40:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (291, 'Record updated On Global Shift id 1', 1, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:40:50', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (292, 'Record updated On Global Shift id 2', 2, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:41:17', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (293, 'New Record inserted On Global Shift id 3', 3, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:41:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (294, 'New Record inserted On Finding Category id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (295, 'New Record inserted On Finding Category id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (296, 'New Record inserted On Finding Category id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (297, 'New Record inserted On Finding Category id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (298, 'New Record inserted On Finding Category id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (299, 'New Record inserted On Item id 9', 9, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:42:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (300, 'New Record inserted On Finding id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:43:06', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (301, 'New Record inserted On Finding id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:43:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (302, 'New Record inserted On Item id 10', 10, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:43:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (303, 'New Record inserted On Finding id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:43:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (304, 'New Record inserted On Finding id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:44:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (305, 'New Record inserted On Finding id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:44:17', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (306, 'New Record inserted On Item Stock id 1', 1, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:48:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (307, 'New Record inserted On Patient id 12', 12, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (308, 'Record updated On Patient id 12', 12, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (309, 'New Record inserted On operation_category id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (310, 'New Record inserted On operation_category id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (311, 'New Record inserted On operation_category id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (312, 'New Record inserted On operation_category id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (313, 'New Record inserted On operation_category id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (314, 'New Record inserted On operation_category id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (315, 'New Record inserted On operation_category id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (316, 'New Record inserted On operation_category id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (317, 'New Record inserted On operation_category id 9', 9, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:48:42', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (318, 'Record deleted Where Item Stock id 1', 1, 0, 'Delete', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:50:44', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (319, 'Record deleted On Item Category id 3', 3, 0, 'Delete', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:51:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (320, 'Record deleted Where Item Store id 1', 1, 0, 'Delete', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:51:13', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (321, 'Record deleted On Item Supplier id 2', 2, 0, 'Delete', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:51:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (322, 'Record updated On Settings id 1', 1, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:52:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (323, 'New Record inserted On Operation id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (324, 'New Record inserted On Operation id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (325, 'New Record inserted On Operation id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (326, 'New Record inserted On Operation id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (327, 'New Record inserted On Operation id 5', 5, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (328, 'New Record inserted On Operation id 6', 6, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (329, 'New Record inserted On Operation id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (330, 'New Record inserted On Operation id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (331, 'New Record inserted On Operation id 9', 9, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (332, 'New Record inserted On Operation id 10', 10, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (333, 'New Record inserted On Operation id 11', 11, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (334, 'New Record inserted On Operation id 12', 12, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (335, 'New Record inserted On Operation id 13', 13, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (336, 'New Record inserted On Operation id 14', 14, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (337, 'New Record inserted On Operation id 15', 15, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:53:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (338, 'New Record inserted On Item Stock id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:53:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (339, 'New Record inserted On Item Stock id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:55:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (340, 'New Record inserted On Operation id 16', 16, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (341, 'New Record inserted On Operation id 17', 17, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (342, 'New Record inserted On Operation id 18', 18, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (343, 'New Record inserted On Operation id 19', 19, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (344, 'New Record inserted On Operation id 20', 20, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (345, 'New Record inserted On Operation id 21', 21, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (346, 'New Record inserted On Operation id 22', 22, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (347, 'New Record inserted On Operation id 23', 23, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (348, 'New Record inserted On Operation id 24', 24, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (349, 'New Record inserted On Operation id 25', 25, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (350, 'New Record inserted On Operation id 26', 26, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 07:55:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (351, 'New Record inserted On Item Stock id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:56:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (352, 'New Record inserted On Item Stock id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 07:56:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (353, 'New Record inserted For Organisation id 1', 1, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:02:26', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (354, 'New Record inserted For Organisation id 2', 2, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:03:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (355, 'New Record inserted For Organisation id 3', 3, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:03:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (356, 'New Record inserted For Organisation id 4', 4, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:04:49', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (357, 'New Record inserted On Staff Designation id 5', 5, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:05:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (358, 'New Record inserted On Department id 8', 8, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:06:41', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (359, 'New Record inserted On Specialist id 8', 8, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:06:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (360, 'Record updated Change Password For Staff id 6', 6, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:07:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (361, 'New Record inserted On Charge Categories id 5', 5, 0, 'Insert', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 08:09:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (362, 'New Record inserted On Leave Types id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:13:31', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (363, 'New Record inserted On Leave Types id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:13:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (364, 'New Record inserted On Leave Types id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:14:24', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (365, 'Record updated For Staff id 18', 18, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:15:29', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (366, 'New Record inserted On Item Issue id 1', 1, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:19:22', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (367, 'New Record inserted On Item Issue id 2', 2, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:20:17', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (368, 'New Record inserted On Item Issue id 3', 3, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:21:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (369, 'New Record inserted On Item Issue id 4', 4, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:21:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (370, 'New Record inserted On Duty Roster Shift id1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:23:37', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (371, 'New Record inserted On Duty Roster Shift id2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:24:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (372, 'New Record inserted On Duty Roster Shift id3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:24:41', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (373, 'New Record inserted On Duty Roster Shift id4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:25:05', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (374, 'New Record inserted On Duty Roster Shift id5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:25:30', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (375, 'New Record inserted On Duty Roster Shift id1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:26:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (376, 'New Record inserted On Duty Roster Shift id2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:26:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (377, 'Record updated On Duty Roster Shift id 2', 2, 0, 'Update', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:26:39', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (378, 'New Record inserted On Duty Roster Shift id3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:26:50', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (379, 'New Record inserted On Duty Roster Shift id4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (380, 'New Record inserted On Duty Roster Shift id5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:13', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (381, 'New Record inserted On duty_roster_assign id1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (382, 'New Record inserted On duty_roster_assign id2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (383, 'New Record inserted On duty_roster_assign id3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (384, 'New Record inserted On duty_roster_assign id4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (385, 'New Record inserted On duty_roster_assign id5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (386, 'New Record inserted On duty_roster_assign id6', 6, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (387, 'New Record inserted On duty_roster_assign id7', 7, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (388, 'New Record inserted On duty_roster_assign id8', 8, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (389, 'New Record inserted On duty_roster_assign id9', 9, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (390, 'New Record inserted On duty_roster_assign id10', 10, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (391, 'New Record inserted On duty_roster_assign id11', 11, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (392, 'New Record inserted On duty_roster_assign id12', 12, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (393, 'New Record inserted On duty_roster_assign id13', 13, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (394, 'New Record inserted On duty_roster_assign id14', 14, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (395, 'New Record inserted On duty_roster_assign id15', 15, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (396, 'New Record inserted On duty_roster_assign id16', 16, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (397, 'New Record inserted On duty_roster_assign id17', 17, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (398, 'New Record inserted On duty_roster_assign id18', 18, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (399, 'New Record inserted On duty_roster_assign id19', 19, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (400, 'New Record inserted On duty_roster_assign id20', 20, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (401, 'New Record inserted On duty_roster_assign id21', 21, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (402, 'New Record inserted On duty_roster_assign id22', 22, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (403, 'New Record inserted On duty_roster_assign id23', 23, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (404, 'New Record inserted On duty_roster_assign id24', 24, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (405, 'New Record inserted On duty_roster_assign id25', 25, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (406, 'New Record inserted On duty_roster_assign id26', 26, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (407, 'New Record inserted On duty_roster_assign id27', 27, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (408, 'New Record inserted On duty_roster_assign id28', 28, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (409, 'New Record inserted On duty_roster_assign id29', 29, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (410, 'New Record inserted On duty_roster_assign id30', 30, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (411, 'New Record inserted On duty_roster_assign id31', 31, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (412, 'New Record inserted On duty_roster_assign id32', 32, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (413, 'New Record inserted On duty_roster_assign id33', 33, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (414, 'New Record inserted On duty_roster_assign id34', 34, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (415, 'New Record inserted On duty_roster_assign id35', 35, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (416, 'New Record inserted On duty_roster_assign id36', 36, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (417, 'New Record inserted On duty_roster_assign id37', 37, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (418, 'New Record inserted On duty_roster_assign id38', 38, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (419, 'New Record inserted On duty_roster_assign id39', 39, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (420, 'New Record inserted On duty_roster_assign id40', 40, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (421, 'New Record inserted On duty_roster_assign id41', 41, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (422, 'New Record inserted On duty_roster_assign id42', 42, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (423, 'New Record inserted On duty_roster_assign id43', 43, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (424, 'New Record inserted On duty_roster_assign id44', 44, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (425, 'New Record inserted On duty_roster_assign id45', 45, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (426, 'New Record inserted On duty_roster_assign id46', 46, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (427, 'New Record inserted On duty_roster_assign id47', 47, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (428, 'New Record inserted On duty_roster_assign id48', 48, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (429, 'New Record inserted On duty_roster_assign id49', 49, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (430, 'New Record inserted On duty_roster_assign id50', 50, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (431, 'New Record inserted On duty_roster_assign id51', 51, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (432, 'New Record inserted On duty_roster_assign id52', 52, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (433, 'New Record inserted On duty_roster_assign id53', 53, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (434, 'New Record inserted On duty_roster_assign id54', 54, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (435, 'New Record inserted On duty_roster_assign id55', 55, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (436, 'New Record inserted On duty_roster_assign id56', 56, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (437, 'New Record inserted On duty_roster_assign id57', 57, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (438, 'New Record inserted On duty_roster_assign id58', 58, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (439, 'New Record inserted On duty_roster_assign id59', 59, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (440, 'New Record inserted On duty_roster_assign id60', 60, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:27:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (441, 'New Record inserted On duty_roster_assign id61', 61, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (442, 'New Record inserted On duty_roster_assign id62', 62, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (443, 'New Record inserted On duty_roster_assign id63', 63, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (444, 'New Record inserted On duty_roster_assign id64', 64, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (445, 'New Record inserted On duty_roster_assign id65', 65, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (446, 'New Record inserted On duty_roster_assign id66', 66, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (447, 'New Record inserted On duty_roster_assign id67', 67, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (448, 'New Record inserted On duty_roster_assign id68', 68, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (449, 'New Record inserted On duty_roster_assign id69', 69, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (450, 'New Record inserted On duty_roster_assign id70', 70, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (451, 'New Record inserted On duty_roster_assign id71', 71, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (452, 'New Record inserted On duty_roster_assign id72', 72, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (453, 'New Record inserted On duty_roster_assign id73', 73, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (454, 'New Record inserted On duty_roster_assign id74', 74, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (455, 'New Record inserted On duty_roster_assign id75', 75, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (456, 'Record updated Change Password For Staff id 9', 9, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:47', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (457, 'New Record inserted On duty_roster_assign id76', 76, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (458, 'New Record inserted On duty_roster_assign id77', 77, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (459, 'New Record inserted On duty_roster_assign id78', 78, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (460, 'New Record inserted On duty_roster_assign id79', 79, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (461, 'New Record inserted On duty_roster_assign id80', 80, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (462, 'New Record inserted On duty_roster_assign id81', 81, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (463, 'New Record inserted On duty_roster_assign id82', 82, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (464, 'New Record inserted On duty_roster_assign id83', 83, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (465, 'New Record inserted On duty_roster_assign id84', 84, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (466, 'New Record inserted On duty_roster_assign id85', 85, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (467, 'New Record inserted On duty_roster_assign id86', 86, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (468, 'New Record inserted On duty_roster_assign id87', 87, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (469, 'New Record inserted On duty_roster_assign id88', 88, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (470, 'New Record inserted On duty_roster_assign id89', 89, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (471, 'New Record inserted On duty_roster_assign id90', 90, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (472, 'New Record inserted On duty_roster_assign id91', 91, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:28:54', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (473, 'New Record inserted On duty_roster_assign id92', 92, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (474, 'New Record inserted On duty_roster_assign id93', 93, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (475, 'New Record inserted On duty_roster_assign id94', 94, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (476, 'New Record inserted On duty_roster_assign id95', 95, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (477, 'New Record inserted On duty_roster_assign id96', 96, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (478, 'New Record inserted On duty_roster_assign id97', 97, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (479, 'New Record inserted On duty_roster_assign id98', 98, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (480, 'New Record inserted On duty_roster_assign id99', 99, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (481, 'New Record inserted On duty_roster_assign id100', 100, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (482, 'New Record inserted On duty_roster_assign id101', 101, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (483, 'New Record inserted On duty_roster_assign id102', 102, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (484, 'New Record inserted On duty_roster_assign id103', 103, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (485, 'New Record inserted On duty_roster_assign id104', 104, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (486, 'New Record inserted On duty_roster_assign id105', 105, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (487, 'New Record inserted On duty_roster_assign id106', 106, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (488, 'New Record inserted On duty_roster_assign id107', 107, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (489, 'New Record inserted On duty_roster_assign id108', 108, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (490, 'New Record inserted On duty_roster_assign id109', 109, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (491, 'New Record inserted On duty_roster_assign id110', 110, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (492, 'New Record inserted On duty_roster_assign id111', 111, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (493, 'New Record inserted On duty_roster_assign id112', 112, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (494, 'New Record inserted On duty_roster_assign id113', 113, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (495, 'New Record inserted On duty_roster_assign id114', 114, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (496, 'New Record inserted On duty_roster_assign id115', 115, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (497, 'New Record inserted On duty_roster_assign id116', 116, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (498, 'New Record inserted On duty_roster_assign id117', 117, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (499, 'New Record inserted On duty_roster_assign id118', 118, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (500, 'New Record inserted On duty_roster_assign id119', 119, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (501, 'New Record inserted On duty_roster_assign id120', 120, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (502, 'New Record inserted On duty_roster_assign id121', 121, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (503, 'New Record inserted On duty_roster_assign id122', 122, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (504, 'New Record inserted On duty_roster_assign id123', 123, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (505, 'New Record inserted On duty_roster_assign id124', 124, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (506, 'New Record inserted On duty_roster_assign id125', 125, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (507, 'New Record inserted On duty_roster_assign id126', 126, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (508, 'New Record inserted On duty_roster_assign id127', 127, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (509, 'New Record inserted On duty_roster_assign id128', 128, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (510, 'New Record inserted On duty_roster_assign id129', 129, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (511, 'New Record inserted On duty_roster_assign id130', 130, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (512, 'New Record inserted On duty_roster_assign id131', 131, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (513, 'New Record inserted On duty_roster_assign id132', 132, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (514, 'New Record inserted On duty_roster_assign id133', 133, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (515, 'New Record inserted On duty_roster_assign id134', 134, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (516, 'New Record inserted On duty_roster_assign id135', 135, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (517, 'New Record inserted On duty_roster_assign id136', 136, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (518, 'New Record inserted On duty_roster_assign id137', 137, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (519, 'New Record inserted On duty_roster_assign id138', 138, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (520, 'New Record inserted On duty_roster_assign id139', 139, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (521, 'New Record inserted On duty_roster_assign id140', 140, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (522, 'New Record inserted On duty_roster_assign id141', 141, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (523, 'New Record inserted On duty_roster_assign id142', 142, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (524, 'New Record inserted On duty_roster_assign id143', 143, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (525, 'New Record inserted On duty_roster_assign id144', 144, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (526, 'New Record inserted On duty_roster_assign id145', 145, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (527, 'New Record inserted On duty_roster_assign id146', 146, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (528, 'New Record inserted On duty_roster_assign id147', 147, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (529, 'New Record inserted On duty_roster_assign id148', 148, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (530, 'New Record inserted On duty_roster_assign id149', 149, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (531, 'New Record inserted On duty_roster_assign id150', 150, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (532, 'New Record inserted On duty_roster_assign id151', 151, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:25', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (533, 'New Record inserted On duty_roster_assign id152', 152, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (534, 'New Record inserted On duty_roster_assign id153', 153, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (535, 'New Record inserted On duty_roster_assign id154', 154, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (536, 'New Record inserted On duty_roster_assign id155', 155, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (537, 'New Record inserted On duty_roster_assign id156', 156, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (538, 'New Record inserted On duty_roster_assign id157', 157, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (539, 'New Record inserted On duty_roster_assign id158', 158, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (540, 'New Record inserted On duty_roster_assign id159', 159, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (541, 'New Record inserted On duty_roster_assign id160', 160, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (542, 'New Record inserted On duty_roster_assign id161', 161, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (543, 'New Record inserted On duty_roster_assign id162', 162, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (544, 'New Record inserted On duty_roster_assign id163', 163, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (545, 'New Record inserted On duty_roster_assign id164', 164, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (546, 'New Record inserted On duty_roster_assign id165', 165, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (547, 'New Record inserted On duty_roster_assign id166', 166, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (548, 'New Record inserted On duty_roster_assign id167', 167, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (549, 'New Record inserted On duty_roster_assign id168', 168, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:29:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (550, 'New Record inserted For Blood Donor id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:37:03', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (551, 'New Record inserted On Charge Categories id 6', 6, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:41:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (552, 'New Record inserted For Blood Donor id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:43:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (553, 'New Record inserted On Shift Details id 1', 1, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:48:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (554, 'New Record inserted On Appointment Created 1', 1, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:51:24', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (555, 'Record deleted On  OPD  id 5', 5, 0, 'Delete', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:52:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (556, 'Record deleted On  OPD  id 2', 2, 0, 'Delete', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:53:33', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (557, 'Record updated For Staff id 18', 18, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:54:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (558, 'Record updated For Staff id 18', 18, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 08:54:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (559, 'New Record inserted On Patient id 13', 13, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:56:41', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (560, 'Record updated On Patient id 13', 13, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:56:41', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (561, 'Record updated On Shift Details id 12', 12, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 08:58:38', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (562, 'Record updated On Shift Details id 12', 12, 0, 'Update', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:00:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (563, 'New Record inserted On Appointment Created 2', 2, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:01:40', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (564, 'New Record inserted On Charge Type Master id 13', 13, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:10:37', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (565, 'New Record inserted On Charge Type Module id 28', 28, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:10:37', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (566, 'New Record inserted On Charge Categories id 7', 7, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:10:53', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (567, 'New Record inserted On Charge Categories id 8', 8, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:11:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (568, 'Record updated On Bed Group id 1', 1, 0, 'Update', '115.187.40.45', 'Windows 10', 'Firefox 140.0', '2025-07-02 09:11:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (569, 'New Record inserted On Charge Categories id 9', 9, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:11:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (570, 'New Record inserted On Charge Categories id 10', 10, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:12:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (571, 'New Record inserted On Charge Categories id 11', 11, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:13:27', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (572, 'New Record inserted On Charge Categories id 12', 12, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:13:48', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (573, 'New Record inserted On Charge Categories id 13', 13, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:14:20', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (574, 'New Record inserted On Charge Categories id 14', 14, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:14:33', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (575, 'New Record inserted On Charge Categories id 15', 15, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:14:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (576, 'New Record inserted On Charge Categories id 16', 16, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:15:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (577, 'New Record inserted On Charge Categories id 17', 17, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:15:39', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (578, 'New Record inserted On Charge Categories id 18', 18, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:15:49', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (579, 'New Record inserted On Blood Donor  id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:22:23', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (580, 'New Record inserted On Transactions id 7', 7, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:22:23', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (581, 'Record updated On Patient id 11', 11, 0, 'Update', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:26:14', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (582, 'New Record inserted On Patient Charges id 7', 7, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:26:18', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (583, 'New Record inserted On Patient id 14', 14, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:26:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (584, 'Record updated On Patient id 14', 14, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:26:43', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (585, 'New Record inserted On Transactions id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:29:58', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (586, 'New Record inserted On Pharmacy Bill Basic id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:31:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (587, 'New Record inserted On Transactions id 10', 10, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:31:44', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (588, 'Record updated For Staff id 19', 19, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:34:14', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (589, 'New Record inserted On Pharmacy Bill Basic id 2', 2, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:37:01', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (590, 'New Record inserted On Roles id 10', 10, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:39:16', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (591, 'New Record inserted For Blood Donor id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:41:18', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (592, 'New Record inserted On Blood Donor  id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:42:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (593, 'New Record inserted On Transactions id 12', 12, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:42:11', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (594, 'New Record inserted On Item Stock id 6', 6, 0, 'Insert', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:42:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (595, 'Record updated For Item Stock id 6', 6, 0, 'Update', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:42:36', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (596, 'Record updated For Item Stock id 6', 6, 0, 'Update', '103.77.139.155', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:43:06', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (597, 'New Record inserted On Department id 9', 9, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:43:22', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (598, 'New Record inserted On Blood Donor  id 3', 3, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:54:09', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (599, 'New Record inserted On Transactions id 13', 13, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 09:54:09', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (600, 'Record updated For Staff id 20', 20, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 09:57:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (601, 'New Record inserted On Department id 10', 10, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:08:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (602, 'New Record inserted On Department id 11', 11, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:09:08', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (603, 'Record updated For Staff id 21', 21, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:16:38', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (604, 'New Record inserted On Staff Designation id 6', 6, 0, 'Insert', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:34:12', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (605, 'Record updated On Staff Designation id 5', 5, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:34:26', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (606, 'Record updated For Staff id 21', 21, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:36:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (607, 'Record updated For Staff id 21', 21, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:36:56', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (608, 'Record updated For Staff id 21', 21, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:40:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (609, 'Record updated For Staff id 21', 21, 0, 'Update', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Windows 10', 'Chrome 137.0.0.0', '2025-07-02 10:40:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (610, 'New Record inserted On Patient id 15', 15, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:46:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (611, 'Record updated On Patient id 15', 15, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:46:45', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (612, 'Record updated On Patient id 15', 15, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:47:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (613, 'New Record inserted On IPD id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:47:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (614, 'Record updated On Bed id 2', 2, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:47:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (615, 'New Record inserted On Patient bed history id 4', 4, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:47:34', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (616, 'New Record inserted On Transactions id 14', 14, 0, 'Insert', '223.185.29.80', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:48:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (617, 'New Record inserted On Medication Report id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:53:09', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (618, 'Record updated On Medicine Dosage id 1', 1, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:53:44', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (619, 'Record updated On Medicine Dosage id 2', 2, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:53:52', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (620, 'Record updated On Medicine Dosage id 3', 3, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:54:00', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (621, 'New Record inserted On Ipd Prescription Basic id 1', 1, 0, 'Insert', '115.187.40.45', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:56:01', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (622, 'New Record inserted On Transactions id 15', 15, 0, 'Insert', '115.187.40.45', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:57:41', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (623, 'New Record inserted On Ipd Prescription Basic id 2', 2, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 10:58:55', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (624, 'New Record inserted On Patient Charges id 8', 8, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:01:24', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (625, 'New Record inserted On Transactions id 16', 16, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:02:44', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (626, 'New Record inserted On Patient Timeline id 1', 1, 0, 'Insert', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:08:57', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (627, 'Record updated On Settings id 1', 1, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:26:22', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (628, 'Record updated On Settings id 1', 1, 0, 'Update', '103.242.189.206', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:28:50', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (629, 'New Record inserted On Visitors Purpose id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:32:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (630, 'New Record inserted On Visitors Purpose id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:32:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (631, 'New Record inserted On Visitors Purpose id 3', 3, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:32:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (632, 'New Record inserted On Visitors Purpose id 4', 4, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:32:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (633, 'New Record inserted On Visitors Purpose id 5', 5, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:32:02', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (634, 'New Record inserted On complaint_type id 1', 1, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:34:04', '2025-07-02');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (635, 'New Record inserted On complaint_type id 2', 2, 0, 'Insert', '45.124.4.181', 'Windows 10', 'Chrome 138.0.0.0', '2025-07-02 11:34:04', '2025-07-02');


#
# TABLE STRUCTURE FOR: medication_report
#

DROP TABLE IF EXISTS `medication_report`;

CREATE TABLE `medication_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_dosage_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `opd_details_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `remark` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `generated_by` (`generated_by`),
  KEY `pharmacy_id` (`pharmacy_id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `medicine_dosage_id` (`medicine_dosage_id`),
  KEY `opd_details_id` (`opd_details_id`),
  KEY `index_date` (`date`),
  KEY `index_time` (`time`),
  CONSTRAINT `medication_report_ibfk_1` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medication_report_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medication_report_ibfk_3` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medication_report_ibfk_4` FOREIGN KEY (`medicine_dosage_id`) REFERENCES `medicine_dosage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medication_report_ibfk_5` FOREIGN KEY (`opd_details_id`) REFERENCES `opd_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medication_report` (`id`, `medicine_dosage_id`, `pharmacy_id`, `opd_details_id`, `ipd_id`, `date`, `time`, `remark`, `generated_by`, `created_at`) VALUES (1, 2, 1, NULL, 3, '2025-07-02', '13:00:00', 'At an interval of 4 to 6 hours. SOS', 1, '2025-07-02 07:28:51');
INSERT INTO `medication_report` (`id`, `medicine_dosage_id`, `pharmacy_id`, `opd_details_id`, `ipd_id`, `date`, `time`, `remark`, `generated_by`, `created_at`) VALUES (2, 1, 2, NULL, 4, '2025-07-02', '16:22:00', '', 1, '2025-07-02 10:53:09');


#
# TABLE STRUCTURE FOR: medicine_bad_stock
#

DROP TABLE IF EXISTS `medicine_bad_stock`;

CREATE TABLE `medicine_bad_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_batch_details_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  KEY `medicine_batch_details_id` (`medicine_batch_details_id`),
  KEY `index_outward_date` (`outward_date`),
  KEY `index_expiry_date` (`expiry_date`),
  KEY `index_batch_no` (`batch_no`),
  KEY `index_quantity` (`quantity`),
  CONSTRAINT `medicine_bad_stock_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medicine_bad_stock_ibfk_2` FOREIGN KEY (`medicine_batch_details_id`) REFERENCES `medicine_batch_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: medicine_batch_details
#

DROP TABLE IF EXISTS `medicine_batch_details`;

CREATE TABLE `medicine_batch_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_bill_basic_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `inward_date` datetime NOT NULL,
  `expiry` date NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `packing_qty` varchar(100) NOT NULL,
  `purchase_rate_packing` varchar(100) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `mrp` float(10,2) DEFAULT 0.00,
  `purchase_price` float(10,2) DEFAULT 0.00,
  `tax` float(10,2) DEFAULT 0.00,
  `sale_rate` float(10,2) DEFAULT 0.00,
  `batch_amount` float(10,2) DEFAULT 0.00,
  `amount` float(10,2) DEFAULT 0.00,
  `available_quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `supplier_bill_basic_id` (`supplier_bill_basic_id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  KEY `index_inward_date` (`inward_date`),
  KEY `index_expiry` (`expiry`),
  KEY `index_batch_no` (`batch_no`),
  KEY `index_packing_qty` (`packing_qty`),
  KEY `index_purchase_rate_packing` (`purchase_rate_packing`),
  KEY `index_quantity` (`quantity`),
  KEY `index_mrp` (`mrp`),
  KEY `index_purchase_price` (`purchase_price`),
  KEY `index_tax` (`tax`),
  KEY `index_sale_rate` (`sale_rate`),
  KEY `index_batch_amount` (`batch_amount`),
  KEY `index_amount` (`amount`),
  KEY `index_available_quantity` (`available_quantity`),
  CONSTRAINT `medicine_batch_details_ibfk_1` FOREIGN KEY (`supplier_bill_basic_id`) REFERENCES `supplier_bill_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medicine_batch_details_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `pharmacy_id`, `inward_date`, `expiry`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `tax`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (1, 1, 2, '2025-07-02 11:43:00', '2026-02-28', 'AZT250B2306', '6', '', '100', '2.00', '1.50', '12.00', '1.75', '100.00', '150.00', 100, '2025-07-02 06:15:39');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `pharmacy_id`, `inward_date`, `expiry`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `tax`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (2, 1, 1, '2025-07-02 11:43:00', '2025-12-31', 'PCM500MAR25', '10', '', '100', '0.50', '0.40', '5.00', '0.45', '50.00', '40.00', 100, '2025-07-02 06:15:39');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `pharmacy_id`, `inward_date`, `expiry`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `tax`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (3, 2, 3, '2025-07-02 11:45:00', '2026-01-31', 'CTZ10JAN26', '10', '', '100', '0.30', '0.25', '5.00', '0.28', '30.00', '25.00', 100, '2025-07-02 06:17:16');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `pharmacy_id`, `inward_date`, `expiry`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `tax`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (4, 3, 4, '2025-07-02 12:05:00', '2025-12-31', 'MET500DEC25', '10', '', '100', '0.45', '0.40', '5.00', '0.42', '45.00', '40.00', 100, '2025-07-02 06:40:58');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `pharmacy_id`, `inward_date`, `expiry`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `tax`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (5, 4, 5, '2025-07-02 12:17:00', '2025-12-31', 'FRT200SEP25', '1', '', '20', '6.50', '5.50', '12.00', '6.00', '130.00', '110.00', 20, '2025-07-02 06:50:45');


#
# TABLE STRUCTURE FOR: medicine_category
#

DROP TABLE IF EXISTS `medicine_category`;

CREATE TABLE `medicine_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_category` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_medicine_category` (`medicine_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (1, 'Antibiotic', '2025-07-01 13:26:35');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (2, 'Analgesic', '2025-07-01 13:26:54');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (3, 'Antipyretic', '2025-07-01 13:27:15');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (4, 'Antacid', '2025-07-01 13:27:26');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (5, 'Antiseptic', '2025-07-01 13:27:36');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (6, 'Antihistamine', '2025-07-01 13:27:47');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (7, '	Antidiabetic', '2025-07-01 13:45:42');
INSERT INTO `medicine_category` (`id`, `medicine_category`, `created_at`) VALUES (8, 'Respiratory', '2025-07-01 13:51:33');


#
# TABLE STRUCTURE FOR: medicine_dosage
#

DROP TABLE IF EXISTS `medicine_dosage`;

CREATE TABLE `medicine_dosage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_category_id` int(11) DEFAULT NULL,
  `dosage` varchar(100) NOT NULL,
  `units_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `medicine_category_id` (`medicine_category_id`),
  KEY `charge_units_id` (`units_id`),
  KEY `index_dosage` (`dosage`),
  CONSTRAINT `medicine_dosage_ibfk_1` FOREIGN KEY (`medicine_category_id`) REFERENCES `medicine_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medicine_dosage_ibfk_2` FOREIGN KEY (`units_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage`, `units_id`, `created_at`) VALUES (1, 1, '1 ', 1, '2025-07-02 07:21:35');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage`, `units_id`, `created_at`) VALUES (2, 2, '1–2', 1, '2025-07-02 07:22:05');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage`, `units_id`, `created_at`) VALUES (3, 3, '1', 1, '2025-07-02 07:22:47');


#
# TABLE STRUCTURE FOR: medicine_group
#

DROP TABLE IF EXISTS `medicine_group`;

CREATE TABLE `medicine_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (1, 'Macrolide', '2025-07-01 13:32:46');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (2, 'NSAID', '2025-07-01 13:32:46');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (3, 'PPI', '2025-07-01 13:32:46');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (4, 'Cephalosporin', '2025-07-01 13:32:46');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (5, 'Corticosteroid', '2025-07-01 13:32:46');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (6, 'Antipyretic', '2025-07-01 13:37:14');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (7, 'Topical Antiseptic', '2025-07-02 07:30:47');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (8, 'Biguanide', '2025-07-02 07:31:37');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (9, 'ICS + LABA', '2025-07-02 07:33:57');
INSERT INTO `medicine_group` (`id`, `group_name`, `created_at`) VALUES (10, 'Antidiabetic', '2025-07-02 07:33:57');


#
# TABLE STRUCTURE FOR: medicine_supplier
#

DROP TABLE IF EXISTS `medicine_supplier`;

CREATE TABLE `medicine_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `supplier_drug_licence` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_supplier` (`supplier`),
  KEY `index_contact` (`contact`),
  KEY `index_supplier_person` (`supplier_person`),
  KEY `index_supplier_person_contact` (`supplier_person_contact`),
  KEY `index_supplier_drug_licence` (`supplier_drug_licence`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `medicine_supplier` (`id`, `supplier`, `contact`, `supplier_person`, `supplier_person_contact`, `supplier_drug_licence`, `address`, `created_at`) VALUES (1, 'Medilink Distributors', '', '', '', '', '', '2025-07-02 06:12:35');
INSERT INTO `medicine_supplier` (`id`, `supplier`, `contact`, `supplier_person`, `supplier_person_contact`, `supplier_drug_licence`, `address`, `created_at`) VALUES (2, 'HealthCare Pharma Supply', '', '', '', '', '', '2025-07-02 06:42:03');
INSERT INTO `medicine_supplier` (`id`, `supplier`, `contact`, `supplier_person`, `supplier_person_contact`, `supplier_drug_licence`, `address`, `created_at`) VALUES (3, 'CureWell Medicals', '', '', '', '', '', '2025-07-02 07:27:36');
INSERT INTO `medicine_supplier` (`id`, `supplier`, `contact`, `supplier_person`, `supplier_person_contact`, `supplier_drug_licence`, `address`, `created_at`) VALUES (4, 'Zenith Pharmaceuticals', '', '', '', '', '', '2025-07-02 07:27:50');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `template_id` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `file` varchar(200) NOT NULL,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_title` (`title`),
  KEY `index_send_mail` (`send_mail`),
  KEY `index_send_sms` (`send_sms`),
  KEY `index_is_group` (`is_group`),
  KEY `index_is_individual` (`is_individual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` int(11) DEFAULT 0,
  `is_sms` int(11) DEFAULT 0,
  `is_mobileapp` int(11) NOT NULL,
  `is_notification` int(11) NOT NULL,
  `display_notification` int(11) NOT NULL,
  `display_sms` int(11) NOT NULL,
  `template` longtext DEFAULT NULL,
  `template_id` varchar(100) NOT NULL,
  `subject` text DEFAULT NULL,
  `variables` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_type` (`type`),
  KEY `index_is_mail` (`is_mail`),
  KEY `index_is_sms` (`is_sms`),
  KEY `index_is_mobileapp` (`is_mobileapp`),
  KEY `index_is_notification` (`is_notification`),
  KEY `index_display_notification` (`display_notification`),
  KEY `index_display_sms` (`display_sms`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (1, 'opd_patient_registration', 1, 0, 1, 1, 1, 1, 'Dear {{patient_name}} your OPD Registration at Smart Hospital is successful on date {{appointment_date}} with Patient Id {{patient_id}} and OPD No {{opdno}}', '', 'OPD Patient', '{{patient_name}} {{appointment_date}} {{patient_id}} {{opdno}}', '2021-10-22 05:57:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (2, 'ipd_patient_registration', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your IPD Registration at Smart Hospital is successful  with Patient Id {{patient_id}} and IPD No {{ipd_no}}', '', 'IPD Patient Registration', '{{patient_name}} {{patient_id}} {{ipd_no}}', '2021-10-22 05:59:33');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (3, 'ipd_patient_discharged', 1, 0, 0, 0, 1, 1, 'IPD Patient {{patient_name}} is now discharged from Smart Hospital\nTotal bill amount is {{currency_symbol}}{{total_amount}}\nTotal paid amount is {{currency_symbol}}{{paid_amount}}\nTotal balance bill amount is {{currency_symbol}}{{balance_amount}}', '', 'IPD Patient Discharge', '{{patient_name}} {{currency_symbol}} {{total_amount}} {{paid_amount}} {balance_amount}}', '2021-10-25 02:32:35');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (5, 'login_credential', 1, 0, 0, 0, 0, 1, 'Hello {{display_name}} your Smart Hospital login details are Url: {{url}} Username: {{username}} Password: {{password}}', '', 'Smart Hospital Login Credential', '{{display_name}} {{url}} {{username}} {{password}}', '2021-10-22 06:18:21');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (6, 'appointment_approved', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your appointment with {{staff_name}} {{staff_surname}} is confirmed on {{date}} with appointment no: {{appointment_no}}', '', 'Appointment Approved', '{{patient_name}} {{staff_name}}\n{{staff_surname}}  {{date}} {{appointment_no}}', '2021-10-22 23:56:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (7, 'live_meeting', 1, 0, 0, 0, 0, 1, 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute.', '', 'Live Meeting', '{{title}} {{date}} {{duration}}', '2021-10-22 23:54:58');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (8, 'live_consult', 1, 0, 0, 0, 1, 1, 'Dear patient, your live consultation {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute.', '', 'Live Consultation', '{{title}} {{date}} {{duration}}', '2021-10-22 06:28:26');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (9, 'opd_patient_discharged', 1, 0, 0, 0, 1, 1, 'OPD No {{opd_no}}  {{patient_name}} is now discharged from Smart Hospital.\r\n\r\nTotal bill amount was {{currency_symbol}}  {{total_amount}} \r\nTotal paid amount was {{currency_symbol}}{{paid_amount}}  \r\nTotal balance amount is {{currency_symbol}}{{balance_amount}}', '', 'OPD Patient Discharged', '{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}}{{currency_symbol}} {{billing_amount}}', '2021-10-22 06:25:06');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `template_id`, `subject`, `variables`, `created_at`) VALUES (10, 'forgot_password', 1, 0, 0, 0, 0, 0, 'Dear  {{display_name}}, recently a request was submitted to reset password for your account with email: {{email}}. If you didn\'t make the request, just ignore this email, otherwise you can reset your password using this link <a href=\'{{resetpasslink}}\'>click here to reset your password</a>, if you\'re having trouble clicking the password reset link, copy and paste below URL  into your web browser. {{resetpasslink}} <br> Regards,  <br>\r\nSmart Hospital', '', 'Reset Password Request', '{{display_name}}  {{email}}  {{resetpasslink}', '2021-10-22 06:34:34');


#
# TABLE STRUCTURE FOR: nurse_note
#

DROP TABLE IF EXISTS `nurse_note`;

CREATE TABLE `nurse_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `staff_id` (`staff_id`),
  KEY `index_date` (`date`),
  CONSTRAINT `nurse_note_ibfk_1` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `nurse_note_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `nurse_note` (`id`, `date`, `ipd_id`, `staff_id`, `note`, `comment`, `created_by`, `updated_at`, `created_at`) VALUES (1, '2025-07-02 16:21:00', 4, 16, 'Patient returned to ward post-appendectomy. Vital signs stable (BP: 120/78, HR: 78 bpm).  \r\nDressing dry and intact. No complaints of pain at this time.  \r\nUrine output adequate. NPO maintained.', 'Will monitor vitals every 2 hours. Informed physician on duty.', 1, '2025-07-02 16:21:00', '2025-07-02 10:52:33');


#
# TABLE STRUCTURE FOR: nurse_notes_comment
#

DROP TABLE IF EXISTS `nurse_notes_comment`;

CREATE TABLE `nurse_notes_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nurse_note_id` int(11) DEFAULT NULL,
  `comment_staffid` int(11) DEFAULT NULL,
  `comment_staff` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `nurse_note_id` (`nurse_note_id`),
  KEY `comment_staffid` (`comment_staffid`),
  CONSTRAINT `nurse_notes_comment_ibfk_1` FOREIGN KEY (`nurse_note_id`) REFERENCES `nurse_note` (`id`) ON DELETE CASCADE,
  CONSTRAINT `nurse_notes_comment_ibfk_2` FOREIGN KEY (`comment_staffid`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: obstetric_history
#

DROP TABLE IF EXISTS `obstetric_history`;

CREATE TABLE `obstetric_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `place_of_delivery` varchar(250) NOT NULL,
  `pregnancy_duration` varchar(250) NOT NULL,
  `pregnancy_complications` varchar(250) NOT NULL,
  `birth_weight` varchar(250) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `infant_feeding` varchar(250) NOT NULL,
  `alive_dead` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `death_cause` varchar(250) NOT NULL,
  `previous_medical_history` text NOT NULL,
  `special_instruction` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_place_of_delivery` (`place_of_delivery`),
  KEY `index_pregnancy_duration` (`pregnancy_duration`),
  KEY `index_pregnancy_complications` (`pregnancy_complications`),
  KEY `index_birth_weight` (`birth_weight`),
  KEY `index_gender` (`gender`),
  KEY `index_infant_feeding` (`infant_feeding`),
  KEY `index_alive_dead` (`alive_dead`),
  KEY `index_date` (`date`),
  KEY `index_death_cause` (`death_cause`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: opd_details
#

DROP TABLE IF EXISTS `opd_details`;

CREATE TABLE `opd_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_reference_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `is_ipd_moved` int(11) NOT NULL DEFAULT 0,
  `discharged` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `generated_by` (`generated_by`),
  CONSTRAINT `opd_details_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `opd_details_ibfk_2` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `opd_details_ibfk_3` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `opd_details` (`id`, `case_reference_id`, `patient_id`, `generated_by`, `is_ipd_moved`, `discharged`, `created_at`) VALUES (3, 5, 9, 1, 0, 'no', '2025-07-02 05:02:27');
INSERT INTO `opd_details` (`id`, `case_reference_id`, `patient_id`, `generated_by`, `is_ipd_moved`, `discharged`, `created_at`) VALUES (4, 6, 10, 1, 0, 'no', '2025-07-02 05:04:04');
INSERT INTO `opd_details` (`id`, `case_reference_id`, `patient_id`, `generated_by`, `is_ipd_moved`, `discharged`, `created_at`) VALUES (6, 9, 13, 1, 0, 'no', '2025-07-02 09:01:40');


#
# TABLE STRUCTURE FOR: operation
#

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation` varchar(250) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `index_operation` (`operation`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `operation_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (1, 'Appendectomy', 1, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (2, 'Hernia Repair (Inguinal/Incisional)', 1, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (3, 'Cholecystectomy (Gallbladder Removal)', 1, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (4, 'Hemorrhoidectomy', 1, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (5, 'Coronary Artery Bypass Graft (CABG)', 4, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (6, 'Valve Replacement (Aortic/Mitral)', 4, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (7, 'Lobectomy', 4, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (8, 'Pericardiectomy', 4, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (9, 'Cesarean Section (C-Section)', 5, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (10, 'Hysterectomy (Abdominal/Vaginal/Laparoscopic)', 5, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (11, 'Dilatation & Curettage (D&C)', 5, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (12, 'Ovarian Cystectomy', 5, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (13, 'Transurethral Resection of Prostate (TURP)', 6, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (14, 'Cystoscopy', 6, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (15, 'Nephrectomy', 6, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (16, 'Tonsillectomy', 7, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (17, 'Adenoidectomy', 7, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (18, 'Septoplasty', 7, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (19, 'Tympanoplasty', 7, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (20, 'Trabeculectomy', 8, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (21, 'Vitrectomy', 8, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (22, 'Retinal Detachment Repair', 8, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (23, 'Rhinoplasty', 9, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (24, 'Scar Revision', 9, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (25, 'Burn Debridement', 9, 'yes', '2025-07-02');
INSERT INTO `operation` (`id`, `operation`, `category_id`, `is_active`, `created_at`) VALUES (26, 'Cleft Lip/Palate Repair', 9, 'yes', '2025-07-02');


#
# TABLE STRUCTURE FOR: operation_category
#

DROP TABLE IF EXISTS `operation_category`;

CREATE TABLE `operation_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (1, 'General Surgery', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (2, 'Orthopedic Surgery', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (3, 'Neurosurgery', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (4, 'Cardiothoracic Surgery', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (5, 'Obstetrics & Gynecology (OBG)', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (6, 'Urology', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (7, 'ENT Surgery', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (8, 'Ophthalmology', 'yes', '2025-07-02');
INSERT INTO `operation_category` (`id`, `category`, `is_active`, `created_at`) VALUES (9, 'Plastic & Reconstructive Surgery', 'yes', '2025-07-02');


#
# TABLE STRUCTURE FOR: operation_theatre
#

DROP TABLE IF EXISTS `operation_theatre`;

CREATE TABLE `operation_theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opd_details_id` int(11) DEFAULT NULL,
  `ipd_details_id` int(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `operation_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `operation_type` varchar(100) DEFAULT NULL,
  `consultant_doctor` int(11) DEFAULT NULL,
  `ass_consultant_1` varchar(50) DEFAULT NULL,
  `ass_consultant_2` varchar(50) DEFAULT NULL,
  `anesthetist` varchar(50) DEFAULT NULL,
  `anaethesia_type` varchar(50) DEFAULT NULL,
  `ot_technician` varchar(100) DEFAULT NULL,
  `ot_assistant` varchar(100) DEFAULT NULL,
  `result` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `opd_details_id` (`opd_details_id`),
  KEY `ipd_details_id` (`ipd_details_id`),
  KEY `consultant_doctor` (`consultant_doctor`),
  KEY `generated_by` (`generated_by`),
  KEY `operation_id` (`operation_id`),
  KEY `index_date` (`date`),
  CONSTRAINT `operation_theatre_ibfk_1` FOREIGN KEY (`opd_details_id`) REFERENCES `opd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `operation_theatre_ibfk_2` FOREIGN KEY (`ipd_details_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `operation_theatre_ibfk_3` FOREIGN KEY (`consultant_doctor`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `operation_theatre_ibfk_4` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `operation_theatre_ibfk_5` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: organisation
#

DROP TABLE IF EXISTS `organisation`;

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_organisation_name` (`organisation_name`),
  KEY `index_code` (`code`),
  KEY `index_contact_no` (`contact_no`),
  KEY `index_address` (`address`),
  KEY `index_contact_person_name` (`contact_person_name`),
  KEY `index_contact_person_phone` (`contact_person_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`, `created_at`) VALUES (1, 'MediAssist TPA Pvt. Ltd.', 'TPA001', '+91-9876543210', '', '', '', '2025-07-02 08:02:26');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`, `created_at`) VALUES (2, 'Raksha TPA Pvt. Ltd.	', 'TPA002', '+91-9123456789	', '', '', '', '2025-07-02 08:03:04');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`, `created_at`) VALUES (3, 'Paramount Health Services	', 'TPA003', '+91-9988776655	', '', '', '', '2025-07-02 08:03:25');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`, `created_at`) VALUES (4, 'Vidal Health TPA	', 'TPA004', '+91-9812345678	', '', '', '', '2025-07-02 08:04:49');


#
# TABLE STRUCTURE FOR: organisations_charges
#

DROP TABLE IF EXISTS `organisations_charges`;

CREATE TABLE `organisations_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `org_charge` float(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `charge_id` (`charge_id`),
  CONSTRAINT `organisations_charges_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `organisations_charges_ibfk_2` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (1, 4, 5, '0.00', '2025-07-02 08:10:14');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (2, 3, 5, '0.00', '2025-07-02 08:10:14');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (3, 2, 5, '0.00', '2025-07-02 08:10:14');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (4, 1, 5, '0.00', '2025-07-02 08:10:14');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (5, 4, 6, '0.00', '2025-07-02 08:43:32');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (6, 3, 6, '0.00', '2025-07-02 08:43:32');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (7, 2, 6, '0.00', '2025-07-02 08:43:32');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (8, 1, 6, '0.00', '2025-07-02 08:43:32');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (13, 4, 7, '0.00', '2025-07-02 09:19:45');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (14, 3, 7, '0.00', '2025-07-02 09:19:45');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (15, 2, 7, '0.00', '2025-07-02 09:19:45');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (16, 1, 7, '0.00', '2025-07-02 09:19:45');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (17, 4, 8, '0.00', '2025-07-02 09:20:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (18, 3, 8, '0.00', '2025-07-02 09:20:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (19, 2, 8, '0.00', '2025-07-02 09:20:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (20, 1, 8, '0.00', '2025-07-02 09:20:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (21, 4, 9, '0.00', '2025-07-02 09:20:33');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (22, 3, 9, '0.00', '2025-07-02 09:20:33');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (23, 2, 9, '0.00', '2025-07-02 09:20:33');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (24, 1, 9, '0.00', '2025-07-02 09:20:33');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (25, 4, 10, '0.00', '2025-07-02 09:21:01');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (26, 3, 10, '0.00', '2025-07-02 09:21:01');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (27, 2, 10, '0.00', '2025-07-02 09:21:01');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (28, 1, 10, '0.00', '2025-07-02 09:21:01');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (29, 4, 11, '0.00', '2025-07-02 09:21:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (30, 3, 11, '0.00', '2025-07-02 09:21:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (31, 2, 11, '0.00', '2025-07-02 09:21:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (32, 1, 11, '0.00', '2025-07-02 09:21:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (33, 4, 12, '0.00', '2025-07-02 09:21:31');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (34, 3, 12, '0.00', '2025-07-02 09:21:31');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (35, 2, 12, '0.00', '2025-07-02 09:21:31');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (36, 1, 12, '0.00', '2025-07-02 09:21:31');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (37, 4, 13, '0.00', '2025-07-02 09:21:51');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (38, 3, 13, '0.00', '2025-07-02 09:21:51');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (39, 2, 13, '0.00', '2025-07-02 09:21:51');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (40, 1, 13, '0.00', '2025-07-02 09:21:51');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (41, 4, 14, '0.00', '2025-07-02 09:22:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (42, 3, 14, '0.00', '2025-07-02 09:22:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (43, 2, 14, '0.00', '2025-07-02 09:22:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (44, 1, 14, '0.00', '2025-07-02 09:22:06');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (45, 4, 15, '0.00', '2025-07-02 09:22:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (46, 3, 15, '0.00', '2025-07-02 09:22:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (47, 2, 15, '0.00', '2025-07-02 09:22:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (48, 1, 15, '0.00', '2025-07-02 09:22:19');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (49, 4, 16, '0.00', '2025-07-02 09:22:35');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (50, 3, 16, '0.00', '2025-07-02 09:22:35');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (51, 2, 16, '0.00', '2025-07-02 09:22:35');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (52, 1, 16, '0.00', '2025-07-02 09:22:35');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (53, 4, 17, '0.00', '2025-07-02 09:23:20');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (54, 3, 17, '0.00', '2025-07-02 09:23:20');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (55, 2, 17, '0.00', '2025-07-02 09:23:20');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_id`, `org_charge`, `created_at`) VALUES (56, 1, 17, '0.00', '2025-07-02 09:23:20');


#
# TABLE STRUCTURE FOR: pathology
#

DROP TABLE IF EXISTS `pathology`;

CREATE TABLE `pathology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` int(11) DEFAULT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pathology_category_id` (`pathology_category_id`),
  KEY `charge_id` (`charge_id`),
  KEY `index_test_name` (`test_name`),
  KEY `index_short_name` (`short_name`),
  KEY `index_test_type` (`test_type`),
  KEY `index_unit` (`unit`),
  KEY `index_sub_category` (`sub_category`),
  KEY `index_report_days` (`report_days`),
  KEY `index_method` (`method`),
  CONSTRAINT `pathology_ibfk_1` FOREIGN KEY (`pathology_category_id`) REFERENCES `pathology_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_ibfk_2` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (1, 'Complete Blood Count', 'CBC', '', 2, '', '', '1', '', 2, '2025-07-02 07:00:16');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (2, 'Liver Function Test', 'LFT', '', 3, '', '', '2', '', 2, '2025-07-02 07:02:39');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (3, 'Kidney Function Test', 'KFT', '', 3, '', '', '1', '', 2, '2025-07-02 07:06:42');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (4, 'Urine Routine & Microscopy', 'URM', '', 6, '', '', '0', '', 2, '2025-07-02 07:09:57');


#
# TABLE STRUCTURE FOR: pathology_billing
#

DROP TABLE IF EXISTS `pathology_billing`;

CREATE TABLE `pathology_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_reference_id` int(11) DEFAULT NULL,
  `ipd_prescription_basic_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `total` float(10,2) DEFAULT 0.00,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `discount` float(10,2) DEFAULT 0.00,
  `tax_percentage` float(10,2) DEFAULT 0.00,
  `tax` float(10,2) DEFAULT 0.00,
  `net_amount` float(10,2) DEFAULT 0.00,
  `transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `insurance_validity` date DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `insurance_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `generated_by` (`generated_by`),
  KEY `ipd_prescription_basic_id` (`ipd_prescription_basic_id`),
  KEY `index_date` (`date`),
  KEY `index_doctor_name` (`doctor_name`),
  KEY `index_total` (`total`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_discount` (`discount`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_tax` (`tax`),
  KEY `index_net_amount` (`net_amount`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `pathology_billing_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_billing_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_billing_ibfk_3` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_billing_ibfk_4` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_billing_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pathology_billing_ibfk_6` FOREIGN KEY (`ipd_prescription_basic_id`) REFERENCES `ipd_prescription_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_billing_ibfk_7` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology_billing` (`id`, `case_reference_id`, `ipd_prescription_basic_id`, `date`, `patient_id`, `doctor_id`, `doctor_name`, `total`, `discount_percentage`, `discount`, `tax_percentage`, `tax`, `net_amount`, `transaction_id`, `note`, `organisation_id`, `insurance_validity`, `generated_by`, `created_at`, `updated_at`, `insurance_id`) VALUES (1, NULL, NULL, '2025-07-02 15:01:00', 11, 12, 'Anjali Rao (D011)', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '', NULL, NULL, 1, '2025-07-02 09:31:44', NULL, NULL);
INSERT INTO `pathology_billing` (`id`, `case_reference_id`, `ipd_prescription_basic_id`, `date`, `patient_id`, `doctor_id`, `doctor_name`, `total`, `discount_percentage`, `discount`, `tax_percentage`, `tax`, `net_amount`, `transaction_id`, `note`, `organisation_id`, `insurance_validity`, `generated_by`, `created_at`, `updated_at`, `insurance_id`) VALUES (2, 2, 1, '2025-07-02 16:26:00', 4, 8, 'Amitabh Kulkarni (D007)', '500.00', '0.00', '0.00', '0.00', '0.00', '500.00', NULL, '', NULL, NULL, 1, '2025-07-02 10:57:41', NULL, NULL);


#
# TABLE STRUCTURE FOR: pathology_category
#

DROP TABLE IF EXISTS `pathology_category`;

CREATE TABLE `pathology_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology_category` (`id`, `category_name`, `created_at`) VALUES (2, 'Hematology', '2025-07-01 13:27:43');
INSERT INTO `pathology_category` (`id`, `category_name`, `created_at`) VALUES (3, 'Biochemistry', '2025-07-01 13:27:57');
INSERT INTO `pathology_category` (`id`, `category_name`, `created_at`) VALUES (4, 'Immunology/Serology', '2025-07-01 13:28:45');
INSERT INTO `pathology_category` (`id`, `category_name`, `created_at`) VALUES (5, 'Endocrinology', '2025-07-01 13:29:17');
INSERT INTO `pathology_category` (`id`, `category_name`, `created_at`) VALUES (6, 'Clinical Pathology', '2025-07-01 13:29:29');


#
# TABLE STRUCTURE FOR: pathology_parameter
#

DROP TABLE IF EXISTS `pathology_parameter`;

CREATE TABLE `pathology_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(100) NOT NULL,
  `test_value` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `range_from` varchar(500) DEFAULT NULL,
  `range_to` varchar(500) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `index_parameter_name` (`parameter_name`),
  KEY `index_test_value` (`test_value`),
  KEY `index_reference_range` (`reference_range`),
  KEY `index_range_from` (`range_from`),
  KEY `index_range_to` (`range_to`),
  KEY `index_gender` (`gender`),
  KEY `index_unit` (`unit`),
  CONSTRAINT `pathology_parameter_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (1, 'Hemoglobin (Hb)', '', '13.5-17.5', '13.5', '17.5', '', 6, '', '2025-07-01 13:58:23');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (2, 'ALT (SGPT)', '', '7-56', '7', '56', '', 10, '', '2025-07-01 13:57:03');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (3, 'AST (SGOT)', '', '10-40', '10', '40', '', 10, '', '2025-07-01 13:57:25');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (4, 'ALP (Alkaline Phosphatase)', '', '40-129', '40', '129', '', 10, '', '2025-07-01 13:57:42');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (5, 'Bilirubin', '', '0.1-1.2', '0.1', '1.2', '', 10, '', '2025-07-01 13:58:03');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (6, 'Hematocrit (Hct)', '', '41-53', '41', '53', '', 6, '', '2025-07-01 13:58:44');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (7, 'Lymphocytes', '', '20-40', '20', '40', '', 6, '', '2025-07-01 13:59:14');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (8, 'Blood Urea', '', '10-40', '10', '40', '', 11, '', '2025-07-02 07:05:06');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (9, 'Blood Urea Nitrogen (BUN)', '', '7-20', '7', '20', '', 11, '', '2025-07-02 07:05:26');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (10, 'Uric Acid', '', '3.5-7.2', '3.5', '7.2', '', 11, '', '2025-07-02 07:05:59');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (11, 'pH', '', '4.5-8.0', '4.5', '8.0', '', 15, '', '2025-07-02 07:08:04');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (12, 'Urobilinogen', '', '0.1-1.0', '0.1', '1.0', '', 15, '', '2025-07-02 07:08:21');


#
# TABLE STRUCTURE FOR: pathology_parameterdetails
#

DROP TABLE IF EXISTS `pathology_parameterdetails`;

CREATE TABLE `pathology_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathology_id` int(11) DEFAULT NULL,
  `pathology_parameter_id` int(11) DEFAULT NULL,
  `created_id` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pathology_id` (`pathology_id`),
  KEY `pathology_parameter_id` (`pathology_parameter_id`),
  CONSTRAINT `pathology_parameterdetails_ibfk_1` FOREIGN KEY (`pathology_id`) REFERENCES `pathology` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_parameterdetails_ibfk_2` FOREIGN KEY (`pathology_parameter_id`) REFERENCES `pathology_parameter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (1, 1, 1, '2025-07-02 07:00:16');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (2, 2, 2, '2025-07-02 07:02:39');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (3, 2, 3, '2025-07-02 07:02:39');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (4, 1, 6, '2025-07-02 07:03:36');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (5, 1, 7, '2025-07-02 07:03:36');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (6, 3, 8, '2025-07-02 07:06:42');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (7, 3, 9, '2025-07-02 07:06:42');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (8, 3, 10, '2025-07-02 07:06:42');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (9, 4, 11, '2025-07-02 07:09:57');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `pathology_parameter_id`, `created_id`) VALUES (10, 4, 12, '2025-07-02 07:09:57');


#
# TABLE STRUCTURE FOR: pathology_report
#

DROP TABLE IF EXISTS `pathology_report`;

CREATE TABLE `pathology_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathology_bill_id` int(11) DEFAULT NULL,
  `pathology_id` int(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `parameter_update` date DEFAULT NULL,
  `tax_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `apply_charge` float(10,2) NOT NULL,
  `collection_date` date DEFAULT NULL,
  `collection_specialist` int(11) DEFAULT NULL,
  `pathology_center` varchar(250) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `report_name` text DEFAULT NULL,
  `pathology_result` text DEFAULT NULL COMMENT 'test result',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `pathology_bill_id` (`pathology_bill_id`),
  KEY `pathology_id` (`pathology_id`),
  KEY `collection_specialist` (`collection_specialist`),
  KEY `approved_by` (`approved_by`),
  KEY `index_reporting_date` (`reporting_date`),
  KEY `index_parameter_update` (`parameter_update`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_apply_charge` (`apply_charge`),
  KEY `index_collection_date` (`collection_date`),
  CONSTRAINT `pathology_report_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_report_ibfk_2` FOREIGN KEY (`pathology_bill_id`) REFERENCES `pathology_billing` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_report_ibfk_3` FOREIGN KEY (`pathology_id`) REFERENCES `pathology` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_report_ibfk_4` FOREIGN KEY (`collection_specialist`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_report_ibfk_5` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pathology_report` (`id`, `pathology_bill_id`, `pathology_id`, `customer_type`, `patient_id`, `reporting_date`, `parameter_update`, `tax_percentage`, `apply_charge`, `collection_date`, `collection_specialist`, `pathology_center`, `approved_by`, `patient_name`, `description`, `pathology_report`, `report_name`, `pathology_result`, `created_at`) VALUES (1, 1, 3, NULL, 11, '2025-07-02', NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 09:31:44');
INSERT INTO `pathology_report` (`id`, `pathology_bill_id`, `pathology_id`, `customer_type`, `patient_id`, `reporting_date`, `parameter_update`, `tax_percentage`, `apply_charge`, `collection_date`, `collection_specialist`, `pathology_center`, `approved_by`, `patient_name`, `description`, `pathology_report`, `report_name`, `pathology_result`, `created_at`) VALUES (2, 2, 1, NULL, 4, '2025-07-03', NULL, '0.00', '500.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 10:57:41');


#
# TABLE STRUCTURE FOR: pathology_report_parameterdetails
#

DROP TABLE IF EXISTS `pathology_report_parameterdetails`;

CREATE TABLE `pathology_report_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathology_report_id` int(11) DEFAULT NULL,
  `pathology_parameterdetail_id` int(11) DEFAULT NULL,
  `pathology_report_value` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pathology_report_id` (`pathology_report_id`),
  KEY `pathology_parameterdetail_id` (`pathology_parameterdetail_id`),
  CONSTRAINT `pathology_report_parameterdetails_ibfk_1` FOREIGN KEY (`pathology_report_id`) REFERENCES `pathology_report` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pathology_report_parameterdetails_ibfk_2` FOREIGN KEY (`pathology_parameterdetail_id`) REFERENCES `pathology_parameterdetails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: patient_bed_history
#

DROP TABLE IF EXISTS `patient_bed_history`;

CREATE TABLE `patient_bed_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_reference_id` int(11) DEFAULT NULL,
  `bed_group_id` int(11) DEFAULT NULL,
  `bed_id` int(11) DEFAULT NULL,
  `revert_reason` text DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `is_active` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `bed_group_id` (`bed_group_id`),
  KEY `bed_id` (`bed_id`),
  KEY `index_from_date` (`from_date`),
  KEY `index_to_date` (`to_date`),
  CONSTRAINT `patient_bed_history_ibfk_1` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_bed_history_ibfk_2` FOREIGN KEY (`bed_group_id`) REFERENCES `bed_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_bed_history_ibfk_3` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patient_bed_history` (`id`, `case_reference_id`, `bed_group_id`, `bed_id`, `revert_reason`, `from_date`, `to_date`, `is_active`, `created_at`) VALUES (1, 2, 2, 5, NULL, '2025-06-17 19:37:00', NULL, 'yes', '2025-07-01 14:10:46');
INSERT INTO `patient_bed_history` (`id`, `case_reference_id`, `bed_group_id`, `bed_id`, `revert_reason`, `from_date`, `to_date`, `is_active`, `created_at`) VALUES (2, 3, 1, 1, NULL, '2025-04-10 19:42:00', NULL, 'yes', '2025-07-01 14:13:49');
INSERT INTO `patient_bed_history` (`id`, `case_reference_id`, `bed_group_id`, `bed_id`, `revert_reason`, `from_date`, `to_date`, `is_active`, `created_at`) VALUES (3, 7, 3, 9, NULL, '2025-07-01 11:41:00', NULL, 'yes', '2025-07-02 06:11:40');
INSERT INTO `patient_bed_history` (`id`, `case_reference_id`, `bed_group_id`, `bed_id`, `revert_reason`, `from_date`, `to_date`, `is_active`, `created_at`) VALUES (4, 10, 1, 2, NULL, '2025-07-02 16:16:00', NULL, 'yes', '2025-07-02 10:47:34');


#
# TABLE STRUCTURE FOR: patient_charges
#

DROP TABLE IF EXISTS `patient_charges`;

CREATE TABLE `patient_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `opd_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `standard_charge` float(10,2) DEFAULT 0.00,
  `tpa_charge` float(10,2) DEFAULT 0.00,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `tax` float(10,2) DEFAULT 0.00,
  `apply_charge` float(10,2) DEFAULT 0.00,
  `amount` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `insurance_validity` date DEFAULT NULL,
  `insurance_id` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `opd_id` (`opd_id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `charge_id` (`charge_id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `index_qty` (`qty`),
  KEY `index_standard_charge` (`standard_charge`),
  KEY `index_tpa_charge` (`tpa_charge`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_tax` (`tax`),
  KEY `index_apply_charge` (`apply_charge`),
  KEY `index_amount` (`amount`),
  CONSTRAINT `patient_charges_ibfk_1` FOREIGN KEY (`opd_id`) REFERENCES `opd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_charges_ibfk_2` FOREIGN KEY (`ipd_id`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_charges_ibfk_3` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_charges_ibfk_4` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patient_charges` (`id`, `date`, `ipd_id`, `opd_id`, `qty`, `charge_id`, `standard_charge`, `tpa_charge`, `discount_percentage`, `tax`, `apply_charge`, `amount`, `note`, `organisation_id`, `insurance_validity`, `insurance_id`, `created_at`) VALUES (3, '2025-07-04 10:31:00', NULL, 3, 1, 1, '0.00', '0.00', '0.00', '0.00', '1000.00', '0.00', '', NULL, NULL, '', '2025-07-02 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `ipd_id`, `opd_id`, `qty`, `charge_id`, `standard_charge`, `tpa_charge`, `discount_percentage`, `tax`, `apply_charge`, `amount`, `note`, `organisation_id`, `insurance_validity`, `insurance_id`, `created_at`) VALUES (4, '2025-07-07 10:33:00', NULL, 4, 1, 1, '0.00', '0.00', '10.00', '0.00', '1000.00', '0.00', '', NULL, NULL, '', '2025-07-02 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `ipd_id`, `opd_id`, `qty`, `charge_id`, `standard_charge`, `tpa_charge`, `discount_percentage`, `tax`, `apply_charge`, `amount`, `note`, `organisation_id`, `insurance_validity`, `insurance_id`, `created_at`) VALUES (6, '2025-07-02 09:01:40', NULL, 6, 1, 5, '400.00', '0.00', '0.00', '0.00', '400.00', '400.00', NULL, NULL, NULL, NULL, '2025-07-02 09:01:40');
INSERT INTO `patient_charges` (`id`, `date`, `ipd_id`, `opd_id`, `qty`, `charge_id`, `standard_charge`, `tpa_charge`, `discount_percentage`, `tax`, `apply_charge`, `amount`, `note`, `organisation_id`, `insurance_validity`, `insurance_id`, `created_at`) VALUES (7, '2025-07-01 14:56:00', 1, NULL, 1, 4, '800.00', '0.00', '0.00', '0.00', '800.00', '800.00', '', NULL, NULL, NULL, '2025-07-02 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `ipd_id`, `opd_id`, `qty`, `charge_id`, `standard_charge`, `tpa_charge`, `discount_percentage`, `tax`, `apply_charge`, `amount`, `note`, `organisation_id`, `insurance_validity`, `insurance_id`, `created_at`) VALUES (8, '2025-07-02 16:30:00', 4, NULL, 1, 4, '800.00', '0.00', '0.00', '0.00', '800.00', '800.00', '', NULL, NULL, NULL, '2025-07-02 00:00:00');


#
# TABLE STRUCTURE FOR: patient_id_card
#

DROP TABLE IF EXISTS `patient_id_card`;

CREATE TABLE `patient_id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `hospital_address` varchar(500) NOT NULL,
  `background` text NOT NULL,
  `logo` text NOT NULL,
  `sign_image` text NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_patient_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_guardian_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_patient_unique_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_barcode` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_title` (`title`),
  KEY `index_hospital_name` (`hospital_name`),
  KEY `index_hospital_address` (`hospital_address`),
  KEY `index_header_color` (`header_color`),
  KEY `index_enable_patient_name` (`enable_patient_name`),
  KEY `index_enable_guardian_name` (`enable_guardian_name`),
  KEY `index_enable_patient_unique_id` (`enable_patient_unique_id`),
  KEY `index_enable_address` (`enable_address`),
  KEY `index_enable_phone` (`enable_phone`),
  KEY `index_enable_dob` (`enable_dob`),
  KEY `index_enable_blood_group` (`enable_blood_group`),
  KEY `index_status` (`status`),
  KEY `index_enable_barcode` (`enable_barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patient_id_card` (`id`, `title`, `hospital_name`, `hospital_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_patient_name`, `enable_guardian_name`, `enable_patient_unique_id`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`, `enable_barcode`, `created_at`) VALUES (1, 'Sample Patient Id Card', 'Royal Hospital', 'Nr Loyala Ashram, A 69, Shahpura Rd, Manisha Market, Sector  Bhopal', 'background.jpg', 'logo.jpg', 'signature.png', '#0796f5', 1, 1, 1, 1, 1, 1, 1, 1, 0, '2021-10-19 07:06:02');


#
# TABLE STRUCTURE FOR: patient_timeline
#

DROP TABLE IF EXISTS `patient_timeline`;

CREATE TABLE `patient_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `document` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `generated_users_type` varchar(100) NOT NULL,
  `generated_users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `generated_users_id` (`generated_users_id`),
  KEY `index_title` (`title`),
  KEY `index_date` (`date`),
  KEY `index_timeline_date` (`timeline_date`),
  CONSTRAINT `patient_timeline_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_timeline_ibfk_2` FOREIGN KEY (`generated_users_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patient_timeline` (`id`, `patient_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`, `generated_users_type`, `generated_users_id`, `created_at`) VALUES (1, 15, 'First Follow-Up', '2025-07-02 11:07:00', 'Symptoms have improved significantly. No adverse effects reported from current medication. Vitals stable. Advised to continue treatment ', '', 'yes', '2025-07-02 00:00:00', 'staff', 1, '2025-07-02 11:08:57');


#
# TABLE STRUCTURE FOR: patients
#

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `as_of_date` date DEFAULT NULL,
  `image` text DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `marital_status` varchar(100) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `blood_bank_product_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `patient_type` varchar(200) NOT NULL,
  `identification_number` varchar(60) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `app_key` varchar(200) NOT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `insurance_id` varchar(250) DEFAULT NULL,
  `insurance_validity` date DEFAULT NULL,
  `is_dead` varchar(255) NOT NULL DEFAULT 'no',
  `is_antenatal` int(11) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `disable_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `blood_bank_product_id` (`blood_bank_product_id`),
  KEY `idx_patient_name` (`patient_name`),
  KEY `idx_dob` (`dob`),
  KEY `idx_age` (`age`),
  KEY `idx_month` (`month`),
  KEY `idx_mobileno` (`mobileno`),
  KEY `idx_email` (`email`),
  KEY `idx_gender` (`gender`),
  KEY `idx_marital_status` (`marital_status`),
  KEY `idx_address` (`address`(500)),
  KEY `idx_guardian_name` (`guardian_name`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`blood_bank_product_id`) REFERENCES `blood_bank_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (4, NULL, 'Kunal Sen', '1980-02-06', 45, 4, 24, '2025-07-01', 'uploads/patient_images/no_image.png', '5632897412', '', 'Male', 'Married', '', NULL, '', 'Abinash Sen', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-01 14:10:14');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (5, NULL, 'Abisekh Roy', '2001-03-08', 24, 3, 24, '2025-07-01', 'uploads/patient_images/no_image.png', '', '', 'Male', 'Single', '', NULL, '', 'Anil Roy', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-01 14:11:52');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (6, NULL, 'Bikash Khan', NULL, 46, 0, 0, '2025-07-02', 'uploads/patient_images/no_image.png', '9836451258', '', 'Male', '', '', NULL, '', 'S. Khan', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 02:45:47');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (7, NULL, 'Bikash Khan', NULL, 46, 0, 0, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Male', '', '', NULL, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 02:57:15');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (8, NULL, 'Ram Sharma', '1985-07-01', 40, 0, 1, '2025-07-02', 'uploads/patient_images/no_image.png', '8901234567', '', 'Male', 'Single', '', NULL, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 04:57:54');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (9, NULL, 'Shyam Verma', '1985-07-20', 39, 11, 13, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Male', '', '', NULL, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 05:01:38');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (10, NULL, 'Riya Roy', '1989-01-01', 36, 6, 1, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Female', '', '', NULL, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 05:03:30');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (11, NULL, 'Sunita Thakur', '1998-06-09', 27, 0, 23, '2025-07-02', 'uploads/patient_images/no_image.png', '8956123478', '', 'Female', 'Married', '', 4, '', 'Amit Thakur', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 09:26:14');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (12, NULL, 'Avijit Sen', '2000-01-03', 25, 5, 30, '2025-07-02', 'uploads/patient_images/no_image.png', '5523698741', '', 'Male', 'Single', '', 2, '', 'Akshay sen', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 07:48:30');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (13, NULL, 'Virat Kohli', '1988-11-05', 36, 7, 27, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Male', 'Married', '', 4, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 08:56:41');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (14, NULL, 'Tina Roy', '2001-07-01', 24, 0, 1, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Female', 'Single', '', 3, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 09:26:43');
INSERT INTO `patients` (`id`, `lang_id`, `patient_name`, `dob`, `age`, `month`, `day`, `as_of_date`, `image`, `mobileno`, `email`, `gender`, `marital_status`, `blood_group`, `blood_bank_product_id`, `address`, `guardian_name`, `patient_type`, `identification_number`, `known_allergies`, `note`, `is_ipd`, `app_key`, `organisation_id`, `insurance_id`, `insurance_validity`, `is_dead`, `is_antenatal`, `is_active`, `disable_at`, `created_at`) VALUES (15, NULL, 'Raima Sen', '2001-07-01', 24, 0, 1, '2025-07-02', 'uploads/patient_images/no_image.png', '', '', 'Female', '', '', 1, '', '', '', '', '', '', '', '', NULL, '', NULL, 'no', 0, 'yes', NULL, '2025-07-02 10:46:45');


#
# TABLE STRUCTURE FOR: patients_vitals
#

DROP TABLE IF EXISTS `patients_vitals`;

CREATE TABLE `patients_vitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `vital_id` int(11) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `messure_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `index_reference_range` (`reference_range`),
  KEY `index_messure_date` (`messure_date`),
  KEY `vital_id` (`vital_id`),
  CONSTRAINT `patients_vitals_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patients_vitals_ibfk_2` FOREIGN KEY (`vital_id`) REFERENCES `vitals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patients_vitals_ibfk_3` FOREIGN KEY (`vital_id`) REFERENCES `vitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `patients_vitals` (`id`, `patient_id`, `vital_id`, `reference_range`, `messure_date`, `created_at`) VALUES (1, 15, 2, '60', '2025-07-02 16:37:00', '2025-07-02 11:07:45');


#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_payment_type` (`payment_type`),
  KEY `index_api_username` (`api_username`),
  KEY `index_api_secret_key` (`api_secret_key`),
  KEY `index_salt` (`salt`),
  KEY `index_api_publishable_key` (`api_publishable_key`),
  KEY `index_paytm_website` (`paytm_website`),
  KEY `index_paytm_industrytype` (`paytm_industrytype`),
  KEY `index_api_password` (`api_password`),
  KEY `index_api_signature` (`api_signature`),
  KEY `index_api_email` (`api_email`),
  KEY `index_paypal_demo` (`paypal_demo`),
  KEY `index_account_no` (`account_no`),
  KEY `index_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_payslip_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `staff_payslip_id` (`staff_payslip_id`),
  KEY `index_allowance_type` (`allowance_type`),
  KEY `index_amount` (`amount`),
  KEY `index_cal_type` (`cal_type`),
  CONSTRAINT `payslip_allowance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payslip_allowance_ibfk_2` FOREIGN KEY (`staff_payslip_id`) REFERENCES `staff_payslip` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-21 23:23:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-21 23:22:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-21 23:24:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-21 23:23:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (27, 8, 'Content Type', 'content_type', 1, 1, 1, 1, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1, '2018-12-16 22:55:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-21 23:35:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-21 23:35:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-21 23:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-21 23:36:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-21 23:41:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-21 23:40:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0, '2018-12-17 21:59:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (53, 15, 'Languages', 'languages', 1, 1, 0, 0, '2021-09-12 22:56:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-04 22:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-04 22:08:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-04 22:08:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-04 22:08:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-04 22:08:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-04 22:08:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-08 16:50:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-08 16:50:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-21 23:46:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-21 23:46:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-21 23:47:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-21 23:47:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-02 21:39:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-21 23:48:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-21 23:50:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-21 23:50:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-21 23:50:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (84, 17, 'Complain', 'complain', 1, 1, 1, 1, '2018-12-18 22:11:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1, '2018-11-14 13:49:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-21 23:53:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-21 23:53:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-21 23:53:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (89, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2021-09-13 02:12:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 1, 1, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (91, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2021-09-13 02:13:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-21 23:54:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-21 23:34:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-01 23:17:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 1, '2020-08-24 14:48:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (110, 18, 'LeaveTypes', 'leave_types', 1, 1, 1, 1, '2021-10-26 11:54:30');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-25 16:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-25 16:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-02 20:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (126, 15, 'Users', 'users', 1, 0, 0, 0, '2021-09-21 19:43:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-02 21:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-04 21:08:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-08 17:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-08 17:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1, '2018-12-19 22:37:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (134, 23, 'Prescription', 'prescription', 1, 1, 1, 1, '2018-10-10 14:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (135, 23, 'Visit', 'visit', 1, 1, 1, 1, '2021-09-16 20:39:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (137, 23, 'OPD Timeline', 'opd_timeline', 1, 1, 1, 1, '2021-02-24 01:02:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1, '2018-10-10 20:14:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (139, 24, 'Discharged Patients', 'discharged_patients', 1, 1, 1, 1, '2021-02-24 01:27:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (140, 24, 'Consultant Register', 'consultant_register', 1, 1, 1, 1, '2021-02-24 01:37:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (142, 24, 'IPD Timeline', 'ipd_timeline', 1, 1, 1, 1, '2021-02-25 01:30:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (143, 24, 'Charges', 'charges', 1, 1, 1, 1, '2018-10-10 14:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (144, 24, 'Payment', 'payment', 1, 1, 1, 1, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (146, 25, 'Medicine', 'medicine', 1, 1, 1, 1, '2018-10-10 14:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (148, 25, 'Pharmacy Bill', 'pharmacy_bill', 1, 1, 1, 1, '2021-02-25 01:33:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (149, 26, 'Pathology Test', 'pathology_test', 1, 1, 1, 1, '2021-02-25 01:36:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (152, 27, 'Radiology Test', 'radiology_test', 1, 1, 1, 1, '2021-02-25 01:45:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (153, 27, 'Radiology  Bill', 'radiology_bill', 1, 1, 1, 1, '2021-09-16 18:16:48');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0, '2018-12-19 22:08:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0, '2018-12-19 22:08:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0, '2018-12-19 22:08:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0, '2018-12-19 22:08:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0, '2018-12-19 22:08:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0, '2018-12-19 22:09:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0, '2018-12-19 22:09:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1, '2018-10-26 16:37:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1, '2018-10-26 16:37:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1, '2018-10-26 17:20:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1, '2018-10-26 17:20:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (171, 27, 'Radiology Category', 'radiology_category', 1, 1, 1, 1, '2021-02-25 01:52:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (173, 31, 'Organisation', 'organisation', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (176, 32, 'Hospital Charges', 'hospital_charges', 1, 1, 1, 1, '2021-09-12 20:29:30');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0, '2019-03-07 19:56:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0, '2019-03-07 19:56:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0, '2019-03-07 19:57:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (187, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-12-11 23:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0, '2018-12-11 23:22:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0, '2018-12-11 23:25:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (196, 24, 'Bed', 'bed', 1, 1, 1, 1, '2018-12-11 23:46:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0, '2018-12-11 23:39:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1, '2018-12-17 14:12:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (202, 30, 'Blood Stock', 'blood_stock', 1, 1, 0, 1, '2021-09-10 22:49:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1, '2018-12-12 00:19:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0, '2019-03-07 19:49:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0, '2019-03-07 19:49:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0, '2019-03-07 19:49:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0, '2019-03-07 19:50:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (212, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1, '2018-06-21 23:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (215, 34, 'Death Record', 'death_record', 1, 1, 1, 1, '2018-06-21 23:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (218, 23, 'Move Patient in IPD', 'opd_move_patient_in_ipd', 1, 0, 0, 0, '2021-09-16 21:00:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0, '2019-09-22 17:52:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1, '2019-09-23 13:59:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1, '2019-09-22 17:58:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0, '2019-09-22 18:03:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 0, 1, '2021-10-02 04:59:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1, '2019-09-22 18:09:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1, '2019-09-22 18:17:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (236, 36, 'Patient', 'patient', 1, 1, 1, 1, '2021-09-21 21:29:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0, '2019-09-22 19:25:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0, '2019-09-23 16:48:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (239, 36, 'Import', 'patient_import', 1, 0, 0, 0, '2019-10-03 14:20:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 0, 0, 0, '2021-10-07 04:06:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 0, 0, 0, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2020-08-11 18:52:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-03 17:15:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0, '2019-10-03 18:20:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-03 18:23:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0, '2019-10-03 18:24:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0, '2019-10-03 19:00:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (257, 26, 'Pathology Bill', 'pathology_bill', 1, 1, 1, 1, '2021-02-25 01:58:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0, '2019-10-13 16:12:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (259, 14, 'Death Report', 'death_report', 1, 0, 0, 0, '2019-10-13 16:13:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (260, 26, 'Pathology Unit', 'pathology_unit', 1, 1, 1, 1, '2020-07-21 14:13:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (261, 27, 'Radiology Unit', 'radiology_unit', 1, 1, 1, 1, '2020-07-21 14:14:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (262, 27, 'Radiology Parameter', 'radiology_parameter', 1, 1, 1, 1, '2020-07-21 14:20:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (263, 26, 'Pathology Parameter', 'pathology_parameter', 1, 1, 1, 1, '2020-07-21 14:20:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (264, 32, 'Charge Type', 'charge_type', 1, 1, 1, 1, '2024-08-21 09:29:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (265, 14, 'OPD Balance Report', 'opd_balance_report', 1, 0, 0, 0, '2020-07-27 15:03:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (266, 14, 'IPD Balance Report', 'ipd_balance_report', 1, 0, 0, 0, '2020-07-27 15:03:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (267, 15, 'Symptoms Type', 'symptoms_type', 1, 1, 1, 1, '2021-09-13 21:36:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (269, 37, 'Live Consultation', 'live_consultation', 1, 1, 0, 1, '2020-08-12 19:19:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (270, 37, 'Live Meeting', 'live_meeting', 1, 1, 0, 1, '2020-08-12 19:19:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (271, 14, 'Live Consultation Report', 'live_consultation_report', 1, 0, 0, 0, '2021-09-13 02:11:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (272, 14, 'Live Meeting Report', 'live_meeting_report', 1, 0, 0, 0, '2021-09-13 02:11:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (273, 37, 'Setting', 'setting', 1, 0, 1, 0, '2020-08-12 20:03:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (274, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2020-08-20 17:48:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (279, 15, 'Symptoms Head', 'symptoms_head', 1, 1, 1, 1, '2021-09-13 21:36:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (280, 18, 'Specialist', 'specialist', 1, 1, 1, 1, '2019-10-03 10:01:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (281, 22, 'General Income Widget', 'general_income_widget', 1, 0, 0, 0, '2018-12-19 16:38:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (282, 22, 'Expenses Widget', 'expenses_widget', 1, 0, 0, 0, '2018-12-19 16:38:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (283, 38, 'Referral Category', 'referral_category', 1, 1, 1, 1, '2021-06-11 02:54:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (284, 38, 'Referral Commission', 'referral_commission', 1, 1, 1, 1, '2021-06-11 02:54:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (285, 38, 'Referral Person', 'referral_person', 1, 1, 1, 1, '2021-06-11 02:55:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (286, 38, 'Referral Payment', 'referral_payment', 1, 1, 1, 1, '2021-06-11 02:55:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (287, 15, 'Prefix Setting', 'prefix_setting', 1, 0, 1, 0, '2021-06-11 20:46:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (288, 15, 'Captcha Setting', 'captcha_setting', 1, 0, 1, 0, '2021-06-11 21:43:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (289, 32, 'Tax Category', 'tax_category', 1, 1, 1, 1, '2021-06-11 22:16:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (290, 32, 'Unit Type', 'unit_type', 1, 1, 1, 1, '2021-06-11 22:16:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (291, 25, 'Dosage Interval', 'dosage_interval', 1, 1, 1, 1, '2021-06-12 00:15:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (292, 25, 'Dosage Duration', 'dosage_duration', 1, 1, 1, 1, '2021-06-12 00:15:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (293, 30, 'Blood Bank Product', 'blood_bank_product', 1, 1, 1, 1, '2021-06-12 00:51:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (294, 39, 'Slot', 'online_appointment_slot', 1, 1, 1, 1, '2021-09-14 01:04:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (295, 39, 'Doctor Shift', 'online_appointment_doctor_shift', 1, 0, 1, 0, '2021-06-12 01:43:48');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (296, 39, 'Shift', 'online_appointment_shift', 1, 1, 1, 1, '2021-06-12 01:24:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (297, 39, 'Doctor Wise Appointment', 'doctor_wise_appointment', 1, 0, 0, 0, '2021-10-07 01:45:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (298, 39, 'Patient Queue', 'patient_queue', 1, 0, 0, 0, '2021-10-07 01:45:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (299, 23, 'OPD Medication', 'opd_medication', 1, 1, 1, 1, '2021-06-14 20:00:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (300, 24, 'IPD Medication', 'ipd_medication', 1, 1, 1, 1, '2021-06-14 20:00:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (301, 24, 'Bed History', 'bed_history', 1, 0, 0, 0, '2021-06-14 20:00:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (302, 30, 'Blood Bank Components', 'blood_bank_components', 1, 1, 0, 1, '2021-06-15 00:46:48');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (303, 23, 'Operation Theatre', 'opd_operation_theatre', 1, 1, 1, 1, '2021-09-07 22:49:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (304, 23, 'Lab Investigation', 'opd_lab_investigation', 1, 0, 0, 0, '2021-09-06 19:36:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (305, 23, 'Patient Discharge', 'opd_patient_discharge', 1, 0, 1, 0, '2021-09-06 19:39:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (306, 23, 'Patient Discharge Revert', 'opd_patient_discharge_revert', 1, 0, 0, 0, '2021-09-06 19:39:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (307, 23, 'Treatment History', 'opd_treatment_history', 1, 0, 0, 0, '2021-09-06 19:49:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (308, 24, 'Lab Investigation', 'ipd_lab_investigation', 1, 0, 0, 0, '2021-09-06 20:45:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (309, 24, 'Patient Discharge', 'ipd_patient_discharge', 1, 0, 1, 0, '2021-09-06 22:08:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (310, 24, 'Patient Discharge Revert', 'ipd_patient_discharge_revert', 1, 0, 0, 0, '2021-09-06 22:14:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (311, 30, 'Issue Component', 'issue_component', 1, 1, 1, 1, '2021-09-06 22:21:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (312, 26, '	Add/Edit Collection Person', 'pathology_add_edit_collection_person', 1, 0, 1, 0, '2021-09-16 20:06:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (313, 25, 'Partial Payment', 'pharmacy_partial_payment', 1, 1, 0, 1, '2021-09-07 01:10:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (314, 26, 'Partial Payment', 'pathology_partial_payment', 1, 1, 0, 1, '2021-09-07 02:34:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (315, 27, 'Partial Payment', 'radiology_partial_payment', 1, 1, 0, 1, '2021-09-07 02:38:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (316, 28, 'Partial Payment', 'radiology_partial_payment', 1, 1, 0, 1, '2021-09-07 02:39:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (317, 30, 'Partial Payment', 'blood_bank_partial_payment', 1, 1, 0, 1, '2021-09-07 02:47:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (318, 29, 'Partial Payment', 'ambulance_partial_payment', 1, 1, 0, 1, '2021-09-07 02:48:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (319, 23, 'Checkup', 'checkup', 1, 1, 1, 1, '2021-09-16 20:40:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (320, 23, 'Print Bill', 'opd_print_bill', 1, 0, 0, 0, '2021-09-07 23:09:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (321, 23, 'Live Consult', 'opd_live_consult', 1, 0, 0, 0, '2021-09-08 00:53:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (322, 24, 'Nurse Note', 'nurse_note', 1, 1, 1, 1, '2021-09-08 01:20:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (323, 24, 'Bed Type', 'bed_type', 1, 1, 1, 1, '2021-09-08 20:06:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (324, 24, 'Bed Group', 'bed_group', 1, 1, 1, 1, '2021-09-08 20:07:08');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (325, 24, 'Floor', 'floor', 1, 1, 1, 1, '2021-09-08 20:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (326, 24, 'Operation Theatre', 'ipd_operation_theatre', 1, 1, 1, 1, '2021-09-08 22:38:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (327, 24, 'Live Consult', 'ipd_live_consultation', 1, 0, 0, 0, '2021-09-08 23:05:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (329, 24, 'Treatment History', 'ipd_treatment_history', 1, 0, 0, 0, '2021-09-06 20:45:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (330, 41, 'OPD Billing', 'opd_billing', 1, 0, 0, 0, '2021-09-09 00:33:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (331, 41, 'OPD Billing Payment', 'opd_billing_payment', 1, 1, 0, 0, '2021-09-09 01:10:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (332, 41, 'IPD Billing', 'ipd_billing', 1, 0, 0, 0, '2021-09-09 00:52:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (333, 41, 'IPD Billing Payment', 'ipd_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (334, 41, 'Pharmacy Billing', 'pharmacy_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (335, 41, 'Pharmacy Billing Payment', 'pharmacy_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (336, 41, 'Pathology Billing', 'pathology_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (337, 41, 'Pathology Billing Payment', 'pathology_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (338, 41, 'Radiology Billing', 'radiology_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (339, 41, 'Radiology Billing Payment', 'radiology_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (340, 41, 'Blood Bank Billing', 'blood_bank_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (341, 41, 'Blood Bank Billing Payment', 'blood_bank_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (342, 41, 'Ambulance Billing', 'ambulance_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (343, 41, 'Ambulance Billing Payment', 'ambulance_billing_payment', 1, 1, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (344, 41, 'Generate Bill', 'generate_bill', 1, 0, 0, 0, '2021-09-09 20:36:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (345, 41, 'Generate Discharge Card', 'generate_discharge_card', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (346, 40, 'Online Appointment', 'online_appointment', 1, 0, 0, 0, '2021-09-09 02:15:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (347, 31, 'TPA Charges ', 'tpa_charges', 1, 0, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (348, 15, 'System Notification Setting', 'system_notification_setting', 1, 0, 1, 0, '2018-07-04 22:08:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (349, 14, 'All Transaction Report', 'all_transaction_report', 1, 0, 0, 0, '2021-09-13 02:29:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (350, 14, 'Patient Visit Report', 'patient_visit_report', 1, 0, 0, 0, '2019-10-03 18:23:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (351, 14, 'Patient Bill Report', 'patient_bill_report', 1, 0, 0, 0, '2019-10-03 17:15:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (352, 14, 'Referral Report', 'referral_report', 1, 0, 0, 0, '2019-10-03 17:15:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (353, 27, 'Add/Edit Collection Person', 'radiology_add_edit_collection_person', 1, 0, 1, 0, '2021-09-16 20:06:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (354, 27, 'Add/Edit  Report', 'radiology_add_edit_report', 1, 0, 1, 0, '2021-09-16 20:06:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (355, 26, 'Add/Edit Report', 'pathology_add_edit_report', 1, 0, 1, 0, '2021-09-16 20:06:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (362, 42, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2021-09-20 16:48:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (363, 42, 'Certificate', 'certificate', 1, 1, 1, 1, '2021-09-20 16:48:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (364, 42, 'Generate Staff ID Card', 'generate_staff_id_card', 1, 0, 0, 0, '2021-09-20 16:56:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (365, 42, 'Staff ID Card', 'staff_id_card', 1, 1, 1, 1, '2021-09-20 16:56:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (366, 42, 'Generate Patient ID Card', 'generate_patient_id_card', 1, 0, 0, 0, '2021-09-20 23:13:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (367, 42, 'Patient ID Card', 'patient_id_card', 1, 1, 1, 1, '2021-09-20 16:54:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (369, 14, 'Component Issue Report', 'component_issue_report', 1, 0, 0, 0, '2019-03-07 19:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (370, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2021-09-28 01:08:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (371, 43, 'Chat', 'chat', 1, 0, 0, 0, '2021-10-07 05:05:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (372, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2021-10-29 07:41:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (373, 14, 'Daily Transaction Report', 'daily_transaction_report', 1, 0, 0, 0, '2021-10-29 07:42:08');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (374, 15, 'Operation', 'operation', 1, 1, 1, 1, '2021-10-29 07:45:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (375, 15, 'Operation Category', 'operation_category', 1, 1, 1, 1, '2021-10-29 07:45:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (386, 39, 'Appointment', 'appointment', 1, 1, 0, 1, '2021-12-24 09:36:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (387, 39, 'Reschedule', 'reschedule', 1, 0, 0, 0, '2021-12-24 09:36:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (388, 15, 'Finding', 'finding', 1, 1, 1, 1, '2021-10-29 07:45:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (389, 15, 'Finding Category', 'finding_category', 1, 1, 1, 1, '2021-10-29 07:45:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (390, 41, 'Appointment Billing', 'appointment_billing', 1, 0, 0, 0, '2021-09-09 00:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (391, 15, 'Vital', 'vital', 1, 1, 1, 1, '2021-10-29 07:45:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (392, 23, 'OPD Vitals', 'opd_vitals', 1, 1, 1, 1, '2018-12-19 22:37:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (393, 24, 'IPD Vitals', 'ipd_vitals', 1, 1, 1, 1, '2021-02-25 01:30:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (394, 24, 'Previous Obstetric History', 'ipd_previous_obstetric_history', 1, 1, 1, 1, '2021-02-25 01:30:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (395, 24, 'Postnatal History', 'ipd_postnatal_history', 1, 1, 1, 1, '2021-02-25 01:30:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (396, 24, 'Antenatal', 'ipd_antenatal', 1, 1, 1, 1, '2021-02-25 01:30:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (397, 39, 'Print Appointment Header Footer', 'print_appointment_header_footer', 1, 0, 0, 0, '2024-02-29 09:05:48');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (398, 23, 'Antenatal', 'opd_antenatal', 1, 1, 1, 1, '2024-03-11 11:24:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (399, 41, 'Payment Receipt Header Footer', 'payment_receipt_header_footer', 1, 0, 0, 0, '2024-02-29 10:44:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (400, 13, 'Send Credential', 'send_credential', 1, 0, 0, 0, '2024-02-29 10:44:43');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (401, 24, 'IPD Antenatal Finding Print Header Footer', 'ipd_antenatal_finding_print_header_footer', 1, 0, 0, 0, '2024-02-29 10:44:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (402, 23, 'OPD Antenatal Finding Print Header Footer ', 'opd_antenatal_finding_print_header_footer', 1, 0, 0, 0, '2024-02-29 10:44:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (403, 24, 'Discharge Summary Print Header Footer', 'discharge_summary_print_header_footer', 1, 0, 0, 0, '2024-02-29 10:44:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (404, 24, 'IPD Obstetric History Print Header Footer', 'ipd_obstetric_history_print_header_footer', 1, 0, 0, 0, '2024-02-29 10:44:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (405, 39, 'Appointment Priority', 'appointment_priority', 1, 1, 1, 1, '2021-06-12 01:24:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (406, 25, 'Unit', 'medicine_unit', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (407, 25, 'Company', 'medicine_company', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (408, 25, 'Medicine Group', 'medicine_group', 1, 1, 1, 1, '2018-10-24 19:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (409, 8, 'Content Share List', 'content_share_list', 1, 0, 0, 1, '2024-04-20 06:05:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (410, 8, 'Upload/Share Content', 'upload_share_content', 1, 1, 0, 1, '2024-04-20 06:41:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (411, 8, 'Generate URL', 'generate_url', 1, 0, 0, 0, '2024-04-20 06:41:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (412, 8, 'Share', 'share_content', 1, 0, 0, 0, '2024-04-20 06:41:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (413, 23, 'OPD Bill Print Header Footer', 'opd_bill_print_header_footer', 1, 0, 1, 0, '2024-05-01 12:39:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (414, 15, 'Attendance Setting', 'attendance_setting', 1, 0, 1, 0, '2018-07-04 22:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (415, 44, 'Duty Roster', 'duty_roster', 1, 0, 0, 0, '2018-07-04 22:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (416, 44, 'Shift', 'roster_shift', 1, 1, 1, 1, '2024-08-08 09:03:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (417, 44, 'Roster List', 'roster_list', 1, 1, 1, 1, '2018-07-04 22:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (418, 44, 'Roster Assign', 'roster_assign', 1, 1, 1, 1, '2018-07-04 22:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (419, 45, 'Annual Calendar', 'annual_calendar', 1, 1, 1, 1, '2018-07-04 22:08:35');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_short_code` (`short_code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (3, 'Income', 'income', 1, 0, '15.00', '2021-10-22 00:07:50');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (4, 'Expense', 'expense', 1, 0, '16.00', '2021-10-22 00:07:55');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (8, 'Download Center', 'download_center', 1, 0, '19.00', '2021-10-22 00:13:38');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (10, 'Inventory', 'inventory', 1, 0, '18.00', '2021-10-22 00:13:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (13, 'Messaging', 'communicate', 1, 0, '17.00', '2021-10-22 00:13:08');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (14, 'Reports', 'reports', 1, 1, '23.00', '2021-10-22 00:14:35');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (15, 'System Settings', 'system_settings', 1, 1, '24.00', '2021-10-22 00:16:02');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (16, 'Front CMS', 'front_cms', 1, 0, '21.00', '2021-10-22 00:14:07');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (17, 'Front Office', 'front_office', 1, 0, '10.00', '2021-10-22 00:05:56');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (18, 'Human Resource', 'human_resource', 1, 1, '12.00', '2021-10-22 00:06:27');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '28.00', '2021-10-22 00:22:27');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '0.01', '2021-10-22 00:18:00');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (23, 'OPD', 'opd', 1, 0, '3.00', '2021-10-22 00:04:29');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (24, 'IPD', 'ipd', 1, 0, '4.00', '2021-10-22 00:04:38');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (25, 'Pharmacy', 'pharmacy', 1, 0, '5.00', '2021-10-22 00:04:47');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (26, 'Pathology', 'pathology', 1, 0, '6.00', '2021-10-22 00:04:59');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (27, 'Radiology', 'radiology', 1, 0, '7.00', '2021-10-22 00:05:09');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (29, 'Ambulance', 'ambulance', 1, 0, '9.00', '2021-10-22 00:05:31');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (30, 'Blood Bank', 'blood_bank', 1, 0, '8.00', '2021-10-22 00:05:21');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (31, 'TPA Management', 'tpa_management', 1, 0, '14.00', '2021-10-22 00:06:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (32, 'Hospital Charges', 'hospital_charges', 1, 1, '26.00', '2021-10-22 00:19:04');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (34, 'Birth Death Record', 'birth_death_report', 1, 0, '11.00', '2021-10-22 00:06:10');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (36, 'Patient', 'patient', 1, 0, '25.00', '2021-10-22 00:18:46');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (37, 'Live Consultation', 'live_consultation', 1, 0, '22.00', '2021-10-22 00:14:21');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (38, 'Referral', 'referral', 1, 0, '13.00', '2021-10-22 00:06:48');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (39, 'Appointment', 'appointment', 1, 0, '2.00', '2021-10-22 00:04:15');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (41, 'Billing', 'bill', 1, 0, '1.00', '2024-08-21 09:29:55');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (42, 'Certificate', 'certificate', 1, 0, '20.00', '2021-10-04 03:36:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (43, 'Chat', 'chat', 1, 0, '27.00', '2021-10-22 00:22:19');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (44, 'Duty Roster', 'duty_roster', 1, 0, '12.10', '2024-08-09 10:37:56');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (45, 'Annual Calendar', 'annual_calendar', 1, 0, '12.20', '2024-08-17 06:32:13');


#
# TABLE STRUCTURE FOR: permission_patient
#

DROP TABLE IF EXISTS `permission_patient`;

CREATE TABLE `permission_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_group_short_code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `system` int(11) NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_permission_group_short_code` (`permission_group_short_code`),
  KEY `index_name` (`name`),
  KEY `index_short_code` (`short_code`),
  KEY `index_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (1, 'appointment', 'My Appointments', 'my_appointments', 1, 0, '1.00', '2021-09-27 13:17:05');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (2, 'opd', 'OPD', 'opd', 1, 0, '2.00', '2021-09-27 13:17:21');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (3, 'ipd', 'IPD', 'ipd', 1, 0, '3.00', '2021-09-25 09:33:07');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (4, 'pharmacy', 'Pharmacy', 'pharmacy', 1, 0, '4.00', '2021-09-25 06:03:29');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (5, 'pathology', 'Pathology', 'pathology', 1, 0, '5.00', '2021-09-27 13:15:45');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (6, 'radiology', 'Radiology', 'radiology', 1, 0, '6.00', '2021-09-27 13:15:47');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (7, 'ambulance', 'Ambulance', 'ambulance', 1, 0, '7.00', '2021-09-27 13:15:50');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (8, 'blood_bank', 'Blood Bank', 'blood_bank', 1, 0, '8.00', '2021-09-24 07:40:59');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (9, 'live_consultation', 'Live Consultation', 'live_consultation', 1, 0, '9.00', '2021-09-27 13:16:49');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (10, 'calendar_to_do_list', 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '11.00', '2021-10-04 09:07:25');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (11, 'chat', 'Chat', 'chat', 1, 0, '11.00', '2021-10-04 07:34:59');
INSERT INTO `permission_patient` (`id`, `permission_group_short_code`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (12, 'download_center', 'Download Center', 'download_center', 1, 0, '12.00', '2024-06-26 12:29:50');


#
# TABLE STRUCTURE FOR: pharmacy
#

DROP TABLE IF EXISTS `pharmacy`;

CREATE TABLE `pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(200) DEFAULT NULL,
  `medicine_category_id` int(11) DEFAULT NULL,
  `medicine_image` text NOT NULL,
  `medicine_company` varchar(100) DEFAULT NULL,
  `medicine_composition` varchar(100) DEFAULT NULL,
  `medicine_group` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `min_level` varchar(50) DEFAULT NULL,
  `reorder_level` varchar(50) DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `unit_packing` varchar(50) DEFAULT NULL,
  `vat_ac` varchar(50) DEFAULT NULL,
  `rack_number` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `medicine_category_id` (`medicine_category_id`),
  KEY `idx_medicine_name` (`medicine_name`),
  KEY `index_medicine_name` (`medicine_name`),
  KEY `index_medicine_company` (`medicine_company`),
  KEY `index_medicine_composition` (`medicine_composition`),
  KEY `index_medicine_group` (`medicine_group`),
  KEY `index_unit` (`unit`),
  KEY `index_min_level` (`min_level`),
  KEY `index_reorder_level` (`reorder_level`),
  KEY `index_vat` (`vat`),
  KEY `index_unit_packing` (`unit_packing`),
  KEY `index_vat_ac` (`vat_ac`),
  KEY `index_rack_number` (`rack_number`),
  CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`medicine_category_id`) REFERENCES `medicine_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (1, 'Paracetamol 500mg', 2, '', '1', 'Paracetamol IP 500 mg', '6', '1', '20', '50', '5', '10 Tablets per strip', '', '', '', '', '2025-07-01 13:36:27');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (2, 'Azithromycin 250mg', 1, '', '2', 'Azithromycin Dihydrate equivalent to Azithromycin 250mg', '1', '1', '10', '30', '12', '6 Tablets per strip', '', '', '', '', '2025-07-01 13:39:25');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (3, 'Cetirizine 10mg', 6, '', '1', 'Cetirizine Hydrochloride IP 10mg', '10', '1', '10', '30', '5', '10 Tablets per strip', '', '', '', '', '2025-07-01 13:41:53');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (4, 'Metformin 500mg', 7, '', '3', 'Metformin Hydrochloride IP 500mg', '8', '1', '20', '40', '5', '15 Tablets per strip', '', '', '', '', '2025-07-01 13:48:22');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (5, 'Foracort Inhaler 200', 8, '', '1', 'Budesonide 200mcg + Formoterol Fumarate 6mcg', '9', '29', '5', '10', '12', '1 Inhaler', '', '', '', '', '2025-07-01 13:53:21');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (6, 'Betadine Solution', 5, '', '7', 'Povidone Iodine Solution 10%', '7', '32', '10', '25', '5', '	100 ml bottle', '', '', '', '', '2025-07-02 07:04:19');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `vat_ac`, `rack_number`, `note`, `is_active`, `created_at`) VALUES (7, 'Calpol 650', 3, '', '6', 'Paracetamol IP 650 mg', '6', '1', '25', '60', '5', '15', '', '', '', '', '2025-07-02 07:07:33');


#
# TABLE STRUCTURE FOR: pharmacy_bill_basic
#

DROP TABLE IF EXISTS `pharmacy_bill_basic`;

CREATE TABLE `pharmacy_bill_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `ipd_prescription_basic_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `total` float(10,2) DEFAULT 0.00,
  `discount_percentage` float(10,2) DEFAULT 0.00,
  `discount` float(10,2) DEFAULT 0.00,
  `tax_percentage` float(10,2) DEFAULT 0.00,
  `tax` float(10,2) DEFAULT 0.00,
  `net_amount` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `generated_by` (`generated_by`),
  KEY `ipd_prescription_basic_id` (`ipd_prescription_basic_id`),
  KEY `index_customer_name` (`customer_name`),
  KEY `index_customer_type` (`customer_type`),
  KEY `index_doctor_name` (`doctor_name`),
  KEY `index_total` (`total`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_discount` (`discount`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_tax` (`tax`),
  KEY `index_net_amount` (`net_amount`),
  CONSTRAINT `pharmacy_bill_basic_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pharmacy_bill_basic_ibfk_2` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pharmacy_bill_basic_ibfk_3` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pharmacy_bill_basic_ibfk_4` FOREIGN KEY (`ipd_prescription_basic_id`) REFERENCES `ipd_prescription_basic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pharmacy_bill_basic` (`id`, `date`, `patient_id`, `ipd_prescription_basic_id`, `case_reference_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `total`, `discount_percentage`, `discount`, `tax_percentage`, `tax`, `net_amount`, `note`, `generated_by`, `created_at`) VALUES (1, '2025-07-02 15:00:00', 4, NULL, NULL, '', NULL, 'Amitabh Kulkarni (D007)', '', '22.00', '0.00', '0.00', NULL, '2.33', '24.32', '', 1, '2025-07-02 09:31:12');
INSERT INTO `pharmacy_bill_basic` (`id`, `date`, `patient_id`, `ipd_prescription_basic_id`, `case_reference_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `total`, `discount_percentage`, `discount`, `tax_percentage`, `tax`, `net_amount`, `note`, `generated_by`, `created_at`) VALUES (2, '2025-07-02 15:05:00', 6, NULL, NULL, '', NULL, 'Amitabh Kulkarni (D007)', '', '25.05', '0.00', '0.00', NULL, '2.72', '27.77', '', 1, '2025-07-02 09:37:01');


#
# TABLE STRUCTURE FOR: pharmacy_bill_detail
#

DROP TABLE IF EXISTS `pharmacy_bill_detail`;

CREATE TABLE `pharmacy_bill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_bill_basic_id` int(11) DEFAULT NULL,
  `medicine_batch_detail_id` int(11) DEFAULT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` float(10,2) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pharmacy_bill_basic_id` (`pharmacy_bill_basic_id`),
  KEY `medicine_batch_detail_id` (`medicine_batch_detail_id`),
  KEY `index_quantity` (`quantity`),
  KEY `index_sale_price` (`sale_price`),
  KEY `index_amount` (`amount`),
  CONSTRAINT `pharmacy_bill_detail_ibfk_1` FOREIGN KEY (`pharmacy_bill_basic_id`) REFERENCES `pharmacy_bill_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pharmacy_bill_detail_ibfk_2` FOREIGN KEY (`medicine_batch_detail_id`) REFERENCES `medicine_batch_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_batch_detail_id`, `quantity`, `sale_price`, `amount`, `created_at`) VALUES (1, 1, 2, '10', '0.45', '0.00', '2025-07-02 09:31:12');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_batch_detail_id`, `quantity`, `sale_price`, `amount`, `created_at`) VALUES (2, 1, 1, '10', '1.75', '0.00', '2025-07-02 09:31:12');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_batch_detail_id`, `quantity`, `sale_price`, `amount`, `created_at`) VALUES (3, 2, 1, '12', '1.75', '0.00', '2025-07-02 09:37:01');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_batch_detail_id`, `quantity`, `sale_price`, `amount`, `created_at`) VALUES (4, 2, 2, '9', '0.45', '0.00', '2025-07-02 09:37:01');


#
# TABLE STRUCTURE FOR: pharmacy_company
#

DROP TABLE IF EXISTS `pharmacy_company`;

CREATE TABLE `pharmacy_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_company_name` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (1, 'Cipla', '2025-07-01 13:29:51');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (2, 'Sun Pharma', '2025-07-01 13:30:09');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (3, 'Abbott', '2025-07-01 13:30:47');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (4, 'Mankind', '2025-07-01 13:30:47');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (5, 'Dr. Reddy\'s', '2025-07-01 13:30:47');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (6, 'GSK', '2025-07-02 07:01:48');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (7, 'Win-Medicare', '2025-07-02 07:01:48');
INSERT INTO `pharmacy_company` (`id`, `company_name`, `created_at`) VALUES (8, 'Zydus Cadila', '2025-07-02 07:01:48');


#
# TABLE STRUCTURE FOR: postnatal_examine
#

DROP TABLE IF EXISTS `postnatal_examine`;

CREATE TABLE `postnatal_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `labor_time` datetime NOT NULL,
  `delivery_time` datetime NOT NULL,
  `routine_question` text NOT NULL,
  `general_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `index_labor_time` (`labor_time`),
  KEY `index_delivery_time` (`delivery_time`),
  CONSTRAINT `postnatal_examine_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: prefixes
#

DROP TABLE IF EXISTS `prefixes`;

CREATE TABLE `prefixes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_type` (`type`),
  KEY `index_prefix` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (1, 'ipd_no', 'IPDN', '2021-06-30 17:40:23');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (2, 'opd_no', 'OPDN', '2021-02-22 13:38:01');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (3, 'ipd_prescription', 'IPDP', '2021-02-12 18:42:07');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (4, 'opd_prescription', 'OPDP', '2021-02-12 18:42:17');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (5, 'appointment', 'APPN', '2021-10-22 05:37:43');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (6, 'pharmacy_billing', 'PHAB', '2021-10-22 05:37:43');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (7, 'operation_theater_reference_no', 'OTRN', '2021-10-22 05:37:43');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (8, 'blood_bank_billing', 'BLBB', '2021-10-22 05:40:38');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (9, 'ambulance_call_billing', 'AMCB', '2021-10-22 05:40:38');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (10, 'radiology_billing', 'RADB', '2021-10-22 05:40:38');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (11, 'pathology_billing', 'PATB', '2021-10-22 05:40:38');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (12, 'checkup_id', 'OCID', '2021-10-22 05:44:25');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (13, 'purchase_no', 'PHPN', '2021-10-22 05:44:25');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (14, 'transaction_id', 'TRID', '2021-10-22 05:44:25');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (15, 'birth_record_reference_no', 'BRRN', '2021-10-22 05:44:25');
INSERT INTO `prefixes` (`id`, `type`, `prefix`, `created_at`) VALUES (16, 'death_record_reference_no', 'DRRN', '2021-10-22 05:44:25');


#
# TABLE STRUCTURE FOR: primary_examine
#

DROP TABLE IF EXISTS `primary_examine`;

CREATE TABLE `primary_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipdid` int(11) DEFAULT NULL,
  `visit_details_id` int(11) DEFAULT NULL,
  `bleeding` varchar(250) DEFAULT NULL,
  `headache` varchar(250) DEFAULT NULL,
  `pain` varchar(250) DEFAULT NULL,
  `constipation` varchar(250) DEFAULT NULL,
  `urinary_symptoms` varchar(250) NOT NULL,
  `vomiting` varchar(250) DEFAULT NULL,
  `cough` varchar(250) DEFAULT NULL,
  `vaginal` varchar(250) DEFAULT NULL,
  `discharge` varchar(250) DEFAULT NULL,
  `oedema` varchar(250) DEFAULT NULL,
  `haemoroids` varchar(250) DEFAULT NULL,
  `weight` varchar(250) NOT NULL,
  `height` varchar(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `general_condition` text NOT NULL,
  `finding_remark` varchar(250) NOT NULL,
  `pelvic_examination` text NOT NULL,
  `sp` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_details_id` (`visit_details_id`),
  KEY `ipdid` (`ipdid`),
  KEY `index_bleeding` (`bleeding`),
  KEY `index_headache` (`headache`),
  KEY `index_pain` (`pain`),
  KEY `index_constipation` (`constipation`),
  KEY `index_urinary_symptoms` (`urinary_symptoms`),
  KEY `index_vomiting` (`vomiting`),
  KEY `index_cough` (`cough`),
  KEY `index_vaginal` (`vaginal`),
  KEY `index_discharge` (`discharge`),
  KEY `index_oedema` (`oedema`),
  KEY `index_haemoroids` (`haemoroids`),
  KEY `index_weight` (`weight`),
  KEY `index_height` (`height`),
  KEY `index_date` (`date`),
  CONSTRAINT `primary_examine_ibfk_1` FOREIGN KEY (`visit_details_id`) REFERENCES `visit_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `primary_examine_ibfk_2` FOREIGN KEY (`ipdid`) REFERENCES `ipd_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: print_setting
#

DROP TABLE IF EXISTS `print_setting`;

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_header` text NOT NULL,
  `print_footer` text NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (1, 'uploads/printing/1.jpg', '', 'opdpre', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (2, 'uploads/printing/2.jpg', '', 'opd', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (3, 'uploads/printing/3.jpg', '', 'ipdpres', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (4, 'uploads/printing/4.jpg', '', 'ipd', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (5, 'uploads/printing/5.jpg', '', 'bill', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (6, 'uploads/printing/6.jpg', '', 'pharmacy', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (7, 'uploads/printing/7.jpg', '', 'payslip', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (8, 'uploads/printing/8.jpg', '', 'paymentreceipt', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (9, 'uploads/printing/9.jpg', '', 'birth', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (10, 'uploads/printing/10.jpg', '', 'death', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (11, 'uploads/printing/11.jpg', '', 'pathology', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (12, 'uploads/printing/12.jpg', '', 'radiology', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (13, 'uploads/printing/13.jpg', '', 'ot', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (14, 'uploads/printing/14.jpg', '', 'bloodbank', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (15, 'uploads/printing/15.jpg', '', 'ambulance', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (16, 'uploads/printing/16.jpg', '', 'discharge_card', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (17, 'uploads/printing/17.jpg', '', 'obstetric_history', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (18, 'uploads/printing/18.jpg', '', 'opd_antenatal_finding', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (19, 'uploads/printing/19.jpg', '', 'ipd_antenatal_finding', 'yes', '2021-09-25 06:44:20');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`, `created_at`) VALUES (20, 'uploads/printing/20.jpg', '', 'appointment', 'yes', '2021-09-25 06:44:20');


#
# TABLE STRUCTURE FOR: radio
#

DROP TABLE IF EXISTS `radio`;

CREATE TABLE `radio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` int(11) DEFAULT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `charge_id` (`charge_id`),
  KEY `index_test_name` (`test_name`),
  KEY `index_short_name` (`short_name`),
  KEY `index_test_type` (`test_type`),
  CONSTRAINT `radio_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES (1, 'Abdominal Ultrasound', 'Abdominal USG', '', 2, '', '0', 3, '2025-07-02 07:10:47');
INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES (2, 'Abdominal Ultrasound', 'Abdominal Ultrasound', '', 2, '', '0', 3, '2025-07-02 07:11:12');


#
# TABLE STRUCTURE FOR: radiology_billing
#

DROP TABLE IF EXISTS `radiology_billing`;

CREATE TABLE `radiology_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `ipd_prescription_basic_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `total` float(10,2) NOT NULL,
  `discount_percentage` float(10,2) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `tax_percentage` float(10,2) NOT NULL,
  `tax` float(10,2) NOT NULL,
  `net_amount` float(10,2) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `insurance_validity` date DEFAULT NULL,
  `insurance_id` varchar(250) DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `generated_by` (`generated_by`),
  KEY `ipd_prescription_basic_id` (`ipd_prescription_basic_id`),
  KEY `index_date` (`date`),
  KEY `index_doctor_name` (`doctor_name`),
  KEY `index_total` (`total`),
  KEY `index_discount_percentage` (`discount_percentage`),
  KEY `index_discount` (`discount`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_tax` (`tax`),
  KEY `index_net_amount` (`net_amount`),
  KEY `index_transaction_id` (`transaction_id`),
  KEY `index_organisation_id` (`organisation_id`),
  KEY `index_insurance_validity` (`insurance_validity`),
  KEY `index_insurance_id` (`insurance_id`),
  CONSTRAINT `radiology_billing_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_billing_ibfk_2` FOREIGN KEY (`case_reference_id`) REFERENCES `case_references` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_billing_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_billing_ibfk_4` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_billing_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `radiology_billing_ibfk_6` FOREIGN KEY (`ipd_prescription_basic_id`) REFERENCES `ipd_prescription_basic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_billing_ibfk_7` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: radiology_parameter
#

DROP TABLE IF EXISTS `radiology_parameter`;

CREATE TABLE `radiology_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(100) NOT NULL,
  `test_value` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `range_from` varchar(500) DEFAULT NULL,
  `range_to` varchar(500) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_parameter_name` (`parameter_name`),
  KEY `index_test_value` (`test_value`),
  KEY `index_reference_range` (`reference_range`),
  KEY `index_range_from` (`range_from`),
  KEY `index_range_to` (`range_to`),
  KEY `index_gender` (`gender`),
  KEY `index_unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `radiology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (1, 'Liver Size', '', '13-15', '13', '15', '', '24', '', '2025-07-02 06:16:48');
INSERT INTO `radiology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (2, 'Kidneys Length (adult)', '', '9-12', '9', '12', '', '24', '', '2025-07-02 06:31:07');
INSERT INTO `radiology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (3, 'Prostate (in males) Size', '', '20-30', '20', '30', '', '24', '', '2025-07-02 06:32:00');
INSERT INTO `radiology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `range_from`, `range_to`, `gender`, `unit`, `description`, `created_at`) VALUES (4, 'Uterus (in females)', '', '7-9', '7', '9', '', '24', '', '2025-07-02 06:32:18');


#
# TABLE STRUCTURE FOR: radiology_parameterdetails
#

DROP TABLE IF EXISTS `radiology_parameterdetails`;

CREATE TABLE `radiology_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_id` int(11) DEFAULT NULL,
  `radiology_parameter_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `radiology_id` (`radiology_id`),
  KEY `radiology_parameter_id` (`radiology_parameter_id`),
  CONSTRAINT `radiology_parameterdetails_ibfk_1` FOREIGN KEY (`radiology_id`) REFERENCES `radio` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_parameterdetails_ibfk_2` FOREIGN KEY (`radiology_parameter_id`) REFERENCES `radiology_parameter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `radiology_parameterdetails` (`id`, `radiology_id`, `radiology_parameter_id`, `created_at`) VALUES (1, 1, 1, '2025-07-02 07:10:47');
INSERT INTO `radiology_parameterdetails` (`id`, `radiology_id`, `radiology_parameter_id`, `created_at`) VALUES (2, 1, 2, '2025-07-02 07:10:47');
INSERT INTO `radiology_parameterdetails` (`id`, `radiology_id`, `radiology_parameter_id`, `created_at`) VALUES (3, 1, 3, '2025-07-02 07:10:47');
INSERT INTO `radiology_parameterdetails` (`id`, `radiology_id`, `radiology_parameter_id`, `created_at`) VALUES (4, 2, 4, '2025-07-02 07:11:12');


#
# TABLE STRUCTURE FOR: radiology_report
#

DROP TABLE IF EXISTS `radiology_report`;

CREATE TABLE `radiology_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_bill_id` int(11) DEFAULT NULL,
  `radiology_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `parameter_update` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `radiology_report` text DEFAULT NULL,
  `report_name` text DEFAULT NULL,
  `radiology_result` text DEFAULT NULL COMMENT 'test result',
  `tax_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `apply_charge` float(10,2) NOT NULL DEFAULT 0.00,
  `radiology_center` varchar(250) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `collection_specialist` int(11) DEFAULT NULL,
  `collection_date` date DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `radiology_id` (`radiology_id`),
  KEY `radiology_bill_id` (`radiology_bill_id`),
  KEY `patient_id` (`patient_id`),
  KEY `generated_by` (`generated_by`),
  KEY `collection_specialist` (`collection_specialist`),
  KEY `approved_by` (`approved_by`),
  KEY `index_customer_type` (`customer_type`),
  KEY `index_patient_name` (`patient_name`),
  KEY `index_consultant_doctor` (`consultant_doctor`),
  KEY `index_reporting_date` (`reporting_date`),
  KEY `index_parameter_update` (`parameter_update`),
  KEY `index_tax_percentage` (`tax_percentage`),
  KEY `index_apply_charge` (`apply_charge`),
  KEY `index_radiology_center` (`radiology_center`),
  CONSTRAINT `radiology_report_ibfk_1` FOREIGN KEY (`radiology_id`) REFERENCES `radio` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_ibfk_2` FOREIGN KEY (`radiology_bill_id`) REFERENCES `radiology_billing` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_ibfk_4` FOREIGN KEY (`generated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_ibfk_5` FOREIGN KEY (`collection_specialist`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_ibfk_6` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: radiology_report_parameterdetails
#

DROP TABLE IF EXISTS `radiology_report_parameterdetails`;

CREATE TABLE `radiology_report_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_report_id` int(11) DEFAULT NULL,
  `radiology_parameterdetail_id` int(11) DEFAULT NULL,
  `radiology_report_value` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `radiology_report_id` (`radiology_report_id`),
  KEY `radiology_parameterdetail_id` (`radiology_parameterdetail_id`),
  CONSTRAINT `radiology_report_parameterdetails_ibfk_1` FOREIGN KEY (`radiology_report_id`) REFERENCES `radiology_report` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiology_report_parameterdetails_ibfk_2` FOREIGN KEY (`radiology_parameterdetail_id`) REFERENCES `radiology_parameterdetails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `read_notification_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: read_systemnotification
#

DROP TABLE IF EXISTS `read_systemnotification`;

CREATE TABLE `read_systemnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `read_systemnotification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `system_notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (1, 1, 1, 'no', '2025-07-01 13:58:31');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (2, 1, 1, 'no', '2025-07-01 13:58:33');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (3, 4, 1, 'no', '2025-07-02 05:46:25');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (4, 4, 1, 'no', '2025-07-02 05:46:29');


#
# TABLE STRUCTURE FOR: referral_category
#

DROP TABLE IF EXISTS `referral_category`;

CREATE TABLE `referral_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: referral_commission
#

DROP TABLE IF EXISTS `referral_commission`;

CREATE TABLE `referral_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_category_id` int(11) DEFAULT NULL,
  `referral_type_id` int(11) DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `referral_category_id` (`referral_category_id`),
  KEY `referral_type_id` (`referral_type_id`),
  CONSTRAINT `referral_commission_ibfk_1` FOREIGN KEY (`referral_category_id`) REFERENCES `referral_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referral_commission_ibfk_2` FOREIGN KEY (`referral_type_id`) REFERENCES `referral_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: referral_payment
#

DROP TABLE IF EXISTS `referral_payment`;

CREATE TABLE `referral_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_person_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `referral_type` int(11) DEFAULT NULL,
  `billing_id` int(11) NOT NULL,
  `bill_amount` float(10,2) DEFAULT 0.00,
  `percentage` float(10,2) DEFAULT 0.00,
  `amount` float(10,2) DEFAULT 0.00,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `referral_person_id` (`referral_person_id`),
  KEY `referral_type` (`referral_type`),
  KEY `index_bill_amount` (`bill_amount`),
  KEY `index_percentage` (`percentage`),
  KEY `index_amount` (`amount`),
  KEY `index_date` (`date`),
  CONSTRAINT `referral_payment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referral_payment_ibfk_2` FOREIGN KEY (`referral_person_id`) REFERENCES `referral_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referral_payment_ibfk_3` FOREIGN KEY (`referral_type`) REFERENCES `referral_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: referral_person
#

DROP TABLE IF EXISTS `referral_person`;

CREATE TABLE `referral_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `person_name` varchar(100) DEFAULT NULL,
  `person_phone` varchar(50) DEFAULT NULL,
  `standard_commission` float(10,2) NOT NULL DEFAULT 0.00,
  `address` varchar(100) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `referral_category` (`category_id`),
  KEY `index_name` (`name`),
  KEY `index_contact` (`contact`),
  KEY `index_person_name` (`person_name`),
  KEY `index_person_phone` (`person_phone`),
  KEY `index_standard_commission` (`standard_commission`),
  CONSTRAINT `referral_person_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `referral_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: referral_person_commission
#

DROP TABLE IF EXISTS `referral_person_commission`;

CREATE TABLE `referral_person_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_person_id` int(11) DEFAULT NULL,
  `referral_type_id` int(11) DEFAULT NULL,
  `commission` float(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `referral_person_id` (`referral_person_id`),
  KEY `referral_type_id` (`referral_type_id`),
  CONSTRAINT `referral_person_commission_ibfk_1` FOREIGN KEY (`referral_person_id`) REFERENCES `referral_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referral_person_commission_ibfk_2` FOREIGN KEY (`referral_type_id`) REFERENCES `referral_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: referral_type
#

DROP TABLE IF EXISTS `referral_type`;

CREATE TABLE `referral_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `prefixes_type` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_name` (`name`),
  KEY `index_prefixes_type` (`prefixes_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (1, 'opd', 'opd_no', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (2, 'ipd', 'ipd_no', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (3, 'pharmacy', 'pharmacy_billing', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (4, 'pathology', 'pathology_billing', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (5, 'radiology', 'radiology_billing', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (6, 'blood_bank', 'blood_bank_billing', 1, '2021-09-17 02:07:51');
INSERT INTO `referral_type` (`id`, `name`, `prefixes_type`, `is_active`, `created_at`) VALUES (7, 'ambulance', 'ambulance_call_billing', 1, '2021-09-17 02:07:51');


#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (1, 'Admin', NULL, 0, 1, 0, '2018-12-25 06:19:43');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (2, 'Accountant', NULL, 0, 1, 0, '2018-12-25 06:19:38');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (3, 'Doctor', NULL, 0, 1, 0, '2018-07-21 05:07:36');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (4, 'Pharmacist', NULL, 0, 1, 0, '2018-07-21 05:08:26');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (5, 'Pathologist', NULL, 0, 1, 0, '2018-12-25 06:19:59');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (6, 'Radiologist', NULL, 0, 1, 0, '2018-12-25 06:20:27');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (7, 'Super Admin', NULL, 0, 1, 1, '2018-12-25 06:22:24');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (8, 'Receptionist', NULL, 0, 1, 0, '2018-12-25 06:20:22');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (9, 'Nurse', NULL, 0, 1, 0, '2020-12-23 01:58:58');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (10, 'Clinical staff', NULL, 0, 0, 0, '2025-07-02 09:39:16');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_can_view` (`can_view`),
  KEY `index_can_add` (`can_add`),
  KEY `index_can_edit` (`can_edit`),
  KEY `index_can_delete` (`can_delete`),
  KEY `role_id` (`role_id`),
  KEY `perm_cat_id` (`perm_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2336 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1, 1, 346, 1, 0, 0, 0, '2021-09-15 02:19:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1, 80, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (3, 1, 81, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (4, 1, 82, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (5, 1, 83, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (6, 1, 84, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (7, 1, 85, 1, 1, 1, 1, '2021-09-15 02:31:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (8, 1, 204, 1, 1, 1, 1, '2021-09-15 02:22:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (9, 1, 205, 1, 0, 0, 0, '2021-09-15 02:20:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (10, 1, 216, 1, 0, 0, 0, '2021-09-15 02:20:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (11, 1, 217, 1, 0, 0, 0, '2021-09-15 02:20:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (14, 1, 237, 1, 0, 0, 0, '2021-09-15 02:25:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (15, 1, 239, 1, 0, 0, 0, '2021-09-15 02:25:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (16, 1, 214, 1, 1, 1, 1, '2021-09-15 02:35:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (17, 1, 215, 1, 1, 1, 1, '2021-09-15 02:35:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (18, 1, 240, 1, 0, 1, 0, '2021-09-15 02:35:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (19, 1, 242, 1, 0, 1, 0, '2021-09-15 02:35:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (36, 1, 48, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (37, 1, 89, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (38, 1, 91, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (39, 1, 178, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (40, 1, 179, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (41, 1, 180, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (42, 1, 181, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (43, 1, 182, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (44, 1, 183, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (45, 1, 184, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (46, 1, 185, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (47, 1, 187, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (48, 1, 188, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (49, 1, 189, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (50, 1, 206, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (51, 1, 207, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (52, 1, 208, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (53, 1, 209, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (54, 1, 210, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (55, 1, 211, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (56, 1, 212, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (57, 1, 213, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (58, 1, 250, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (59, 1, 251, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (60, 1, 253, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (61, 1, 254, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (62, 1, 255, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (63, 1, 256, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (64, 1, 258, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (65, 1, 259, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (66, 1, 265, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (67, 1, 266, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (68, 1, 271, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (69, 1, 272, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (70, 1, 349, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (71, 1, 350, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (72, 1, 351, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (73, 1, 352, 1, 0, 0, 0, '2021-09-15 18:37:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (78, 1, 12, 1, 1, 1, 1, '2021-09-17 21:55:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (79, 1, 13, 1, 1, 1, 1, '2021-09-17 21:55:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (81, 1, 134, 1, 1, 1, 1, '2021-10-07 04:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (84, 1, 192, 1, 0, 1, 0, '2021-10-07 04:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (105, 1, 140, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (106, 1, 142, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (114, 1, 300, 1, 1, 1, 1, '2021-09-16 22:16:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (117, 1, 309, 1, 0, 1, 0, '2021-09-16 22:16:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (119, 1, 322, 1, 1, 1, 1, '2021-09-16 22:16:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (125, 1, 170, 1, 1, 1, 1, '2021-09-17 19:38:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (127, 1, 201, 1, 0, 1, 0, '2021-09-15 23:45:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (131, 1, 227, 1, 1, 1, 1, '2021-09-17 19:10:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (132, 1, 291, 1, 1, 1, 1, '2021-09-17 19:10:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (133, 1, 292, 1, 1, 1, 1, '2021-09-17 19:10:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (142, 1, 317, 1, 1, 0, 1, '2021-09-15 20:15:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (143, 1, 269, 1, 1, 0, 1, '2021-09-15 20:16:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (144, 1, 270, 1, 1, 0, 1, '2021-09-15 20:16:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (149, 1, 54, 1, 0, 1, 0, '2021-10-07 00:37:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (150, 1, 56, 1, 0, 1, 0, '2021-10-07 00:37:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (151, 1, 57, 1, 0, 1, 0, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (152, 1, 58, 1, 0, 1, 0, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (153, 1, 59, 1, 0, 1, 0, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (154, 1, 60, 1, 0, 1, 0, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (155, 1, 126, 1, 0, 0, 0, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (156, 1, 130, 1, 1, 0, 1, '2021-09-15 20:53:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (157, 1, 131, 1, 0, 0, 0, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (158, 1, 267, 1, 1, 1, 1, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (159, 1, 274, 1, 0, 0, 0, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (160, 1, 279, 1, 1, 1, 1, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (161, 1, 287, 1, 0, 1, 0, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (162, 1, 288, 1, 0, 1, 0, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (163, 1, 348, 1, 0, 1, 0, '2021-09-15 20:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (164, 1, 61, 1, 1, 0, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (165, 1, 62, 1, 1, 0, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (166, 1, 63, 1, 1, 0, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (167, 1, 64, 1, 1, 1, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (168, 1, 65, 1, 1, 1, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (169, 1, 66, 1, 1, 1, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (170, 1, 67, 1, 1, 1, 1, '2021-10-07 04:57:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (171, 1, 43, 1, 1, 1, 1, '2021-09-15 21:54:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (172, 1, 44, 1, 0, 0, 0, '2021-09-15 21:53:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (175, 1, 283, 1, 1, 1, 1, '2021-09-17 22:22:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (176, 1, 284, 1, 1, 1, 1, '2021-09-17 22:22:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (177, 1, 285, 1, 1, 1, 1, '2021-09-17 22:22:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (178, 1, 286, 1, 1, 1, 1, '2021-09-17 22:22:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (181, 1, 146, 1, 1, 1, 1, '2021-09-17 02:03:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (182, 1, 148, 1, 1, 1, 1, '2021-09-17 02:03:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (184, 1, 86, 1, 1, 1, 1, '2021-09-17 23:02:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (192, 1, 127, 1, 0, 0, 0, '2021-09-16 00:46:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (193, 1, 118, 1, 0, 0, 0, '2021-09-16 00:59:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (194, 1, 152, 1, 1, 1, 1, '2021-09-16 23:30:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (195, 1, 153, 1, 1, 1, 1, '2021-09-16 19:14:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (197, 1, 354, 1, 0, 1, 0, '2021-09-17 19:42:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (199, 1, 261, 1, 1, 1, 1, '2021-09-17 19:42:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (200, 1, 262, 1, 1, 1, 1, '2021-09-17 19:42:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (201, 1, 315, 1, 1, 0, 1, '2021-09-17 19:42:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (202, 1, 244, 1, 0, 1, 0, '2021-09-16 20:29:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (221, 1, 138, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (222, 1, 139, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (223, 1, 143, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (224, 1, 144, 1, 1, 0, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (226, 1, 197, 1, 0, 1, 0, '2021-09-17 02:01:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (228, 1, 248, 1, 0, 1, 0, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (229, 1, 301, 1, 0, 0, 0, '2021-09-16 22:16:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (230, 1, 308, 1, 0, 0, 0, '2021-09-16 22:16:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (236, 1, 149, 1, 1, 1, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (237, 1, 175, 1, 1, 1, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (238, 1, 243, 1, 0, 1, 0, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (239, 1, 257, 1, 1, 1, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (243, 1, 314, 1, 1, 0, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (245, 1, 310, 1, 0, 0, 0, '2021-09-16 22:29:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (247, 1, 355, 1, 0, 1, 0, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (248, 1, 260, 1, 1, 1, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (249, 1, 263, 1, 1, 1, 1, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (250, 1, 312, 1, 0, 1, 0, '2021-10-22 00:28:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (254, 1, 135, 1, 1, 1, 1, '2021-10-07 04:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (255, 1, 137, 1, 1, 1, 1, '2021-10-07 04:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (257, 1, 219, 1, 0, 0, 0, '2021-09-17 01:09:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (258, 1, 221, 1, 1, 1, 1, '2021-09-18 00:55:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (259, 1, 222, 1, 1, 0, 1, '2021-09-17 01:13:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (260, 1, 299, 1, 1, 1, 1, '2021-09-17 01:14:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (261, 1, 303, 1, 1, 1, 1, '2021-09-17 01:17:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (262, 1, 304, 1, 0, 0, 0, '2021-09-17 01:21:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (263, 1, 305, 1, 0, 1, 0, '2021-09-17 01:22:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (264, 1, 306, 1, 0, 0, 0, '2021-09-17 01:22:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (265, 1, 307, 1, 0, 0, 0, '2021-09-17 01:23:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (266, 1, 319, 1, 1, 1, 1, '2021-10-07 05:01:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (274, 1, 220, 1, 1, 1, 1, '2021-09-17 02:02:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (275, 1, 326, 1, 1, 1, 1, '2021-09-17 18:09:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (276, 1, 200, 1, 1, 0, 1, '2021-09-17 18:59:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (277, 1, 225, 1, 1, 1, 1, '2021-09-17 19:10:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (278, 1, 226, 1, 1, 1, 1, '2021-09-17 19:10:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (279, 1, 224, 1, 0, 0, 0, '2021-09-17 19:38:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (280, 1, 313, 1, 1, 0, 1, '2021-09-17 19:39:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (281, 1, 171, 1, 1, 1, 1, '2021-09-17 19:46:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (282, 1, 353, 1, 0, 1, 0, '2021-09-17 19:46:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (283, 1, 168, 1, 1, 1, 1, '2021-09-17 20:14:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (284, 1, 169, 1, 1, 1, 1, '2021-09-17 20:16:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (285, 1, 311, 1, 1, 1, 1, '2021-09-17 20:24:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (286, 1, 246, 1, 1, 1, 1, '2021-09-17 20:26:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (287, 1, 202, 1, 1, 0, 1, '2021-09-17 20:30:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (288, 1, 293, 1, 1, 1, 1, '2021-09-17 20:30:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (289, 1, 302, 1, 1, 0, 1, '2021-09-17 20:30:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (290, 1, 173, 1, 1, 1, 1, '2021-09-17 20:36:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (291, 1, 347, 1, 0, 1, 1, '2021-09-17 20:36:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (292, 1, 273, 1, 0, 1, 0, '2021-09-17 21:43:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (293, 1, 9, 1, 1, 1, 1, '2021-09-17 21:47:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (294, 1, 10, 1, 1, 1, 1, '2021-09-17 21:47:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (295, 1, 176, 1, 1, 1, 1, '2021-09-20 23:45:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (296, 1, 102, 1, 1, 1, 1, '2021-10-07 05:04:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (297, 1, 31, 1, 1, 0, 1, '2021-10-07 00:40:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (298, 1, 32, 1, 1, 1, 1, '2021-09-17 22:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (299, 1, 33, 1, 1, 1, 1, '2021-09-17 22:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (300, 1, 34, 1, 1, 1, 1, '2021-09-17 22:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (301, 1, 35, 1, 1, 1, 1, '2021-09-17 22:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (302, 1, 104, 1, 1, 1, 1, '2021-09-17 22:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (303, 1, 87, 1, 0, 0, 0, '2021-09-17 23:01:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (304, 1, 88, 1, 1, 1, 0, '2021-09-17 23:33:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (305, 1, 90, 1, 1, 0, 1, '2021-09-17 23:34:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (306, 1, 108, 1, 1, 1, 1, '2021-09-17 23:37:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (307, 1, 109, 1, 1, 0, 1, '2021-09-17 23:39:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (308, 1, 110, 1, 1, 1, 1, '2021-10-07 04:56:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (309, 1, 111, 1, 1, 1, 1, '2021-10-07 04:56:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (310, 1, 112, 1, 1, 1, 1, '2021-10-07 04:56:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (311, 1, 249, 1, 1, 1, 1, '2021-10-07 04:56:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (313, 1, 203, 1, 1, 1, 1, '2021-09-17 23:08:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (314, 1, 264, 1, 1, 0, 1, '2021-09-17 23:08:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (315, 1, 289, 1, 1, 1, 1, '2021-09-17 23:08:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (316, 1, 290, 1, 1, 1, 1, '2021-09-17 23:08:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (317, 1, 165, 1, 1, 1, 1, '2021-09-17 23:23:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (318, 1, 166, 1, 1, 1, 1, '2021-09-17 23:23:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (319, 1, 247, 1, 1, 1, 1, '2021-09-17 23:23:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (320, 1, 318, 1, 1, 0, 1, '2021-09-17 23:23:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (324, 2, 237, 1, 0, 0, 0, '2021-09-18 01:01:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (327, 2, 135, 1, 1, 1, 0, '2021-10-07 01:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (334, 2, 221, 1, 1, 1, 1, '2021-09-18 01:25:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (335, 2, 222, 1, 1, 0, 1, '2021-09-18 01:26:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (336, 2, 299, 1, 0, 0, 0, '2021-10-07 01:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (337, 2, 303, 1, 0, 0, 0, '2021-10-07 01:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (339, 2, 305, 1, 0, 1, 0, '2021-09-18 01:38:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (341, 2, 307, 1, 0, 0, 0, '2021-09-18 01:43:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (343, 2, 320, 1, 0, 0, 0, '2021-09-18 01:44:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (346, 2, 138, 1, 1, 1, 0, '2021-10-07 01:02:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (350, 2, 143, 1, 1, 1, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (351, 2, 144, 1, 1, 0, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (354, 2, 329, 1, 0, 0, 0, '2021-09-18 02:23:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (356, 2, 326, 1, 0, 0, 0, '2021-10-07 05:33:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (357, 3, 132, 1, 1, 1, 1, '2021-09-21 20:39:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (358, 3, 134, 1, 1, 1, 1, '2021-09-19 19:30:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (362, 3, 135, 1, 1, 1, 1, '2021-09-19 19:45:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (363, 3, 137, 1, 1, 1, 1, '2021-09-19 19:45:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (364, 3, 192, 1, 0, 1, 0, '2021-09-19 19:46:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (372, 1, 295, 1, 0, 1, 0, '2021-10-07 04:56:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (373, 3, 218, 1, 0, 0, 0, '2021-09-19 21:47:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (374, 3, 219, 1, 0, 0, 0, '2021-09-19 21:48:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (375, 3, 221, 1, 1, 1, 1, '2021-09-19 21:48:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (376, 3, 222, 1, 1, 0, 1, '2021-09-19 21:51:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (377, 3, 299, 1, 1, 1, 1, '2021-09-19 21:53:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (378, 3, 303, 1, 1, 1, 1, '2021-09-19 22:05:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (379, 2, 139, 1, 1, 1, 0, '2021-10-07 01:02:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (380, 3, 304, 1, 0, 0, 0, '2021-09-19 22:21:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (382, 3, 305, 1, 0, 1, 0, '2021-09-19 22:23:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (384, 2, 198, 1, 0, 0, 0, '2021-09-19 22:24:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (386, 2, 300, 1, 1, 1, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (387, 2, 301, 1, 0, 0, 0, '2021-09-19 22:24:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (388, 2, 308, 1, 0, 0, 0, '2021-09-19 22:24:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (389, 2, 309, 1, 0, 0, 0, '2021-09-19 22:24:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (391, 2, 323, 1, 1, 1, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (392, 2, 324, 1, 1, 1, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (393, 2, 325, 1, 1, 1, 1, '2021-09-19 23:54:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (394, 3, 306, 1, 0, 0, 0, '2021-09-19 22:24:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (395, 3, 307, 1, 0, 0, 0, '2021-09-19 22:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (396, 3, 319, 1, 1, 1, 1, '2021-09-19 22:27:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (397, 3, 320, 1, 0, 0, 0, '2021-09-19 22:38:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (398, 3, 321, 1, 0, 0, 0, '2021-09-19 22:46:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (399, 3, 138, 1, 1, 1, 1, '2021-09-19 22:47:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (400, 3, 139, 1, 1, 1, 1, '2021-09-19 22:50:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (401, 3, 140, 1, 1, 1, 1, '2021-09-19 22:51:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (402, 3, 142, 1, 1, 1, 1, '2021-09-19 22:51:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (403, 3, 143, 1, 1, 1, 1, '2021-09-19 22:51:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (404, 3, 144, 1, 1, 0, 1, '2021-09-19 22:52:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (405, 3, 196, 1, 1, 1, 1, '2021-09-19 22:56:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (406, 3, 197, 1, 0, 1, 0, '2021-09-19 22:57:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (407, 3, 198, 1, 0, 0, 0, '2021-09-19 22:57:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (408, 3, 220, 1, 1, 1, 1, '2021-09-19 22:57:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (409, 3, 248, 1, 0, 1, 0, '2021-09-19 22:58:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (410, 3, 300, 1, 1, 1, 1, '2021-09-19 22:58:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (411, 3, 301, 1, 0, 0, 0, '2021-09-19 22:59:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (412, 3, 308, 1, 0, 0, 0, '2021-09-19 22:59:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (413, 3, 309, 1, 0, 1, 0, '2021-09-19 23:00:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (414, 3, 310, 1, 0, 0, 0, '2021-09-19 23:00:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (415, 3, 322, 1, 1, 1, 1, '2021-09-19 23:01:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (416, 3, 323, 1, 1, 1, 1, '2021-09-19 23:02:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (417, 3, 324, 1, 1, 1, 1, '2021-09-19 23:02:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (418, 3, 325, 1, 1, 1, 1, '2021-09-19 23:02:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (419, 3, 326, 1, 1, 1, 1, '2021-09-19 23:03:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (420, 3, 327, 1, 0, 0, 0, '2021-09-19 23:10:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (421, 3, 329, 1, 0, 0, 0, '2021-09-19 23:10:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (422, 3, 146, 1, 0, 0, 0, '2021-09-21 21:58:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (424, 2, 327, 1, 0, 0, 0, '2021-09-19 23:14:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (425, 3, 236, 1, 1, 1, 1, '2021-10-07 02:00:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (433, 3, 226, 1, 0, 0, 0, '2021-09-20 19:02:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (435, 3, 291, 1, 0, 0, 0, '2021-09-20 19:02:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (436, 3, 292, 1, 0, 0, 0, '2021-09-20 19:02:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (438, 3, 149, 1, 0, 0, 0, '2021-10-07 01:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (444, 3, 312, 1, 0, 0, 0, '2021-10-07 01:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (447, 2, 149, 1, 0, 0, 0, '2021-10-07 01:17:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (453, 2, 312, 1, 0, 1, 0, '2021-09-20 00:04:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (454, 2, 314, 1, 1, 0, 1, '2021-09-22 19:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (455, 2, 355, 1, 0, 1, 0, '2021-09-20 00:04:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (456, 3, 152, 1, 0, 0, 0, '2021-10-07 01:50:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (463, 3, 353, 1, 0, 0, 0, '2021-10-07 01:50:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (465, 2, 152, 1, 0, 0, 0, '2021-10-07 01:21:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (466, 2, 153, 1, 0, 0, 0, '2021-10-07 01:22:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (472, 2, 353, 1, 0, 1, 0, '2021-09-20 00:34:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (474, 3, 168, 1, 0, 0, 0, '2021-10-07 01:56:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (475, 2, 146, 1, 0, 0, 0, '2021-10-07 01:12:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (476, 2, 148, 1, 0, 0, 0, '2021-10-07 01:12:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (478, 2, 200, 1, 0, 0, 0, '2021-10-07 01:14:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (481, 2, 225, 1, 0, 0, 0, '2021-10-07 01:14:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (484, 2, 291, 1, 1, 0, 0, '2021-10-07 05:33:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (485, 2, 292, 1, 1, 0, 0, '2021-10-07 05:33:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (486, 2, 313, 1, 1, 0, 0, '2021-10-07 05:33:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (495, 3, 270, 1, 1, 0, 1, '2021-09-20 01:25:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (496, 2, 168, 1, 0, 0, 0, '2021-10-07 01:24:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (498, 2, 202, 1, 0, 0, 0, '2021-10-07 01:24:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (500, 2, 293, 1, 0, 0, 0, '2021-10-07 01:25:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (501, 2, 302, 1, 0, 0, 0, '2021-10-07 01:25:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (502, 2, 311, 1, 0, 0, 0, '2021-10-07 01:25:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (503, 2, 317, 1, 1, 0, 1, '2021-09-21 02:02:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (504, 3, 102, 1, 1, 1, 1, '2021-09-20 01:26:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (506, 3, 118, 1, 0, 0, 0, '2021-09-20 01:29:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (519, 3, 173, 1, 0, 0, 0, '2021-10-07 01:56:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (520, 3, 347, 1, 0, 0, 0, '2021-10-07 01:56:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (527, 3, 176, 1, 0, 0, 0, '2021-10-07 02:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (530, 3, 289, 1, 0, 0, 0, '2021-10-07 02:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (531, 3, 290, 1, 0, 0, 0, '2021-10-07 02:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (533, 3, 330, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (534, 3, 331, 1, 0, 0, 0, '2021-10-07 05:42:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (535, 3, 332, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (536, 3, 333, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (537, 3, 334, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (538, 3, 335, 1, 0, 0, 0, '2021-10-07 02:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (539, 3, 336, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (540, 3, 337, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (541, 3, 338, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (542, 3, 339, 1, 0, 0, 0, '2021-10-07 02:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (543, 3, 340, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (544, 3, 341, 1, 0, 0, 0, '2021-09-21 02:32:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (545, 3, 342, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (546, 3, 343, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (547, 3, 344, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (548, 3, 345, 1, 0, 0, 0, '2021-09-20 01:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (550, 3, 166, 1, 0, 0, 0, '2021-09-21 01:50:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (565, 3, 204, 1, 1, 1, 1, '2021-09-20 18:43:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (566, 3, 205, 1, 0, 0, 0, '2021-09-20 02:08:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (567, 3, 216, 1, 0, 0, 0, '2021-09-20 02:08:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (568, 3, 217, 1, 0, 0, 0, '2021-09-20 02:08:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (573, 3, 214, 1, 1, 1, 1, '2021-09-20 02:18:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (574, 3, 215, 1, 1, 1, 1, '2021-09-20 02:18:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (577, 3, 294, 1, 1, 1, 1, '2021-10-07 05:43:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (578, 3, 295, 1, 0, 1, 0, '2021-09-20 23:39:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (579, 3, 296, 1, 1, 1, 1, '2021-09-20 23:39:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (580, 3, 297, 1, 0, 0, 0, '2021-10-07 05:43:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (581, 3, 298, 1, 0, 0, 0, '2021-10-07 05:43:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (584, 2, 165, 1, 0, 0, 0, '2021-10-07 05:35:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (585, 2, 166, 1, 0, 0, 0, '2021-10-07 01:35:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (594, 2, 204, 1, 1, 1, 1, '2021-09-20 18:35:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (596, 2, 216, 1, 0, 0, 0, '2021-09-20 18:14:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (597, 2, 217, 1, 0, 0, 0, '2021-09-20 18:14:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (607, 2, 294, 1, 1, 1, 1, '2021-09-20 20:46:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (608, 2, 295, 1, 0, 1, 0, '2021-09-20 19:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (609, 2, 296, 1, 1, 1, 1, '2021-09-20 20:46:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (610, 2, 297, 1, 0, 1, 0, '2021-09-20 19:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (611, 2, 298, 1, 0, 1, 0, '2021-09-20 19:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (612, 2, 102, 1, 1, 1, 1, '2021-10-07 01:46:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (614, 2, 304, 1, 0, 0, 0, '2021-09-20 20:11:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (619, 3, 302, 1, 0, 0, 0, '2021-10-07 01:56:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (620, 3, 311, 1, 0, 0, 0, '2021-10-07 01:56:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (624, 3, 269, 1, 1, 0, 1, '2021-09-20 20:50:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (626, 2, 176, 1, 1, 1, 1, '2021-09-20 20:55:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (627, 2, 203, 1, 1, 1, 1, '2021-09-20 20:55:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (629, 2, 289, 1, 1, 1, 1, '2021-09-20 20:55:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (630, 2, 290, 1, 1, 1, 1, '2021-09-20 20:55:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (631, 2, 9, 1, 1, 1, 1, '2021-10-07 01:27:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (632, 2, 10, 1, 1, 1, 1, '2021-10-07 01:27:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (633, 2, 12, 1, 1, 1, 1, '2021-09-20 21:09:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (634, 2, 13, 1, 1, 1, 1, '2021-09-22 19:19:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (639, 2, 330, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (640, 2, 331, 1, 1, 0, 0, '2021-09-20 22:53:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (641, 2, 332, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (642, 2, 333, 1, 1, 0, 0, '2021-09-20 22:53:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (643, 2, 334, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (644, 2, 335, 1, 1, 0, 0, '2021-09-21 01:52:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (646, 2, 337, 1, 1, 0, 0, '2021-09-21 19:15:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (647, 2, 338, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (648, 2, 339, 1, 1, 0, 0, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (649, 2, 340, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (650, 2, 341, 1, 1, 0, 0, '2021-09-22 19:19:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (651, 2, 342, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (652, 2, 343, 1, 1, 0, 0, '2021-09-22 19:19:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (653, 2, 344, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (654, 2, 345, 1, 0, 0, 0, '2021-09-20 22:27:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (655, 2, 48, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (658, 2, 178, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (659, 2, 179, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (660, 2, 180, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (661, 2, 181, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (662, 2, 182, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (667, 2, 188, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (668, 2, 189, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (669, 2, 206, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (670, 2, 207, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (671, 2, 208, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (672, 2, 209, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (673, 2, 210, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (675, 2, 212, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (676, 2, 213, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (677, 2, 250, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (678, 2, 251, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (679, 2, 253, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (680, 2, 254, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (681, 2, 255, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (687, 2, 271, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (688, 2, 272, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (689, 2, 349, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (690, 2, 350, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (691, 2, 351, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (692, 2, 352, 1, 0, 0, 0, '2021-09-20 23:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (693, 3, 86, 1, 0, 0, 0, '2021-10-07 02:07:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (695, 2, 43, 1, 1, 1, 1, '2021-09-21 00:07:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (696, 2, 44, 1, 0, 0, 0, '2021-09-20 23:59:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (700, 3, 109, 1, 1, 0, 1, '2021-10-07 02:07:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (703, 2, 27, 1, 1, 0, 1, '2021-09-21 00:22:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (706, 2, 31, 1, 1, 0, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (707, 2, 32, 1, 1, 1, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (708, 2, 33, 1, 1, 1, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (709, 2, 34, 1, 1, 1, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (710, 2, 35, 1, 1, 1, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (711, 2, 104, 1, 1, 1, 1, '2021-09-21 00:38:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (712, 2, 315, 1, 1, 0, 1, '2021-09-22 19:34:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (726, 3, 43, 1, 1, 1, 1, '2021-09-21 01:03:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (727, 3, 44, 1, 0, 0, 0, '2021-09-21 01:03:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (728, 3, 27, 1, 1, 0, 1, '2021-09-21 01:12:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (735, 3, 165, 1, 0, 0, 0, '2021-10-07 02:02:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (750, 3, 267, 1, 1, 1, 1, '2021-09-21 01:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (751, 3, 274, 1, 0, 0, 0, '2021-09-21 01:45:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (752, 3, 279, 1, 1, 1, 1, '2021-09-21 01:47:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (757, 2, 86, 1, 1, 1, 1, '2021-09-21 20:06:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (764, 2, 283, 1, 1, 1, 1, '2021-09-22 01:07:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (765, 2, 284, 1, 1, 1, 1, '2021-09-22 01:07:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (766, 2, 285, 1, 1, 1, 1, '2021-09-22 01:07:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (767, 2, 286, 1, 1, 1, 1, '2021-09-22 01:07:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (768, 3, 48, 1, 0, 0, 0, '2021-09-21 02:12:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (771, 3, 178, 1, 0, 0, 0, '2021-09-21 02:12:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (775, 3, 182, 1, 0, 0, 0, '2021-09-21 02:12:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (801, 3, 272, 1, 0, 0, 0, '2021-09-21 02:12:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (806, 2, 88, 1, 0, 0, 0, '2021-10-07 05:36:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (807, 2, 90, 1, 0, 0, 0, '2021-10-07 05:36:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (809, 2, 109, 1, 1, 0, 1, '2021-09-27 06:57:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (814, 2, 249, 1, 1, 1, 1, '2021-09-22 01:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (816, 2, 310, 1, 0, 0, 0, '2021-09-21 18:00:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (817, 2, 129, 0, 1, 0, 1, '2021-09-22 01:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (819, 1, 362, 1, 0, 0, 0, '2021-09-21 18:50:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (820, 1, 363, 1, 1, 1, 1, '2021-09-21 19:07:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (821, 1, 364, 1, 0, 0, 0, '2021-09-21 18:59:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (822, 1, 365, 1, 1, 1, 1, '2021-09-21 19:03:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (823, 1, 366, 1, 0, 0, 0, '2021-09-21 18:59:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (826, 2, 132, 1, 1, 1, 0, '2021-10-07 01:01:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (849, 2, 319, 1, 0, 0, 0, '2021-10-07 05:31:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (870, 3, 368, 1, 0, 0, 0, '2021-09-21 20:33:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (924, 8, 152, 1, 0, 0, 0, '2021-10-07 04:04:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (927, 4, 270, 1, 0, 0, 0, '2021-10-07 02:27:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (948, 4, 334, 1, 0, 0, 0, '2021-09-21 23:56:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (949, 4, 335, 1, 1, 0, 0, '2021-09-30 06:47:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (962, 4, 176, 1, 1, 1, 1, '2021-10-07 05:52:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (963, 4, 203, 1, 1, 1, 1, '2021-10-07 05:52:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (965, 4, 289, 1, 1, 1, 1, '2021-09-30 07:32:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (966, 4, 290, 1, 1, 1, 1, '2021-09-30 07:32:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (983, 4, 216, 1, 0, 0, 0, '2021-09-22 00:25:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (984, 4, 217, 1, 0, 0, 0, '2021-09-22 00:34:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (990, 4, 86, 1, 0, 0, 0, '2021-10-07 02:37:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (995, 4, 109, 1, 1, 0, 1, '2021-10-01 00:27:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1001, 2, 118, 1, 0, 0, 0, '2021-09-22 00:55:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1016, 4, 43, 1, 1, 1, 1, '2021-09-22 01:04:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1017, 4, 44, 1, 0, 0, 0, '2021-09-22 01:04:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1018, 4, 27, 1, 1, 0, 1, '2021-09-22 01:12:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1060, 4, 179, 1, 0, 0, 0, '2021-09-22 01:51:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1099, 2, 336, 1, 0, 0, 0, '2021-09-22 19:19:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1119, 1, 367, 1, 1, 1, 1, '2021-10-07 05:04:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1134, 9, 102, 1, 1, 1, 1, '2021-09-22 20:44:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1136, 9, 132, 1, 0, 0, 0, '2021-10-07 04:18:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1137, 9, 134, 1, 0, 0, 0, '2021-10-07 04:18:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1138, 9, 135, 1, 0, 0, 0, '2021-10-07 04:18:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1141, 9, 218, 1, 0, 0, 0, '2021-09-22 20:46:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1142, 9, 219, 1, 0, 0, 0, '2021-09-22 20:46:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1145, 9, 299, 1, 1, 1, 1, '2021-09-22 22:31:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1146, 9, 303, 1, 0, 0, 0, '2021-10-07 04:24:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1147, 9, 304, 1, 0, 0, 0, '2021-09-22 20:46:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1148, 9, 305, 1, 0, 0, 0, '2021-10-07 04:25:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1150, 9, 307, 1, 0, 0, 0, '2021-09-22 20:46:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1151, 9, 319, 1, 0, 0, 0, '2021-10-07 04:25:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1165, 5, 308, 1, 0, 0, 0, '2021-09-22 20:57:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1175, 5, 329, 1, 0, 0, 0, '2021-09-22 22:14:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1188, 1, 53, 1, 1, 0, 0, '2021-09-22 23:24:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1189, 5, 149, 1, 1, 1, 1, '2021-09-22 22:40:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1190, 5, 175, 1, 1, 1, 1, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1191, 5, 243, 1, 0, 1, 0, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1193, 5, 260, 1, 1, 1, 1, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1194, 5, 263, 1, 1, 1, 1, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1195, 5, 312, 1, 0, 1, 0, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1196, 5, 314, 1, 1, 0, 1, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1197, 5, 355, 1, 0, 1, 0, '2021-09-22 22:59:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1204, 9, 138, 1, 0, 0, 0, '2021-10-07 04:51:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1205, 9, 139, 1, 0, 0, 0, '2021-10-07 04:51:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1206, 9, 140, 1, 1, 1, 1, '2021-10-23 04:56:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1207, 9, 142, 1, 1, 1, 1, '2021-10-23 04:56:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1210, 9, 196, 1, 0, 0, 0, '2021-10-07 04:27:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1212, 9, 198, 1, 0, 0, 0, '2021-09-22 23:19:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1213, 9, 220, 1, 0, 0, 0, '2021-10-07 04:27:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1215, 9, 300, 1, 1, 1, 1, '2021-09-23 01:24:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1216, 9, 301, 1, 0, 0, 0, '2021-09-22 23:19:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1217, 9, 308, 1, 0, 0, 0, '2021-09-22 23:19:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1218, 9, 309, 1, 0, 0, 0, '2021-10-07 04:27:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1220, 9, 322, 1, 1, 1, 1, '2021-09-23 01:24:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1224, 9, 326, 1, 0, 0, 0, '2021-10-07 04:27:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1225, 9, 327, 1, 0, 0, 0, '2021-09-22 23:19:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1226, 9, 329, 1, 0, 0, 0, '2021-09-22 23:19:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1235, 1, 191, 1, 0, 0, 0, '2021-09-22 23:49:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1246, 5, 317, 1, 1, 0, 1, '2021-09-23 00:16:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1248, 5, 270, 1, 0, 0, 0, '2021-10-07 03:23:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1250, 5, 102, 1, 1, 1, 1, '2021-09-23 00:32:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1251, 5, 346, 1, 0, 0, 0, '2021-09-23 00:32:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1269, 5, 337, 1, 1, 0, 0, '2021-09-23 01:31:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1278, 5, 236, 1, 0, 0, 0, '2021-10-07 03:26:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1306, 5, 216, 1, 0, 0, 0, '2021-09-23 01:40:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1307, 5, 217, 1, 0, 0, 0, '2021-09-23 01:40:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1317, 5, 86, 1, 0, 0, 0, '2021-10-07 03:29:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1322, 5, 109, 1, 1, 0, 1, '2021-09-23 19:36:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1329, 5, 43, 1, 1, 1, 1, '2021-09-30 00:45:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1330, 5, 44, 1, 0, 0, 0, '2021-09-23 02:12:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1331, 5, 27, 1, 1, 0, 1, '2021-09-23 02:15:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1355, 9, 270, 1, 0, 0, 0, '2021-10-07 06:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1358, 9, 236, 1, 0, 0, 0, '2021-10-07 04:42:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1370, 5, 158, 1, 0, 0, 0, '2021-09-23 19:44:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1416, 5, 369, 1, 0, 0, 0, '2021-09-23 20:16:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1426, 5, 180, 1, 0, 0, 0, '2021-09-23 20:23:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1460, 6, 270, 1, 0, 0, 0, '2021-10-07 03:38:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1503, 6, 304, 1, 0, 0, 0, '2021-09-27 00:19:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1509, 6, 319, 1, 0, 0, 0, '2021-10-07 06:03:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1518, 9, 216, 1, 0, 0, 0, '2021-09-27 00:45:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1519, 9, 217, 1, 0, 0, 0, '2021-09-27 00:45:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1579, 2, 155, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1580, 2, 156, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1581, 2, 157, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1582, 2, 158, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1583, 2, 159, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1584, 2, 161, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1585, 2, 162, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1586, 2, 190, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1587, 2, 191, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1588, 2, 238, 1, 0, 0, 0, '2021-09-27 05:41:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1596, 9, 48, 1, 0, 0, 0, '2021-09-27 06:56:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1599, 9, 178, 1, 0, 0, 0, '2021-09-27 06:56:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1603, 9, 182, 1, 0, 0, 0, '2021-09-27 06:56:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1631, 9, 350, 1, 0, 0, 0, '2021-09-27 06:56:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1663, 9, 27, 1, 0, 0, 0, '2021-10-23 04:59:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1664, 9, 43, 1, 1, 1, 1, '2021-09-28 01:25:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1665, 9, 44, 1, 0, 0, 0, '2021-09-28 01:20:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1666, 9, 86, 1, 0, 0, 0, '2021-10-07 04:46:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1671, 9, 109, 1, 1, 0, 1, '2021-09-28 01:58:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1679, 9, 204, 1, 1, 1, 1, '2021-09-28 03:31:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1680, 9, 205, 1, 0, 0, 0, '2021-09-28 03:31:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1697, 6, 152, 1, 1, 1, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1698, 6, 153, 1, 1, 1, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1699, 6, 171, 1, 1, 1, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1700, 6, 244, 1, 0, 1, 0, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1701, 6, 261, 1, 1, 1, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1702, 6, 262, 1, 1, 1, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1703, 6, 315, 1, 1, 0, 1, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1704, 6, 353, 1, 0, 1, 0, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1705, 6, 354, 1, 0, 1, 0, '2021-09-28 05:21:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1713, 6, 236, 1, 0, 0, 0, '2021-10-07 03:46:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1716, 6, 176, 1, 1, 1, 1, '2021-10-07 06:04:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1719, 6, 289, 1, 1, 1, 1, '2021-09-28 06:47:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1720, 6, 290, 1, 1, 1, 1, '2021-09-28 06:47:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1739, 6, 43, 1, 1, 1, 1, '2021-09-28 07:53:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1740, 6, 44, 1, 0, 0, 0, '2021-09-28 07:51:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1741, 6, 27, 1, 1, 0, 1, '2021-09-28 07:57:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1742, 6, 118, 1, 0, 0, 0, '2021-09-28 07:59:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1747, 6, 159, 1, 0, 0, 0, '2021-09-28 07:59:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1782, 2, 205, 1, 0, 0, 0, '2021-09-29 03:01:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1823, 6, 338, 1, 0, 0, 0, '2021-09-29 05:47:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1824, 6, 339, 1, 1, 0, 0, '2021-09-29 06:07:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1831, 2, 318, 1, 1, 0, 1, '2021-09-29 06:26:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1838, 6, 181, 1, 0, 0, 0, '2021-09-29 06:27:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1872, 6, 102, 1, 1, 1, 1, '2021-09-29 06:31:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1873, 6, 86, 1, 0, 0, 0, '2021-10-07 03:48:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1878, 6, 109, 1, 1, 0, 1, '2021-09-29 07:05:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1900, 6, 329, 1, 0, 0, 0, '2021-09-29 07:59:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1906, 5, 370, 1, 0, 0, 0, '2021-09-30 02:11:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1908, 4, 146, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1909, 4, 148, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1910, 4, 170, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1911, 4, 200, 1, 1, 0, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1912, 4, 201, 1, 0, 1, 0, '2021-09-30 05:42:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1913, 4, 224, 1, 0, 0, 0, '2021-09-30 05:36:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1914, 4, 225, 1, 1, 0, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1915, 4, 226, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1916, 4, 227, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1917, 4, 291, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1918, 4, 292, 1, 1, 1, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1919, 4, 313, 1, 1, 0, 1, '2021-10-07 02:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1931, 4, 236, 1, 0, 0, 0, '2021-10-07 02:30:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1934, 4, 118, 1, 0, 0, 0, '2021-10-01 00:51:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1937, 4, 157, 1, 0, 0, 0, '2021-10-01 00:51:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1944, 4, 238, 1, 0, 0, 0, '2021-10-01 00:51:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1957, 4, 256, 1, 0, 0, 0, '2021-10-01 00:54:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1976, 4, 102, 1, 1, 1, 1, '2021-10-01 01:33:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1977, 4, 274, 1, 0, 0, 0, '2021-10-01 01:36:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1980, 9, 137, 1, 1, 1, 1, '2021-10-23 04:54:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1981, 2, 173, 1, 1, 1, 1, '2021-10-07 05:34:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1982, 2, 347, 1, 0, 1, 1, '2021-10-07 05:34:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1995, 1, 196, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1996, 1, 323, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1997, 1, 324, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1998, 1, 325, 1, 1, 1, 1, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1999, 1, 236, 1, 1, 1, 1, '2021-10-07 00:36:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2001, 2, 270, 1, 0, 0, 0, '2021-10-07 01:25:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2002, 2, 236, 1, 1, 1, 0, '2021-10-07 01:28:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2003, 2, 266, 1, 0, 0, 0, '2021-10-07 01:43:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2019, 8, 132, 1, 1, 1, 1, '2021-10-07 04:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2020, 8, 135, 1, 1, 1, 1, '2021-10-07 04:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2021, 8, 218, 1, 0, 0, 0, '2021-10-07 04:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2022, 8, 219, 1, 0, 0, 0, '2021-10-07 04:00:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2023, 8, 221, 1, 1, 1, 1, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2024, 8, 222, 1, 1, 0, 1, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2025, 8, 138, 1, 1, 1, 1, '2021-10-07 04:00:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2026, 8, 139, 1, 1, 1, 1, '2021-10-07 04:00:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2027, 8, 143, 1, 1, 1, 1, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2028, 8, 144, 1, 1, 0, 1, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2029, 8, 326, 1, 0, 0, 0, '2021-10-07 04:01:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2031, 8, 196, 1, 1, 1, 1, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2032, 8, 198, 1, 0, 0, 0, '2021-10-07 04:03:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2034, 4, 202, 1, 0, 0, 0, '2021-10-07 04:03:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2035, 8, 146, 1, 0, 0, 0, '2021-10-07 04:03:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2036, 8, 148, 1, 0, 0, 0, '2021-10-07 04:03:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2037, 8, 200, 1, 0, 0, 0, '2021-10-07 04:03:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2038, 8, 225, 1, 0, 0, 0, '2021-10-07 04:03:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2039, 8, 149, 1, 0, 0, 0, '2021-10-07 04:04:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2042, 8, 168, 1, 0, 0, 0, '2021-10-07 04:04:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2043, 8, 270, 1, 0, 0, 0, '2021-10-07 04:05:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2044, 8, 173, 1, 0, 0, 0, '2021-10-07 04:06:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2045, 8, 347, 1, 0, 0, 0, '2021-10-07 04:06:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2046, 8, 330, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2047, 8, 332, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2048, 8, 334, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2049, 8, 336, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2050, 8, 338, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2051, 8, 340, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2052, 8, 342, 1, 0, 0, 0, '2021-10-07 04:08:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2053, 8, 236, 1, 1, 1, 0, '2021-10-07 04:08:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2055, 8, 165, 1, 1, 1, 1, '2021-10-07 06:12:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2056, 8, 166, 1, 1, 1, 1, '2021-10-07 06:12:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2057, 8, 80, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2058, 8, 81, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2059, 8, 82, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2060, 8, 83, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2061, 8, 84, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2062, 8, 85, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2063, 8, 204, 1, 1, 1, 1, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2064, 8, 205, 1, 0, 0, 0, '2021-10-07 04:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2065, 8, 214, 1, 0, 0, 0, '2021-10-07 04:11:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2066, 8, 215, 1, 0, 0, 0, '2021-10-07 04:11:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2067, 8, 86, 1, 0, 0, 0, '2021-10-07 04:11:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2068, 8, 109, 1, 1, 0, 1, '2021-10-07 04:11:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2069, 8, 31, 1, 0, 0, 0, '2021-10-07 04:12:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2070, 8, 32, 1, 0, 0, 0, '2021-10-07 04:12:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2071, 8, 48, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2072, 8, 89, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2073, 8, 178, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2074, 8, 180, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2075, 8, 181, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2076, 8, 182, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2077, 8, 207, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2078, 8, 208, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2079, 8, 209, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2080, 8, 253, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2081, 8, 254, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2082, 8, 255, 1, 0, 0, 0, '2021-10-07 04:13:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2083, 8, 118, 1, 0, 0, 0, '2021-10-07 04:14:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2084, 8, 238, 1, 0, 0, 0, '2021-10-07 04:14:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2085, 8, 102, 1, 1, 1, 1, '2021-10-07 04:14:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2086, 9, 321, 1, 0, 0, 0, '2021-10-07 04:25:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2093, 1, 132, 1, 1, 1, 1, '2021-10-07 04:54:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2094, 1, 198, 1, 0, 0, 0, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2095, 1, 327, 1, 0, 0, 0, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2096, 1, 329, 1, 0, 0, 0, '2021-10-07 04:55:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2108, 1, 294, 1, 1, 1, 1, '2021-10-07 04:56:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2109, 1, 296, 1, 1, 1, 1, '2021-10-07 04:56:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2110, 1, 297, 1, 0, 0, 0, '2021-10-07 04:56:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2111, 1, 298, 1, 0, 0, 0, '2021-10-07 04:56:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2112, 1, 129, 0, 1, 0, 1, '2021-10-07 04:56:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2113, 1, 27, 1, 1, 0, 1, '2021-10-07 04:56:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2114, 1, 155, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2115, 1, 156, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2116, 1, 157, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2117, 1, 158, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2118, 1, 159, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2119, 1, 161, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2120, 1, 162, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2121, 1, 190, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2122, 1, 238, 1, 0, 0, 0, '2021-10-07 04:57:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2127, 1, 320, 1, 0, 0, 0, '2021-10-07 05:01:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2128, 1, 321, 1, 0, 0, 0, '2021-10-07 05:01:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2135, 1, 371, 1, 0, 0, 0, '2021-10-07 05:05:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2150, 1, 280, 1, 1, 1, 1, '2021-10-07 05:29:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2151, 1, 369, 1, 0, 0, 0, '2021-10-07 05:30:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2152, 1, 370, 1, 0, 0, 0, '2021-10-07 05:30:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2153, 1, 281, 1, 0, 0, 0, '2021-10-07 05:30:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2154, 1, 282, 1, 0, 0, 0, '2021-10-07 05:30:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2155, 2, 321, 1, 0, 0, 0, '2021-10-07 05:31:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2156, 2, 197, 1, 0, 0, 0, '2021-10-07 05:33:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2157, 2, 248, 1, 0, 0, 0, '2021-10-07 05:33:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2158, 2, 264, 1, 1, 0, 1, '2021-10-07 05:34:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2159, 2, 247, 1, 0, 0, 0, '2021-10-07 05:35:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2160, 2, 281, 1, 0, 0, 0, '2021-10-07 05:40:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2161, 2, 282, 1, 0, 0, 0, '2021-10-07 05:40:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2162, 2, 371, 1, 0, 0, 0, '2021-10-07 05:40:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2163, 3, 257, 1, 0, 0, 0, '2021-10-07 05:41:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2164, 3, 355, 1, 0, 0, 0, '2021-10-07 05:41:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2165, 3, 153, 1, 0, 0, 0, '2021-10-07 05:41:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2166, 3, 244, 1, 0, 0, 0, '2021-10-07 05:41:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2167, 3, 354, 1, 0, 0, 0, '2021-10-07 05:41:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2168, 3, 202, 1, 0, 0, 0, '2021-10-07 05:42:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2169, 3, 246, 1, 0, 0, 0, '2021-10-07 05:42:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2170, 3, 237, 1, 0, 0, 0, '2021-10-07 05:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2171, 3, 240, 1, 0, 1, 0, '2021-10-07 05:43:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2172, 3, 242, 1, 0, 1, 0, '2021-10-07 05:43:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2173, 3, 129, 0, 1, 0, 1, '2021-10-07 05:43:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2174, 3, 183, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2175, 3, 188, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2176, 3, 206, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2177, 3, 207, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2178, 3, 208, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2179, 3, 209, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2180, 3, 211, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2181, 3, 258, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2182, 3, 271, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2183, 3, 350, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2184, 3, 369, 1, 0, 0, 0, '2021-10-07 05:46:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2185, 3, 238, 1, 0, 0, 0, '2021-10-07 05:46:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2186, 3, 362, 1, 0, 0, 0, '2021-10-07 05:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2187, 3, 363, 1, 1, 1, 1, '2021-10-07 05:47:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2188, 3, 366, 1, 0, 0, 0, '2021-10-07 05:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2189, 3, 367, 1, 1, 1, 1, '2021-10-07 05:47:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2190, 3, 371, 1, 0, 0, 0, '2021-10-07 05:47:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2194, 4, 132, 1, 0, 0, 0, '2021-10-07 05:50:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2195, 4, 138, 1, 0, 0, 0, '2021-10-07 05:51:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2196, 4, 264, 1, 1, 0, 1, '2021-10-07 05:52:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2198, 4, 371, 1, 0, 0, 0, '2021-10-07 05:56:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2201, 5, 132, 1, 0, 0, 0, '2021-10-07 05:56:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2202, 5, 304, 1, 0, 0, 0, '2021-10-07 05:56:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2204, 5, 138, 1, 0, 0, 0, '2021-10-07 05:57:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2205, 5, 139, 1, 0, 0, 0, '2021-10-07 05:57:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2206, 5, 307, 1, 0, 0, 0, '2021-10-07 05:57:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2207, 5, 257, 1, 1, 1, 1, '2021-10-07 05:58:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2209, 5, 168, 1, 1, 1, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2210, 5, 169, 1, 1, 1, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2211, 5, 202, 1, 1, 0, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2212, 5, 246, 1, 0, 0, 0, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2213, 5, 293, 1, 1, 1, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2214, 5, 302, 1, 1, 0, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2215, 5, 311, 1, 1, 1, 1, '2021-10-07 05:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2216, 5, 336, 1, 0, 0, 0, '2021-10-07 05:59:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2217, 5, 274, 1, 0, 0, 0, '2021-10-07 06:00:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2219, 5, 183, 1, 0, 0, 0, '2021-10-07 06:01:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2220, 5, 211, 1, 0, 0, 0, '2021-10-07 06:01:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2221, 5, 371, 1, 0, 0, 0, '2021-10-07 06:02:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2222, 6, 132, 1, 0, 0, 0, '2021-10-07 06:03:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2223, 6, 135, 1, 0, 0, 0, '2021-10-07 06:03:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2224, 6, 138, 1, 0, 0, 0, '2021-10-07 06:03:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2225, 6, 139, 1, 0, 0, 0, '2021-10-07 06:03:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2226, 6, 308, 1, 0, 0, 0, '2021-10-07 06:03:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2227, 6, 309, 1, 0, 0, 0, '2021-10-07 06:03:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2228, 6, 203, 1, 1, 1, 1, '2021-10-07 06:04:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2229, 6, 264, 1, 1, 0, 1, '2021-10-07 06:04:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2231, 6, 274, 1, 0, 0, 0, '2021-10-07 06:06:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2232, 6, 371, 1, 0, 0, 0, '2021-10-07 06:07:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2233, 8, 304, 1, 0, 0, 0, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2234, 8, 305, 1, 0, 1, 0, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2235, 8, 306, 1, 0, 0, 0, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2236, 8, 307, 1, 0, 0, 0, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2237, 8, 319, 1, 1, 1, 1, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2238, 8, 320, 1, 0, 0, 0, '2021-10-07 06:09:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2239, 8, 301, 1, 0, 0, 0, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2240, 8, 309, 1, 0, 1, 0, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2241, 8, 310, 1, 0, 0, 0, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2242, 8, 329, 1, 0, 0, 0, '2021-10-07 06:10:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2243, 8, 257, 1, 0, 0, 0, '2021-10-07 06:10:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2244, 8, 153, 1, 0, 0, 0, '2021-10-07 06:11:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2245, 8, 169, 1, 0, 0, 0, '2021-10-07 06:11:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2246, 8, 202, 1, 0, 0, 0, '2021-10-07 06:11:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2247, 8, 302, 1, 0, 0, 0, '2021-10-07 06:11:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2248, 8, 311, 1, 0, 0, 0, '2021-10-07 06:11:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2249, 2, 348, 1, 0, 1, 0, '2021-10-07 06:17:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2250, 8, 247, 1, 1, 1, 1, '2021-10-07 06:12:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2251, 8, 318, 1, 1, 0, 1, '2021-10-07 06:12:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2252, 8, 294, 1, 1, 1, 1, '2021-10-07 06:13:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2253, 8, 295, 1, 0, 1, 0, '2021-10-07 06:13:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2254, 8, 296, 1, 1, 1, 1, '2021-10-07 06:13:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2255, 8, 297, 1, 0, 0, 0, '2021-10-07 06:13:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2256, 8, 298, 1, 0, 0, 0, '2021-10-07 06:13:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2257, 2, 56, 1, 0, 0, 0, '2021-10-07 06:13:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2258, 8, 43, 1, 1, 1, 1, '2021-10-07 06:13:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2259, 8, 44, 1, 0, 0, 0, '2021-10-07 06:13:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2260, 8, 27, 1, 1, 0, 1, '2021-10-07 06:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2261, 8, 274, 1, 0, 0, 0, '2021-10-07 06:13:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2262, 2, 54, 1, 0, 0, 0, '2021-10-07 06:13:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2263, 8, 183, 1, 0, 0, 0, '2021-10-07 06:15:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2264, 8, 256, 1, 0, 0, 0, '2021-10-07 06:15:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2265, 8, 258, 1, 0, 0, 0, '2021-10-07 06:15:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2266, 8, 259, 1, 0, 0, 0, '2021-10-07 06:15:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2267, 8, 350, 1, 0, 0, 0, '2021-10-07 06:15:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2268, 8, 162, 1, 0, 0, 0, '2021-10-07 06:15:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2269, 8, 371, 1, 0, 0, 0, '2021-10-07 06:15:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2271, 9, 274, 1, 0, 0, 0, '2021-10-07 06:19:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2272, 9, 118, 1, 0, 0, 0, '2021-10-07 06:20:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2273, 9, 238, 1, 0, 0, 0, '2021-10-07 06:20:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2274, 9, 371, 1, 0, 0, 0, '2021-10-07 06:20:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2275, 1, 218, 1, 0, 0, 0, '2021-10-07 06:20:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2276, 1, 330, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2277, 1, 331, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2278, 1, 332, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2279, 1, 333, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2280, 1, 334, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2281, 1, 335, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2282, 1, 336, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2283, 1, 337, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2284, 1, 338, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2285, 1, 339, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2286, 1, 340, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2287, 1, 341, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2288, 1, 342, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2289, 1, 343, 1, 1, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2290, 1, 344, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2291, 1, 345, 1, 0, 0, 0, '2021-10-22 00:27:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2292, 1, 372, 1, NULL, NULL, NULL, '2021-10-29 07:41:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2293, 1, 373, 1, NULL, NULL, NULL, '2021-10-29 07:42:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2294, 1, 374, 1, 1, 1, 1, '2021-10-29 07:45:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2295, 1, 375, 1, 1, 1, 1, '2021-10-29 07:45:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2296, 1, 386, 1, 1, 0, 1, '2021-11-10 06:22:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2297, 3, 386, 1, 1, 0, 1, '2021-11-10 06:22:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2298, 1, 387, 1, 0, 0, 0, '2021-11-10 06:24:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2299, 3, 387, 1, 0, 0, 0, '2021-11-10 06:24:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2300, 1, 419, 1, 1, 1, 1, '2024-08-20 10:19:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2301, 1, 415, 1, 0, 0, 0, '2024-08-20 10:19:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2302, 1, 416, 1, 1, 1, 1, '2024-08-20 10:19:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2303, 1, 417, 1, 1, 1, 1, '2024-08-20 10:19:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2304, 1, 418, 1, 1, 1, 1, '2024-08-20 10:19:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2305, 1, 414, 1, 0, 1, 0, '2024-08-20 10:20:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2306, 1, 398, 1, 1, 1, 1, '2024-08-20 10:21:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2307, 1, 402, 1, 0, 0, 0, '2024-08-20 10:21:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2308, 1, 413, 1, 0, 1, 0, '2024-08-20 10:21:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2309, 1, 409, 1, 0, 0, 1, '2024-08-20 10:21:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2310, 1, 410, 1, 1, 0, 1, '2024-08-20 10:21:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2311, 1, 411, 1, 0, 0, 0, '2024-08-20 10:21:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2312, 1, 412, 1, 0, 0, 0, '2024-08-20 10:21:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2313, 1, 406, 1, 1, 1, 1, '2024-08-20 10:22:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2314, 1, 407, 1, 1, 1, 1, '2024-08-20 10:22:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2315, 1, 408, 1, 1, 1, 1, '2024-08-20 10:22:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2316, 1, 405, 1, 1, 1, 1, '2024-08-20 10:22:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2317, 1, 393, 1, 1, 1, 1, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2318, 1, 394, 1, 1, 1, 1, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2319, 1, 395, 1, 1, 1, 1, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2320, 1, 396, 1, 1, 1, 1, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2321, 1, 401, 1, 0, 0, 0, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2322, 1, 403, 1, 0, 0, 0, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2323, 1, 404, 1, 0, 0, 0, '2024-08-20 10:23:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2324, 1, 392, 1, 1, 1, 1, '2024-08-20 10:25:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2325, 1, 400, 1, 0, 0, 0, '2024-08-20 10:25:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2326, 1, 390, 1, 0, 0, 0, '2024-08-20 10:25:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2327, 1, 399, 1, 0, 0, 0, '2024-08-20 10:25:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2328, 1, 388, 1, 1, 1, 1, '2024-08-20 10:27:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2329, 1, 389, 1, 1, 1, 1, '2024-08-20 10:27:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2330, 1, 391, 1, 1, 1, 1, '2024-08-20 10:27:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2331, 1, 397, 1, 0, 0, 0, '2024-08-20 10:31:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2332, 3, 415, 1, 0, 0, 0, '2025-07-02 08:18:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2333, 3, 416, 1, 1, 1, 0, '2025-07-02 08:18:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2334, 3, 417, 1, 1, 1, 0, '2025-07-02 08:18:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2335, 3, 418, 1, 1, 1, 0, '2025-07-02 08:18:54');


#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_url` varchar(500) DEFAULT NULL,
  `folder_path` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `start_month` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(255) NOT NULL DEFAULT '["4"]',
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(20) DEFAULT '24-hour',
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `timezone` varchar(30) DEFAULT 'UTC',
  `image` varchar(100) DEFAULT NULL,
  `mini_logo` varchar(200) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `credit_limit` varchar(255) DEFAULT NULL,
  `opd_record_month` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `cron_secret_key` varchar(100) NOT NULL,
  `doctor_restriction` varchar(100) NOT NULL,
  `superadmin_restriction` varchar(200) NOT NULL,
  `patient_panel` varchar(50) NOT NULL,
  `scan_code_type` varchar(50) NOT NULL DEFAULT 'barcode',
  `mobile_api_url` varchar(200) NOT NULL,
  `app_primary_color_code` varchar(50) NOT NULL,
  `app_secondary_color_code` varchar(50) NOT NULL,
  `app_logo` varchar(200) NOT NULL,
  `zoom_api_key` varchar(200) NOT NULL,
  `zoom_api_secret` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `sch_settings` (`id`, `base_url`, `folder_path`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `start_month`, `session_id`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `cron_secret_key`, `doctor_restriction`, `superadmin_restriction`, `patient_panel`, `scan_code_type`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `zoom_api_key`, `zoom_api_secret`, `created_at`) VALUES (1, NULL, NULL, 'LC 360', 0, NULL, 'Your Hospital Email', 'Your Hospital Phone', 'Your Hospital Address', '', NULL, 4, '[\"4\"]', 'LC001', 'm/d/Y', '12-hour', 'KES', 'Ksh', 'disabled', 'UTC', '1.jpg', '0mini_logo.png', 'default.jpg', '20000', '1', 'no', 'BYPtJpi8RcF4dqZyCB6Fu051f', 'disabled', 'enabled', 'enabled', 'barcode', '', '#424242', '#eeeeee', '0app_logo.png', '', '', '2025-07-02 11:28:50');


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_patient` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_id` (`created_id`),
  KEY `index_title` (`title`),
  KEY `index_publish_date` (`publish_date`),
  KEY `index_date` (`date`),
  KEY `index_visible_staff` (`visible_staff`),
  KEY `index_visible_patient` (`visible_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: share_content_for
#

DROP TABLE IF EXISTS `share_content_for`;

CREATE TABLE `share_content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(20) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_content_id` (`share_content_id`),
  KEY `student_id` (`patient_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: share_contents
#

DROP TABLE IF EXISTS `share_contents`;

CREATE TABLE `share_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `share_date` date DEFAULT NULL,
  `valid_upto` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `index_send_to` (`send_to`),
  KEY `index_share_date` (`share_date`),
  KEY `index_valid_upto` (`valid_upto`),
  KEY `index_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: share_upload_contents
#

DROP TABLE IF EXISTS `share_upload_contents`;

CREATE TABLE `share_upload_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_content_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_content_id` (`upload_content_id`),
  KEY `share_content_id` (`share_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: shift_details
#

DROP TABLE IF EXISTS `shift_details`;

CREATE TABLE `shift_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `consult_duration` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `charge_id` (`charge_id`),
  KEY `index_consult_duration` (`consult_duration`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `shift_details` (`id`, `staff_id`, `consult_duration`, `charge_id`, `created_at`) VALUES (1, 12, 15, 5, '2025-07-02 08:48:27');


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_source` (`source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `source` (`id`, `source`, `description`, `created_at`) VALUES (1, 'Referral-Based', 'Doctor Referral', '2025-07-02 11:36:12');
INSERT INTO `source` (`id`, `source`, `description`, `created_at`) VALUES (2, 'Referral-Based', 'Nursing Home Referral', '2025-07-02 11:36:12');
INSERT INTO `source` (`id`, `source`, `description`, `created_at`) VALUES (3, 'Referral-Based', 'Specialist Referral', '2025-07-02 11:36:12');
INSERT INTO `source` (`id`, `source`, `description`, `created_at`) VALUES (4, 'Marketing & Advertisement', 'Newspaper Advertisement', '2025-07-02 11:36:12');
INSERT INTO `source` (`id`, `source`, `description`, `created_at`) VALUES (5, 'Online / Digital', 'Hospital Website', '2025-07-02 11:36:12');


#
# TABLE STRUCTURE FOR: specialist
#

DROP TABLE IF EXISTS `specialist`;

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialist_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_specialist_name` (`specialist_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (1, 'Cardiologist', 'yes', '2025-07-01 13:36:38');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (2, 'Neurologist', 'yes', '2025-07-01 13:36:50');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (3, 'Pediatrician', 'yes', '2025-07-01 13:37:04');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (4, 'Gynecologist', 'yes', '2025-07-01 13:37:12');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (5, 'Orthopedic Surgeon	', 'yes', '2025-07-01 13:37:25');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (6, 'Oncologist', 'yes', '2025-07-01 13:37:42');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (7, 'Psychiatrist', 'yes', '2025-07-01 13:37:51');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`, `created_at`) VALUES (8, 'General staff', 'yes', '2025-07-02 08:06:58');


#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) DEFAULT NULL,
  `lang_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `staff_designation_id` int(11) DEFAULT NULL,
  `specialist` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `specialization` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `zoom_api_key` varchar(100) NOT NULL,
  `zoom_api_secret` varchar(100) NOT NULL,
  `pan_number` varchar(30) NOT NULL,
  `identification_number` varchar(30) NOT NULL,
  `local_identification_number` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `staff_designation_id` (`staff_designation_id`),
  KEY `department_id` (`department_id`),
  KEY `index_name` (`name`),
  KEY `index_surname` (`surname`),
  KEY `index_father_name` (`father_name`),
  KEY `index_mother_name` (`mother_name`),
  KEY `index_contact_no` (`contact_no`),
  KEY `index_emergency_contact_no` (`emergency_contact_no`),
  KEY `index_email` (`email`),
  KEY `index_dob` (`dob`),
  KEY `index_marital_status` (`marital_status`),
  KEY `index_date_of_joining` (`date_of_joining`),
  KEY `index_date_of_leaving` (`date_of_leaving`),
  KEY `index_gender` (`gender`),
  KEY `index_blood_group` (`blood_group`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (1, '9001', 0, NULL, NULL, '', '', '', '', 'Super Admin', '', '', '', '', '', 'saumen@gmail.com', NULL, '', NULL, NULL, '', '', '', '', '$2y$10$6yjbTrYV07dJEQNEt7TwoO.rXI1JAFjPwtV6vunHVJa5G6I/St1Bq', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-05-22 10:48:00');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (2, 'D001', 0, 0, 0, '', '', '', '', 'Bimal', 'Kundu', '', '', '', '', 'bkundu@gmail.com', '1980-03-05', '', NULL, NULL, '', '', '', '', '$2y$10$6yjbTrYV07dJEQNEt7TwoO.rXI1JAFjPwtV6vunHVJa5G6I/St1Bq', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-06-17 17:33:53');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (3, 'D002', 0, 0, 0, '', '', '', '', 'Priya', 'Sharma', '', '', '', '', 'priya.sharma@hospitaldemo.com', '1990-07-19', '', NULL, NULL, '', '', '', '', '$2y$10$0AIxCi3CYxGbdIPgWWHmFuP52GJLW1RlduwWecr4IhKhhM7WCrwba', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', '', '', '', '', '', '2025-07-01 13:53:25');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (4, 'D003', 0, 0, 0, '', '', '', '', 'Rajesh', 'Verma', '', '', '', '', 'rajeshverma@hospitaldemo.com', '1980-03-15', '', NULL, NULL, '', '', '', '', '$2y$10$mryIt..FQ6i18KvWw8EqNedoCVh6idBMH35RJJEZI5yOlvd2W5cZC', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:03:48');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (5, 'D004', 0, 0, 0, '', '', '', '', 'Sandeep', 'Sharma', '', '', '', '', 'sandeep.sharma@healthpoint.com', '1983-05-01', '', NULL, NULL, '', '', '', '', '$2y$10$WRPDkZcrbBG72sDzQAxZJ.Sy.R7DoZSqj0AEeUVCZ/0rDYKTJoqXm', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:06:53');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (6, 'D005', 0, 0, 0, '', '', '', '', 'Swati', 'Das', '', '', '', '', 'swati.das@healthpoint.com', '1992-11-08', '', NULL, NULL, '', '', '', '', '$2y$10$JAwmdP0uOBgdpqDXNMLN3uiNTMQFocz6Qv30fbs/3b1bTv21Pf9ze', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:11:11');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (7, 'D006', 0, 0, 0, '', '', '', '', 'Neha', 'Bansal', '', '', '', '', 'neha.bansal@mediclinic.in', '1988-03-12', '', NULL, NULL, '', '', '', '', '$2y$10$j7TVTbzdJQszN2mFEcBITOoQngqujlX3iKfjoN6qqN3gyVfcjxb1u', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:15:14');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (8, 'D007', 0, 0, 0, '', '', '', '', 'Amitabh', 'Kulkarni', '', '', '', '', 'amitabh.kulkarni@careplus.co.in', '1982-04-09', '', NULL, NULL, '', '', '', '', '$2y$10$nuKTLCHRzKX3Kja0RNa9WuVMCqdazQGvmF1FrpaUU3Ot1fXBJ2eXy', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:16:24');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (9, 'D008', 0, 0, 0, '', '', '', '', 'Naveen', 'Reddy', '', '', '', '', 'naveen.reddy@medilife.in', '1986-06-02', '', NULL, NULL, '', '', '', '', '$2y$10$C3qNahqGuTF98Af9B0o9f.PckaCqdAGAt9rZqeTCopFV.c65dXg8O', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:18:15');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (10, 'D009', 0, 0, 0, '', '', '', '', 'Ritu', 'Joshi', '', '', '', '', 'ritu.joshi@medicare.in', '1989-02-10', '', NULL, NULL, '', '', '', '', '$2y$10$KlsoYl.QAPchCKH26O0Ti.RhXRkLTVVhW7BVS6lWbBNHKyBkPvJlu', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:19:11');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (11, 'D010', 0, 0, 0, '', '', '', '', 'Anirban', 'Ghosh', '', '', '', '', 'anirban.ghosh@citymed.com', '1981-11-11', '', NULL, NULL, '', '', '', '', '$2y$10$1S6idQaibdzEcBZA6QCc8.57Tj71Y6lrqGxcVuNGVOpaCgOUbj1.O', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:20:02');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (12, 'D011', 0, 0, 0, '', '', '', '', 'Anjali', 'Rao', '', '', '', '', 'anjali.rao@cityhospital.org', '1985-01-05', '', NULL, NULL, '', '', '', '', '$2y$10$xJS19dEMk5Z4P075aR4ARetyx3I3lyBFUTi/JtYxCaTh2yDVa3kPG', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-01 14:30:15');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (13, 'NUR001', 0, 0, 0, '', '', '', '', 'Lakshmi', 'Reddy', '', '', '', '', 'lakshmi.reddy@hospital.in', '1987-10-17', '', NULL, NULL, '', '', '', '', '$2y$10$ad9rTrnYIFQr6WRdPtSCa.CxWuzqDDTGpBrSfIZ.S6Tzp1YTDqS4i', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-02 06:28:27');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (14, 'NUR003', 0, 0, 0, '', '', '', '', 'Sneha', 'Patil', '', '', '', '', 'sneha.patil@hospital.in', '1990-08-01', '', NULL, NULL, '', '', '', '', '$2y$10$4qX62WC3g5bto6dm4JCTmuhqaZ/nYqnbi7RUYjkV9pMIN7pE0R8gO', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-02 06:31:14');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (15, 'NUR002', 0, 0, 0, '', '', '', '', 'Rajesh', 'Kumar', '', '', '', '', 'rajesh.kumar@hospital.in', '1985-01-25', '', NULL, NULL, '', '', '', '', '$2y$10$01zdMV5xm9OCMdUUIaL/9e3pRyzomR3kg0gagS3HzG6MSCnYq7BEm', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-02 06:35:52');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (16, 'NUR004', 0, 0, 0, '', '', '', '', 'Anjali', 'Sharma', '', '', '', '', 'anjali.sharma@hospital.in', '1988-12-03', '', NULL, NULL, '', '', '', '', '$2y$10$2pL30/UaAfYHv0BCTEkjJuFQmkBgDy6JfCDqaV7zJI.qLDIGHtXJa', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-02 06:37:05');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (17, 'NUR005', 0, 0, 0, '', '', '', '', 'Vikram', 'Desai', '', '', '', '', 'vikram.desai@hospital.in', '1984-09-21', '', NULL, NULL, '', '', '', '', '$2y$10$Z8VXOUqGdNamISFlCRYKu.N02LgotA5eG2IPsInE/j.Rr/3VtiCuC', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', '', '2025-07-02 06:40:49');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (18, 'ST20250702001', 0, 8, 5, '8', 'B.A. in English (Lucknow University)', '3 years as Front Desk Executive at City Care Clinic', 'Hospital Front Desk & Appointment Management', 'Anjali', 'Verma', 'A K Verma', 'Sridevi Verma', '+919876543210', '+919812345678', 'anjali.verma@midlandhospital.in', '1999-07-01', 'Not Specified', '2025-07-01', NULL, 'C-12, Civil Lines, Lucknow, Uttar Pradesh – 226001\r\n\r\n', '152, Gomti Nagar Extension, Lucknow, Uttar Pradesh – 226010', 'Fluent in English and Hindi; skilled in patient coordination and OPD scheduling.', '', '$2y$10$cnQSEVG6akJzHXoCrJz9t..0g7OxXn1k.mlidNg6KuW5UsGIv15Ky', 'Female', 'O-', 'Anjali Verma', '123456789012', 'SBI', 'SBIN0001234', 'Civil Lines Branch, Lucknow', '', '20500', 'UP/45678/1234', 'probation', 'Day Shift (9:00 AM – 6:00 PM)', 'Lucknow', 'https://www.facebook.com/anjali.verma', ' https://twitter.com/anjali_verma', ' https://www.linkedin.com/in/anjaliverma', ' https://www.instagram.com/anjali.verma_', '', '', '', 'Other Document', '', 0, 1, '', '', '', 'BCPPV1234K', '4578 9621 1234', 'UP/47/015/123456', '2025-07-02 08:15:29');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (19, 'ST20250702002', 0, 8, 5, '8', 'B.Com, Chartered Accountant (CA Inter)\r\n\r\n', '7 years in hospital billing and audits', 'TDS, GST, EPF, Payroll Accounting', 'Rakesh', 'Tiwari', 'Mahendra Tiwari', 'Meera Tiwari', '+919812345670', '+919888776655', 'rakesh.tiwari@midlandhospital.in', '1990-12-06', 'Married', '2024-01-10', NULL, '21, Aliganj, Lucknow', '103, Rajendra Nagar, Lucknow', 'Excellent record in managing statutory compliance', '', '$2y$10$LCauANqwzsa6ZqDbkejRzuMCuHkR7b8nImT31SABhIDviAFglPrnq', 'Male', 'O+', 'Rakesh Tiwari', '987654321098', 'HDFC Bank', 'HDFC0001672', 'Hazratganj Branch, Lucknow', '', '60000', 'UP/89123/9999', 'permanent', 'General Shift (9:30 AM – 5:30 PM)', 'Lucknow', ' https://facebook.com/rakesh.tiwari', ' https://twitter.com/rk_tiwari', ' https://twitter.com/rk_tiwari', 'N/A', '', '', '', '', '', 0, 1, '', '', '', 'AJHPT4562M', '457812301234', 'UP/47/015/112233', '2025-07-02 09:34:14');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (20, 'ST20250702003', 0, 9, 5, '8', 'B.Pharm (AKTU)', '4 years in retail and hospital pharmacy', 'Drug Dispensation, Inventory Management', 'Neha', 'Singh', 'Dev Singh', 'Kriti Singh', ' +919911221100', '+919835667788', 'neha.singh@midlandhospital.in', '1995-01-08', 'Single', '2025-05-15', NULL, ' 78, Jankipuram, Lucknow', '45, Vikas Nagar, Lucknow', 'Registered pharmacist with PCI', '', '$2y$10$IOI/GJKy/N0RKWZTYTtiXuJk12ihH7QXX0WClxeRmV9HRzhR8zGFe', 'Female', 'A+', 'Neha Singh', '223344556677', 'ICICI Bank', 'ICIC0000452', 'Aliganj Branch, Lucknow', '', '25000', 'UP/56472/8844', 'permanent', 'Morning Shift (8:00 AM – 4:00 PM)', 'Lucknow', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', 'DPXNS2312L', '478921335678', 'UP/47/016/445566', '2025-07-02 09:57:56');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department_id`, `staff_designation_id`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `pan_number`, `identification_number`, `local_identification_number`, `created_at`) VALUES (21, ' ST20250702004', 0, 10, 6, '8', 'MD Pathology (KGMC)', '15+ years', 'Clinical Pathology, Hematology', 'Arvind', 'Trivedi', 'O P Trivedi', 'Lata Trivedi', '+919900445566', '+919875332211', 'arvind.trivedi@midlandhospital.in', '1979-10-05', 'Married', '2025-01-29', NULL, ' 16, Mahanagar Extension, Lucknow', ' 16, Mahanagar Extension, Lucknow', 'Heads diagnostic lab; NABL audits lead', '', '$2y$10$SBrYwW1Tu2Cx54AC9Pckiu/JijJS1QpeAXXsj6UGR3JSUwEFlQx8G', 'Male', 'AB+', 'Arvind Trivedi', '111122223333', 'Axis Bank', 'UTIB0000456', 'Mahanagar Branch, Lucknow', '', '85000', 'UP/34567/9988', 'permanent', 'General Shift (9:00 AM – 6:00 PM)', 'Central Path Lab – Level 2', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', '', '', 'TRVPA7771B', '478901118888', 'UP/47/018/789012', '2025-07-02 10:16:38');


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `staff_attendance_type_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(11) DEFAULT 0,
  `biometric_device_data` text DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `staff_attendance_type_id` (`staff_attendance_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `long_lang_name` varchar(250) DEFAULT NULL,
  `long_name_style` varchar(250) DEFAULT NULL,
  `for_schedule` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_type` (`type`),
  KEY `index_key_value` (`key_value`),
  KEY `index_is_active` (`is_active`),
  KEY `index_long_lang_name` (`long_lang_name`),
  KEY `index_long_name_style` (`long_name_style`),
  KEY `index_for_schedule` (`for_schedule`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', 'present', NULL, 1, '2024-08-21 09:29:55', NULL);
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', 'late', NULL, 1, '2024-08-21 09:29:55', NULL);
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', 'absent', NULL, 0, '2024-08-21 09:29:55', NULL);
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', 'half_day', NULL, 1, '2024-08-21 09:29:55', NULL);
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (5, 'Holiday', 'H', 'yes', 'holiday', NULL, 0, '2024-08-21 09:29:55', NULL);
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `long_lang_name`, `long_name_style`, `for_schedule`, `created_at`, `updated_at`) VALUES (6, 'Half Day Second Shift', '<b class=\"text text-warning\">SH</b>', 'yes', 'half_day_second_shift', 'label label-info', 1, '2024-06-08 16:35:55', NULL);


#
# TABLE STRUCTURE FOR: staff_attendence_schedules
#

DROP TABLE IF EXISTS `staff_attendence_schedules`;

CREATE TABLE `staff_attendence_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_attendence_type_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `entry_time_from` time DEFAULT NULL,
  `entry_time_to` time DEFAULT NULL,
  `total_institute_hour` time DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_attendence_type_id` (`staff_attendence_type_id`),
  KEY `index_entry_time_from` (`entry_time_from`),
  KEY `index_entry_time_to` (`entry_time_to`),
  KEY `index_total_institute_hour` (`total_institute_hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_designation` (`designation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (1, 'MBBS (Bachelor of Medicine, Bachelor of Surgery)', 'yes', '2025-07-01 13:29:58');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (2, 'DM (Doctorate of Medicine)', 'yes', '2025-07-01 13:31:15');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (3, 'MS (Master of Surgery)', 'yes', '2025-07-01 13:31:30');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (4, 'MD (Doctor of Medicine)', 'yes', '2025-07-01 13:32:14');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (5, 'Bachelors', 'yes', '2025-07-02 08:05:04');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`, `created_at`) VALUES (6, 'Masters', 'yes', '2025-07-02 10:34:12');


#
# TABLE STRUCTURE FOR: staff_id_card
#

DROP TABLE IF EXISTS `staff_id_card`;

CREATE TABLE `staff_id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `hospital_address` varchar(255) NOT NULL,
  `background` text NOT NULL,
  `logo` text NOT NULL,
  `sign_image` text NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_barcode` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_title` (`title`),
  KEY `index_hospital_name` (`hospital_name`),
  KEY `index_hospital_address` (`hospital_address`),
  KEY `index_header_color` (`header_color`),
  KEY `index_enable_staff_role` (`enable_staff_role`),
  KEY `index_enable_staff_id` (`enable_staff_id`),
  KEY `index_enable_staff_department` (`enable_staff_department`),
  KEY `index_enable_designation` (`enable_designation`),
  KEY `index_enable_name` (`enable_name`),
  KEY `index_enable_fathers_name` (`enable_fathers_name`),
  KEY `index_enable_mothers_name` (`enable_mothers_name`),
  KEY `index_enable_date_of_joining` (`enable_date_of_joining`),
  KEY `index_enable_permanent_address` (`enable_permanent_address`),
  KEY `index_enable_staff_dob` (`enable_staff_dob`),
  KEY `index_enable_staff_phone` (`enable_staff_phone`),
  KEY `index_enable_staff_barcode` (`enable_staff_barcode`),
  KEY `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff_id_card` (`id`, `title`, `hospital_name`, `hospital_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `enable_staff_barcode`, `status`, `created_at`) VALUES (1, 'Sample Staff Id Card', 'National Hospital', 'Habibganj Rd, Opp Cricket Club, E-3, Arera Colony, Bhopal', 'background.jpg', 'logo.jpg', 'signature.png', '#0e5c9f', 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, '2021-10-19 06:58:50');


#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `leave_type_id` (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (1, 18, 1, '12', '2025-07-02 08:54:45');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (2, 18, 2, '8', '2025-07-02 08:54:45');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (3, 18, 3, '10', '2025-07-02 08:54:45');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (4, 19, 1, '12', '2025-07-02 09:34:14');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (5, 19, 2, '8', '2025-07-02 09:34:14');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (6, 19, 3, '10', '2025-07-02 09:34:14');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (7, 20, 1, '10', '2025-07-02 09:57:56');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (8, 20, 2, '7', '2025-07-02 09:57:56');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (9, 20, 3, '10', '2025-07-02 09:57:56');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (10, 21, 1, '10', '2025-07-02 10:40:57');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (11, 21, 2, '7', '2025-07-02 10:40:57');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`, `created_at`) VALUES (12, 21, 3, '10', '2025-07-02 10:16:38');


#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `applied_by` int(11) DEFAULT NULL,
  `status_updated_by` int(11) DEFAULT NULL,
  `document_file` text NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `applied_by` (`applied_by`),
  KEY `index_leave_from` (`leave_from`),
  KEY `index_leave_to` (`leave_to`),
  KEY `index_leave_days` (`leave_days`),
  KEY `index_employee_remark` (`employee_remark`),
  KEY `index_admin_remark` (`admin_remark`),
  KEY `index_status` (`status`),
  KEY `index_approved_date` (`approved_date`),
  KEY `index_status_updated_by` (`status_updated_by`),
  KEY `index_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` float(10,2) NOT NULL,
  `pay_scale` int(11) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `basic` float(10,2) NOT NULL,
  `total_allowance` float(10,2) NOT NULL,
  `total_deduction` float(10,2) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` float(10,2) NOT NULL DEFAULT 0.00,
  `net_salary` float(10,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `cheque_no` varchar(250) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` text DEFAULT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `generated_by` (`generated_by`),
  KEY `index_basic` (`basic`),
  KEY `index_total_allowance` (`total_allowance`),
  KEY `index_total_deduction` (`total_deduction`),
  KEY `index_leave_deduction` (`leave_deduction`),
  KEY `index_tax` (`tax`),
  KEY `index_net_salary` (`net_salary`),
  KEY `index_status` (`status`),
  KEY `index_month` (`month`),
  KEY `index_year` (`year`),
  KEY `index_cheque_no` (`cheque_no`),
  KEY `index_cheque_date` (`cheque_date`),
  KEY `index_attachment` (`attachment`),
  KEY `index_payment_mode` (`payment_mode`),
  KEY `index_payment_date` (`payment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (1, 7, 1, 0, '2025-05-22 10:48:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (2, 3, 2, 0, '2025-06-17 17:33:53');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (3, 3, 3, 0, '2025-07-01 13:53:25');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (4, 3, 4, 0, '2025-07-01 14:03:48');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (5, 3, 5, 0, '2025-07-01 14:06:53');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (6, 3, 6, 0, '2025-07-01 14:11:11');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (7, 3, 7, 0, '2025-07-01 14:15:14');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (8, 3, 8, 0, '2025-07-01 14:16:24');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (9, 3, 9, 0, '2025-07-01 14:18:15');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (10, 3, 10, 0, '2025-07-01 14:19:11');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (11, 3, 11, 0, '2025-07-01 14:20:02');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (12, 3, 12, 0, '2025-07-01 14:30:15');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (13, 9, 13, 0, '2025-07-02 06:28:27');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (14, 9, 14, 0, '2025-07-02 06:31:14');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (15, 9, 15, 0, '2025-07-02 06:35:52');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (16, 9, 16, 0, '2025-07-02 06:37:05');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (17, 9, 17, 0, '2025-07-02 06:40:49');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (18, 8, 18, 0, '2025-07-02 08:15:29');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (19, 2, 19, 0, '2025-07-02 09:34:14');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (20, 4, 20, 0, '2025-07-02 09:57:56');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (21, 5, 21, 0, '2025-07-02 10:16:38');


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `document` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `index_title` (`title`),
  KEY `index_timeline_date` (`timeline_date`),
  KEY `index_status` (`status`),
  KEY `index_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: supplier_bill_basic
#

DROP TABLE IF EXISTS `supplier_bill_basic`;

CREATE TABLE `supplier_bill_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `total` float(10,2) NOT NULL,
  `tax` float(10,2) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `net_amount` float(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `payment_mode` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `received_by` (`received_by`),
  KEY `index_total` (`total`),
  KEY `index_tax` (`tax`),
  KEY `index_discount` (`discount`),
  KEY `index_net_amount` (`net_amount`),
  KEY `index_payment_mode` (`payment_mode`),
  KEY `index_cheque_no` (`cheque_no`),
  KEY `index_cheque_date` (`cheque_date`),
  KEY `index_payment_date` (`payment_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `supplier_bill_basic` (`id`, `invoice_no`, `date`, `supplier_id`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `received_by`, `attachment`, `attachment_name`, `payment_note`, `created_at`) VALUES (1, '', '2025-07-02 11:43:00', 1, '', '190.00', '20.00', '0.00', '210.00', '', 'Cash', NULL, NULL, '2025-07-02 06:15:39', 1, NULL, NULL, '', '2025-07-02 06:15:39');
INSERT INTO `supplier_bill_basic` (`id`, `invoice_no`, `date`, `supplier_id`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `received_by`, `attachment`, `attachment_name`, `payment_note`, `created_at`) VALUES (2, '', '2025-07-02 11:45:00', 1, '', '25.00', '1.25', '0.00', '26.25', '', 'Cash', NULL, NULL, '2025-07-02 06:17:16', 1, NULL, NULL, '', '2025-07-02 06:17:16');
INSERT INTO `supplier_bill_basic` (`id`, `invoice_no`, `date`, `supplier_id`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `received_by`, `attachment`, `attachment_name`, `payment_note`, `created_at`) VALUES (3, '', '2025-07-02 12:05:00', 1, '', '40.00', '2.00', '0.00', '42.00', '', 'Cash', NULL, NULL, '2025-07-02 06:40:58', 1, NULL, NULL, '', '2025-07-02 06:40:58');
INSERT INTO `supplier_bill_basic` (`id`, `invoice_no`, `date`, `supplier_id`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `received_by`, `attachment`, `attachment_name`, `payment_note`, `created_at`) VALUES (4, '', '2025-07-02 12:17:00', 2, '', '110.00', '13.20', '0.00', '123.20', '', 'Cash', NULL, NULL, '2025-07-02 06:50:45', 1, NULL, NULL, '', '2025-07-02 06:50:45');


#
# TABLE STRUCTURE FOR: symptoms
#

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms_title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_symptoms_title` (`symptoms_title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `symptoms` (`id`, `symptoms_title`, `description`, `type`, `created_at`) VALUES (1, 'Joint Pain', '', '6', '2025-07-01 14:03:09');
INSERT INTO `symptoms` (`id`, `symptoms_title`, `description`, `type`, `created_at`) VALUES (2, 'Abdominal Pain', '', '5', '2025-07-01 14:03:26');
INSERT INTO `symptoms` (`id`, `symptoms_title`, `description`, `type`, `created_at`) VALUES (3, 'Fever', '', '2', '2025-07-01 14:04:05');
INSERT INTO `symptoms` (`id`, `symptoms_title`, `description`, `type`, `created_at`) VALUES (4, 'Chest Pain', '', '3', '2025-07-01 14:04:23');
INSERT INTO `symptoms` (`id`, `symptoms_title`, `description`, `type`, `created_at`) VALUES (5, 'Shortness of Breath', '', '4', '2025-07-01 14:04:52');


#
# TABLE STRUCTURE FOR: symptoms_classification
#

DROP TABLE IF EXISTS `symptoms_classification`;

CREATE TABLE `symptoms_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_symptoms_type` (`symptoms_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (1, 'Neurological', '2025-07-01 14:02:46');
INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (2, 'General', '2025-07-01 14:02:46');
INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (3, 'Cardiovascular', '2025-07-01 14:02:46');
INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (4, 'Respiratory', '2025-07-01 14:02:46');
INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (5, 'Gastrointestinal', '2025-07-01 14:02:46');
INSERT INTO `symptoms_classification` (`id`, `symptoms_type`, `created_at`) VALUES (6, 'Musculoskeletal', '2025-07-01 14:02:46');


#
# TABLE STRUCTURE FOR: system_notification
#

DROP TABLE IF EXISTS `system_notification`;

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `notification_desc` text DEFAULT NULL,
  `notification_for` varchar(50) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_notification_title` (`notification_title`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (1, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Bikash Khan (3) with doctor: Bimal Kundu (D001). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 7, 1, '2025-06-17 19:50:10', 'yes', '2025-06-17 19:50:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (2, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Bikash Khan (3) with doctor: Bimal Kundu (D001). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 3, 2, '2025-06-17 19:50:10', 'yes', '2025-06-17 19:50:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (3, 'New OPD Visit Created', 'opd', 'Dear: Bikash Khan (3) your OPD visit has been created.  Your Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}}. ', '', NULL, 3, '2025-06-17 19:50:10', 'yes', '2025-06-17 19:50:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (4, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Paracetamol 500mg , \r\nMedicine Category  Analgesic ,\r\nMedicine Company  1 ,\r\nMedicine Composition  Paracetamol IP 500 mg ,\r\nMedicine Group {{medicine_group}} , \r\nUnit 1 ,\r\nPacking  10 Tablets per strip ,', '', 7, 1, '2025-07-01 13:36:27', 'yes', '2025-07-01 13:36:27');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (5, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Azithromycin 250mg , \r\nMedicine Category  Antibiotic ,\r\nMedicine Company  2 ,\r\nMedicine Composition  Azithromycin Dihydrate equivalent to Azithromycin 250mg ,\r\nMedicine Group 1 , \r\nUnit 1 ,\r\nPacking  6 Tablets per strip ,', '', 7, 1, '2025-07-01 13:39:25', 'yes', '2025-07-01 13:39:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (6, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Cetirizine 10mg , \r\nMedicine Category  Antihistamine ,\r\nMedicine Company  1 ,\r\nMedicine Composition  Cetirizine Hydrochloride IP 10mg ,\r\nMedicine Group {{medicine_group}} , \r\nUnit 1 ,\r\nPacking  10 Tablets per strip ,', '', 7, 1, '2025-07-01 13:41:53', 'yes', '2025-07-01 13:41:53');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (7, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Metformin 500mg , \r\nMedicine Category  	Antidiabetic ,\r\nMedicine Company  3 ,\r\nMedicine Composition  Metformin Hydrochloride IP 500mg ,\r\nMedicine Group {{medicine_group}} , \r\nUnit 1 ,\r\nPacking  15 Tablets per strip ,', '', 7, 1, '2025-07-01 13:48:22', 'yes', '2025-07-01 13:48:22');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (8, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Foracort Inhaler 200 , \r\nMedicine Category  Respiratory ,\r\nMedicine Company  1 ,\r\nMedicine Composition  Budesonide 200mcg + Formoterol Fumarate 6mcg ,\r\nMedicine Group {{medicine_group}} , \r\nUnit 29 ,\r\nPacking  1 Inhaler ,', '', 7, 1, '2025-07-01 13:53:21', 'yes', '2025-07-01 13:53:21');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (9, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Kunal Sen (4) with Doctor: Sandeep Sharma (D004). Patient Symptoms Details are Abdominal Pain\r\n.', '', 7, 1, '2025-07-01 14:10:46', 'yes', '2025-07-01 14:10:46');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (10, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Kunal Sen (4) with Doctor: Sandeep Sharma (D004). Patient Symptoms Details are Abdominal Pain\r\n.', '', 3, 5, '2025-07-01 14:10:46', 'yes', '2025-07-01 14:10:46');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (11, 'New IPD Visit Created', 'ipd', 'Dear Kunal Sen (4) your IPD visit has been created .', '', NULL, 4, '2025-07-01 14:10:46', 'yes', '2025-07-01 14:10:46');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (12, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Abisekh Roy (5) with Doctor: Priya Sharma (D002). Patient Symptoms Details are Fever\r\n.', '', 7, 1, '2025-07-01 14:13:49', 'yes', '2025-07-01 14:13:49');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (13, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Abisekh Roy (5) with Doctor: Priya Sharma (D002). Patient Symptoms Details are Fever\r\n.', '', 3, 3, '2025-07-01 14:13:49', 'yes', '2025-07-01 14:13:49');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (14, 'New IPD Visit Created', 'ipd', 'Dear Abisekh Roy (5) your IPD visit has been created .', '', NULL, 5, '2025-07-01 14:13:49', 'yes', '2025-07-01 14:13:49');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (15, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Ram Sharma (8) with doctor: Amitabh Kulkarni (D007). Patient Symptoms Details are Fever\r\n and any known allergies: {{any_known_allergies}} .', '', 7, 1, '2025-07-02 04:58:25', 'yes', '2025-07-02 04:58:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (16, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Ram Sharma (8) with doctor: Amitabh Kulkarni (D007). Patient Symptoms Details are Fever\r\n and any known allergies: {{any_known_allergies}} .', '', 3, 8, '2025-07-02 04:58:25', 'yes', '2025-07-02 04:58:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (17, 'New OPD Visit Created', 'opd', 'Dear: Ram Sharma (8) your OPD visit has been created.  Your Symptoms Details are Fever\r\n and any known allergies: {{any_known_allergies}}. ', '', NULL, 8, '2025-07-02 04:58:25', 'yes', '2025-07-02 04:58:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (18, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Shyam Verma (9) with doctor: Naveen Reddy (D008). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 7, 1, '2025-07-02 05:02:27', 'yes', '2025-07-02 05:02:27');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (19, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Shyam Verma (9) with doctor: Naveen Reddy (D008). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 3, 9, '2025-07-02 05:02:27', 'yes', '2025-07-02 05:02:27');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (20, 'New OPD Visit Created', 'opd', 'Dear: Shyam Verma (9) your OPD visit has been created.  Your Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}}. ', '', NULL, 9, '2025-07-02 05:02:27', 'yes', '2025-07-02 05:02:27');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (21, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Riya Roy (10) with doctor: Naveen Reddy (D008). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 7, 1, '2025-07-02 05:04:04', 'yes', '2025-07-02 05:04:04');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (22, 'New OPD Visit Created', 'opd', 'OPD Visit has been created for patient: Riya Roy (10) with doctor: Naveen Reddy (D008). Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', '', 3, 9, '2025-07-02 05:04:04', 'yes', '2025-07-02 05:04:04');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (23, 'New OPD Visit Created', 'opd', 'Dear: Riya Roy (10) your OPD visit has been created.  Your Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}}. ', '', NULL, 10, '2025-07-02 05:04:04', 'yes', '2025-07-02 05:04:04');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (24, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Sunita Thakur (11) with Doctor: Swati Das (D005). Patient Symptoms Details are Abdominal Pain\r\n.', '', 7, 1, '2025-07-02 06:11:40', 'yes', '2025-07-02 06:11:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (25, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Sunita Thakur (11) with Doctor: Swati Das (D005). Patient Symptoms Details are Abdominal Pain\r\n.', '', 3, 6, '2025-07-02 06:11:40', 'yes', '2025-07-02 06:11:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (26, 'New IPD Visit Created', 'ipd', 'Dear Sunita Thakur (11) your IPD visit has been created .', '', NULL, 11, '2025-07-02 06:11:40', 'yes', '2025-07-02 06:11:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (27, 'Purchase Medicine', 'pharmacy', 'Purchase Medicine Details :\r\nSupplier Name: Arjun \r\nMedicine Details: Azithromycin 250mg (AZT250B2306),Paracetamol 500mg (PCM500MAR25)\r\nPurchase Date: 2025-07-02 11:43:00\r\nInvoice Number:  {{invoice_number}}\r\nTotal: 190.00\r\nDiscount: 0.00 \r\nTax: 20.00\r\nNet Amount: 210.00', '', 7, 1, '2025-07-02 06:15:39', 'yes', '2025-07-02 06:15:39');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (28, 'Purchase Medicine', 'pharmacy', 'Purchase Medicine Details :\r\nSupplier Name: Arjun \r\nMedicine Details: Cetirizine 10mg (CTZ10JAN26)\r\nPurchase Date: 2025-07-02 11:45:00\r\nInvoice Number:  {{invoice_number}}\r\nTotal: 25.00\r\nDiscount: 0.00 \r\nTax: 1.25\r\nNet Amount: 26.25', '', 7, 1, '2025-07-02 06:17:16', 'yes', '2025-07-02 06:17:16');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (29, 'Purchase Medicine', 'pharmacy', 'Purchase Medicine Details :\r\nSupplier Name: Arjun \r\nMedicine Details: Metformin 500mg (MET500DEC25)\r\nPurchase Date: 2025-07-02 12:05:00\r\nInvoice Number:  {{invoice_number}}\r\nTotal: 40.00\r\nDiscount: 0.00 \r\nTax: 2.00\r\nNet Amount: 42.00', '', 7, 1, '2025-07-02 06:40:58', 'yes', '2025-07-02 06:40:58');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (30, 'Purchase Medicine', 'pharmacy', 'Purchase Medicine Details :\r\nSupplier Name: HealthCare Pharma Supply \r\nMedicine Details: Foracort Inhaler 200 (FRT200SEP25)\r\nPurchase Date: 2025-07-02 12:17:00\r\nInvoice Number:  {{invoice_number}}\r\nTotal: 110.00\r\nDiscount: 0.00 \r\nTax: 13.20\r\nNet Amount: 123.20', '', 7, 1, '2025-07-02 06:50:45', 'yes', '2025-07-02 06:50:45');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (31, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Betadine Solution , \r\nMedicine Category  Antiseptic ,\r\nMedicine Company  7 ,\r\nMedicine Composition  Povidone Iodine Solution 10% ,\r\nMedicine Group {{medicine_group}} , \r\nUnit 2 ,\r\nPacking  	100 ml bottle ,', '', 7, 1, '2025-07-02 07:04:19', 'yes', '2025-07-02 07:04:19');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (32, 'Add Medicine', 'pharmacy', 'New Add Medicine Details: \r\n\r\nMedicine Name  Calpol 650 , \r\nMedicine Category  Antipyretic ,\r\nMedicine Company  6 ,\r\nMedicine Composition  Paracetamol IP 650 mg ,\r\nMedicine Group 6 , \r\nUnit 1 ,\r\nPacking  15 ,', '', 7, 1, '2025-07-02 07:07:33', 'yes', '2025-07-02 07:07:33');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (33, 'Add IPD Medication Dose', 'ipd', 'Doctor Swati Das (D005)  has given medicine Paracetamol 500mg Category is Analgesic Dosage 1–2 tablets Tablet to Patient:  Sunita Thakur 11 at 07/02/2025  01:00 PM.', '', 7, 1, '2025-07-02 07:28:51', 'yes', '2025-07-02 07:28:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (34, 'Add IPD Medication Dose', 'ipd', 'Doctor Swati Das (D005)  has given medicine Paracetamol 500mg Category is Analgesic Dosage 1–2 tablets Tablet to Patient:  Sunita Thakur 11 at 07/02/2025  01:00 PM.', '', 3, 6, '2025-07-02 07:28:51', 'yes', '2025-07-02 07:28:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (35, 'Add IPD Medication Dose', 'ipd', 'Doctor Swati Das (D005)  has given medicine Paracetamol 500mg Category is Analgesic Dosage 1–2 tablets Tablet to Patient:  Sunita Thakur 11 at 07/02/2025  01:00 PM.', '', 3, 6, '2025-07-02 07:28:51', 'yes', '2025-07-02 07:28:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (36, 'Add IPD Medication Dose', 'ipd', 'Dear Sunita Thakur (11) IPD Number IPDN3 you have been given the Paracetamol 500mg dose 1–2 tablets Tablet of medicine at 07/02/2025  01:00 PM.', '', NULL, 11, '2025-07-02 07:28:51', 'yes', '2025-07-02 07:28:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (37, 'New Appointment Created', 'appointment', 'Appointment has been created for Patient: Ram Sharma (8). Appointment Date: 07/07/2025 11:00 AM  With Doctor Name: Anjali Rao (D011).', '', 7, 1, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (38, 'New Appointment Created', 'appointment', 'Appointment has been created for Patient: Ram Sharma (8). Appointment Date: 07/07/2025 11:00 AM  With Doctor Name: Anjali Rao (D011).', '', 3, 12, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (39, 'New Appointment Created', 'appointment', 'Dear Ram Sharma (8) your appointment has been created with Doctor: Anjali Rao (D011).', '', NULL, 8, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (40, 'Appointment Status', 'appointment', 'Patient: Ram Sharma (8) appointment status is approved with Doctor:  Anjali Rao (D011) Date: 07/07/2025 11:00 AM.', '', 7, 1, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (41, 'Appointment Status', 'appointment', 'Patient: Ram Sharma (8) appointment status is approved with Doctor:  Anjali Rao (D011) Date: 07/07/2025 11:00 AM.', '', 3, 12, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (42, 'Appointment Status', 'appointment', 'Dear Ram Sharma (8) your appointment status is approved Date: 07/07/2025 11:00 AM with Doctor Anjali Rao (D011).', '', NULL, 8, '2025-07-02 08:51:24', 'yes', '2025-07-02 08:51:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (43, 'New Appointment Created', 'appointment', 'Appointment has been created for Patient: Virat Kohli (13). Appointment Date: 07/02/2025 07:30 PM  With Doctor Name: Anjali Rao (D011).', '', 7, 1, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (44, 'New Appointment Created', 'appointment', 'Appointment has been created for Patient: Virat Kohli (13). Appointment Date: 07/02/2025 07:30 PM  With Doctor Name: Anjali Rao (D011).', '', 3, 12, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (45, 'New Appointment Created', 'appointment', 'Dear Virat Kohli (13) your appointment has been created with Doctor: Anjali Rao (D011).', '', NULL, 13, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (46, 'Appointment Status', 'appointment', 'Patient: Virat Kohli (13) appointment status is approved with Doctor:  Anjali Rao (D011) Date: 07/02/2025 07:30 PM.', '', 7, 1, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (47, 'Appointment Status', 'appointment', 'Patient: Virat Kohli (13) appointment status is approved with Doctor:  Anjali Rao (D011) Date: 07/02/2025 07:30 PM.', '', 3, 12, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (48, 'Appointment Status', 'appointment', 'Dear Virat Kohli (13) your appointment status is approved Date: 07/02/2025 07:30 PM with Doctor Anjali Rao (D011).', '', NULL, 13, '2025-07-02 09:01:40', 'yes', '2025-07-02 09:01:40');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (49, 'Add Bag Stock', 'blood_bank', 'New Add Bag Stock Details- Donor Name: Sneha Gupta, Blood Group: (B+) and contact number +91-9900112233 . Donate bag details blood bag number (BGN0725201) and charge Blood Bank Charges donated date 02/20/7. Total amount 400 discount {{discount}} tax 0.00 so total net amount is 400.', '', 7, 1, '2025-07-02 09:22:23', 'yes', '2025-07-02 09:22:23');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (50, 'Add IPD Patient Charge', 'ipd', 'Add Charge for IPD Patient Name : Kunal Sen (4) IPD Number (IPDN1) has applied charge IPD, category  IPD Doctor Fees, and Name IPD Doctor Fees total quantity 1 . Now total net amount 800 date 07/01/2025 02:56 PM.', '', 7, 1, '2025-07-02 09:26:18', 'yes', '2025-07-02 09:26:18');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (51, 'Add IPD Patient Charge', 'ipd', 'Add Charge for IPD Patient Name : Kunal Sen (4) IPD Number (IPDN1) has applied charge IPD, category  IPD Doctor Fees, and Name IPD Doctor Fees total quantity 1 . Now total net amount 800 date 07/01/2025 02:56 PM.', '', 3, 5, '2025-07-02 09:26:18', 'yes', '2025-07-02 09:26:18');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (52, 'Add IPD Patient Charge', 'ipd', 'Dear Kunal Sen (4) IPD Number IPDN1 you have applied charge name is IPD, category IPD Doctor Fees ,charge name IPD Doctor Fees  and total quantity 1 now your net amount 800 and date 07/01/2025 02:56 PM.', '', NULL, 4, '2025-07-02 09:26:18', 'yes', '2025-07-02 09:26:18');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (53, 'Blood Issue', 'blood_bank', 'Blood issue for Bill Number BLBB1 Patient: Kunal Sen (4) Case Id {{case_id}} . Patient blood group is B+ and bag number (BGN0725201 (450 ml Each)) issue on 07/02/2025 02:59 PM, reference by Sandeep Sharma (D004). Applied charge name is Blood Bank Charges and total amount 700, discount {{discount}}, tax 0.00, now total net amount700.00.', '', 7, 1, '2025-07-02 09:29:58', 'yes', '2025-07-02 09:29:58');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (54, 'Blood Issue', 'blood_bank', 'Dear Kunal Sen (4) case id: {{case_id}} your bill number BLBB1 blood group B+ bag number is BGN0725201 (450 ml Each) charge name  Blood Bank Charges issue on 07/02/2025 02:59 PM reference by Sandeep Sharma (D004) .Total amount 700, discount {{discount}}, tax 0.00 now your total net amount 700.00.', '', 0, 4, '2025-07-02 09:29:58', 'yes', '2025-07-02 09:29:58');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (55, 'Pharmacy Generate Bill', 'pharmacy', 'Pharmacy Bill Generated for Patient: Kunal Sen (4) Case ID: {{case_id}}.\r\n\r\nPharmacy Bill Details-\r\nTotal Amount: 22.00\r\nNet Amount: 24.32\r\nDiscount: {discount}} \r\nTax: 2.33\r\nPaid Amount  $ 24.32\r\nDue Amount  $ 0.00', '', 7, 1, '2025-07-02 09:31:12', 'yes', '2025-07-02 09:31:12');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (56, 'Pharmacy Generate Bill', 'pharmacy', 'Dear Kunal Sen 4 your pharmacy bill is generated. \r\n\r\nBill Details-\r\nTotal Amount: 22.00\r\nNet Amount: 24.32\r\nDiscount: 0.00\r\nTax: 2.33\r\nPaid Amount: 24.32\r\nDue Amount: 0.00', '', NULL, 4, '2025-07-02 09:31:12', 'yes', '2025-07-02 09:31:12');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (57, 'Pathology Investigation', 'pathology', 'Pathology Test Report for Patient: Sunita Thakur (11) case id: {{case_id}}. Pathology test assign by Anjali Rao (D011). pathology charge- total amount 0.00, discount 0.00 ,tax 0.00  net amount is 0.00 and total paid amount 0.00.', '', 7, 1, '2025-07-02 09:31:44', 'yes', '2025-07-02 09:31:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (58, 'Pathology Investigation', 'pathology', 'Pathology Test Report for Patient: Sunita Thakur (11) case id: {{case_id}}. Pathology test assign by Anjali Rao (D011). pathology charge- total amount 0.00, discount 0.00 ,tax 0.00  net amount is 0.00 and total paid amount 0.00.', '', 3, 12, '2025-07-02 09:31:44', 'yes', '2025-07-02 09:31:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (59, 'Pathology Investigation', 'pathology', 'Dear Sunita Thakur (11) case id: {{case_id}}. Your pathology test bill number is PATB1 and total amount 0.00, tax 0.00, discount 0.00 so now your net amount is 0.00.  You have paid your total amount 0.00.', '', NULL, 11, '2025-07-02 09:31:44', 'yes', '2025-07-02 09:31:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (60, 'Pharmacy Generate Bill', 'pharmacy', 'Pharmacy Bill Generated for Patient: Bikash Khan (6) Case ID: {{case_id}}.\r\n\r\nPharmacy Bill Details-\r\nTotal Amount: 25.05\r\nNet Amount: 27.77\r\nDiscount: {discount}} \r\nTax: 2.72\r\nPaid Amount  $ 27.77\r\nDue Amount  $ 0.00', '', 7, 1, '2025-07-02 09:37:01', 'yes', '2025-07-02 09:37:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (61, 'Pharmacy Generate Bill', 'pharmacy', 'Dear Bikash Khan 6 your pharmacy bill is generated. \r\n\r\nBill Details-\r\nTotal Amount: 25.05\r\nNet Amount: 27.77\r\nDiscount: 0.00\r\nTax: 2.72\r\nPaid Amount: 27.77\r\nDue Amount: 0.00', '', NULL, 6, '2025-07-02 09:37:01', 'yes', '2025-07-02 09:37:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (62, 'Add Bag Stock', 'blood_bank', 'New Add Bag Stock Details- Donor Name: Jamuna Sen, Blood Group: (O+) and contact number 7890123568 . Donate bag details blood bag number (BGN0725202) and charge Blood Bank Charges donated date 02/20/7. Total amount 400 discount {{discount}} tax 0.00 so total net amount is 400.', '', 7, 1, '2025-07-02 09:42:11', 'yes', '2025-07-02 09:42:11');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (63, 'Add Bag Stock', 'blood_bank', 'New Add Bag Stock Details- Donor Name: Arjun Mehra	, Blood Group: (A+) and contact number +91-9812345670 . Donate bag details blood bag number (BGN0725203) and charge Blood Bank Charges donated date 02/20/7. Total amount 400 discount {{discount}} tax 0.00 so total net amount is 400.', '', 7, 1, '2025-07-02 09:54:09', 'yes', '2025-07-02 09:54:09');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (64, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', 7, 1, '2025-07-02 10:02:51', 'yes', '2025-07-02 10:02:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (65, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', NULL, 4, '2025-07-02 10:02:51', 'yes', '2025-07-02 10:02:51');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (66, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', 7, 1, '2025-07-02 10:03:35', 'yes', '2025-07-02 10:03:35');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (67, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', NULL, 4, '2025-07-02 10:03:35', 'yes', '2025-07-02 10:03:35');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (68, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', 7, 1, '2025-07-02 10:39:16', 'yes', '2025-07-02 10:39:16');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (69, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', NULL, 4, '2025-07-02 10:39:16', 'yes', '2025-07-02 10:39:16');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (70, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', 7, 1, '2025-07-02 10:44:13', 'yes', '2025-07-02 10:44:13');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (71, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   800.00', '', NULL, 4, '2025-07-02 10:44:13', 'yes', '2025-07-02 10:44:13');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (72, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Raima Sen (15) with Doctor: Amitabh Kulkarni (D007). Patient Symptoms Details are {{symptoms_description}}.', '', 7, 1, '2025-07-02 10:47:34', 'yes', '2025-07-02 10:47:34');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (73, 'New IPD Visit Created', 'ipd', 'IPD Visit has been created for Raima Sen (15) with Doctor: Amitabh Kulkarni (D007). Patient Symptoms Details are {{symptoms_description}}.', '', 3, 8, '2025-07-02 10:47:34', 'yes', '2025-07-02 10:47:34');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (74, 'New IPD Visit Created', 'ipd', 'Dear Raima Sen (15) your IPD visit has been created .', '', NULL, 15, '2025-07-02 10:47:34', 'yes', '2025-07-02 10:47:34');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (75, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   800.00\r\nDue Amount   0.00', '', 7, 1, '2025-07-02 10:48:25', 'yes', '2025-07-02 10:48:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (76, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   800.00\r\nDue Amount   0.00', '', NULL, 4, '2025-07-02 10:48:25', 'yes', '2025-07-02 10:48:25');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (77, 'New IPD Nurse Note', 'ipd', 'Add New Nurse Note for IPD Number: (IPDN4) Patient: Raima Sen (15) Case ID: 10 with consultant doctor  Amitabh Kulkarni (D007). \r\n\r\nNurse Note Details:\r\n(1) Nurse Name: Sharma (16)\r\n(2) Note: Patient returned to ward post-appendectomy. Vital signs stable (BP: 120/78, HR: 78 bpm).  \r\nDressing dry and intact. No complaints of pain at this time.  \r\nUrine output adequate. NPO maintained.\r\n(3) Comment: Will monitor vitals every 2 hours. Informed physician on duty.', '', 7, 1, '2025-07-02 10:52:33', 'yes', '2025-07-02 10:52:33');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (78, 'New IPD Nurse Note', 'ipd', 'Add New Nurse Note for IPD Number: (IPDN4) Patient: Raima Sen (15) Case ID: 10 with consultant doctor  Amitabh Kulkarni (D007). \r\n\r\nNurse Note Details:\r\n(1) Nurse Name: Sharma (16)\r\n(2) Note: Patient returned to ward post-appendectomy. Vital signs stable (BP: 120/78, HR: 78 bpm).  \r\nDressing dry and intact. No complaints of pain at this time.  \r\nUrine output adequate. NPO maintained.\r\n(3) Comment: Will monitor vitals every 2 hours. Informed physician on duty.', '', 3, 8, '2025-07-02 10:52:33', 'yes', '2025-07-02 10:52:33');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (79, 'New IPD Nurse Note', 'ipd', 'Dear Raima Sen (15) IPD Number: (IPDN4) and Case ID: 10 your consultant doctor is Amitabh Kulkarni (D007). \r\n\r\nNurse Note Details:\r\n(1) Nurse Name: Sharma (16)\r\n(2) Note: Patient returned to ward post-appendectomy. Vital signs stable (BP: 120/78, HR: 78 bpm).  \r\nDressing dry and intact. No complaints of pain at this time.  \r\nUrine output adequate. NPO maintained.\r\n(3) Comment: Will monitor vitals every 2 hours. Informed physician on duty.', '', NULL, 15, '2025-07-02 10:52:33', 'yes', '2025-07-02 10:52:33');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (80, 'Add IPD Medication Dose', 'ipd', 'Doctor Amitabh Kulkarni (D007)  has given medicine Azithromycin 250mg Category is Antibiotic Dosage 1 tablet Tablet to Patient:  Raima Sen 15 at 07/02/2025  04:22 PM.', '', 7, 1, '2025-07-02 10:53:09', 'yes', '2025-07-02 10:53:09');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (81, 'Add IPD Medication Dose', 'ipd', 'Doctor Amitabh Kulkarni (D007)  has given medicine Azithromycin 250mg Category is Antibiotic Dosage 1 tablet Tablet to Patient:  Raima Sen 15 at 07/02/2025  04:22 PM.', '', 3, 8, '2025-07-02 10:53:09', 'yes', '2025-07-02 10:53:09');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (82, 'Add IPD Medication Dose', 'ipd', 'Doctor Amitabh Kulkarni (D007)  has given medicine Azithromycin 250mg Category is Antibiotic Dosage 1 tablet Tablet to Patient:  Raima Sen 15 at 07/02/2025  04:22 PM.', '', 3, 8, '2025-07-02 10:53:09', 'yes', '2025-07-02 10:53:09');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (83, 'Add IPD Medication Dose', 'ipd', 'Dear Raima Sen (15) IPD Number IPDN4 you have been given the Azithromycin 250mg dose 1 tablet Tablet of medicine at 07/02/2025  04:22 PM.', '', NULL, 15, '2025-07-02 10:53:09', 'yes', '2025-07-02 10:53:09');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (84, 'Add IPD Generate Bill', 'ipd', 'Generated bill for IPD Number IPDN1  Patient Name Kunal Sen 4 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   800.00\r\nDue Amount   0.00', '', 7, 1, '2025-07-02 10:53:10', 'yes', '2025-07-02 10:53:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (85, 'Add IPD Generate Bill', 'ipd', 'Dear Kunal Sen 4  your IPD bill is generated for Case Id 2 .\r\n\r\nBill Details\r\nTotal Amount 800.00\r\nNet Amount 800.00\r\nTax  {{tax}}\r\nPaid Amount   800.00\r\nDue Amount   0.00', '', NULL, 4, '2025-07-02 10:53:10', 'yes', '2025-07-02 10:53:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (86, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP1) for IPD (IPDN1) prescribe by: Sandeep Sharma (D004). \r\n\r\nPrescription  Details-\r\nFinding Description: {{finding_description}}\r\nMedicine Name: {{medicine}}\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: Complete Blood Count (CBC)\r\nSandeep Sharma (D004)', '', 7, 1, '2025-07-02 10:56:01', 'yes', '2025-07-02 10:56:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (87, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP1) for IPD (IPDN1) prescribe by: Sandeep Sharma (D004). \r\n\r\nPrescription  Details-\r\nFinding Description: {{finding_description}}\r\nMedicine Name: {{medicine}}\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: Complete Blood Count (CBC)\r\nSandeep Sharma (D004)', '', 3, 5, '2025-07-02 10:56:01', 'yes', '2025-07-02 10:56:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (88, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP1) for IPD (IPDN1) prescribe by: Sandeep Sharma (D004). \r\n\r\nPrescription  Details-\r\nFinding Description: {{finding_description}}\r\nMedicine Name: {{medicine}}\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: Complete Blood Count (CBC)\r\nSandeep Sharma (D004)', '', 7, 1, '2025-07-02 10:56:01', 'yes', '2025-07-02 10:56:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (89, 'Notification IPD Prescription Created', 'ipd', 'Dear Kunal Sen 4 your IPD prescription number IPDP1 is prescribe by: Sandeep Sharma (D004). \r\n\r\nPrescription  Details-\r\n Finding Description: {{finding_description}}\r\n Medicine Name : {{medicine}}\r\n Radiology Test: {{radilogy_test}}\r\n Pathology Test: Complete Blood Count (CBC)', '', NULL, 4, '2025-07-02 10:56:01', 'yes', '2025-07-02 10:56:01');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (90, 'Pathology Investigation', 'pathology', 'Pathology Test Report for Patient: Kunal Sen (4) case id: 2. Pathology test assign by Amitabh Kulkarni (D007). pathology charge- total amount 500.00, discount 0.00 ,tax 0.00  net amount is 500.00 and total paid amount 500.00.', '', 7, 1, '2025-07-02 10:57:41', 'yes', '2025-07-02 10:57:41');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (91, 'Pathology Investigation', 'pathology', 'Pathology Test Report for Patient: Kunal Sen (4) case id: 2. Pathology test assign by Amitabh Kulkarni (D007). pathology charge- total amount 500.00, discount 0.00 ,tax 0.00  net amount is 500.00 and total paid amount 500.00.', '', 3, 8, '2025-07-02 10:57:41', 'yes', '2025-07-02 10:57:41');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (92, 'Pathology Investigation', 'pathology', 'Dear Kunal Sen (4) case id: 2. Your pathology test bill number is PATB2 and total amount 500.00, tax 0.00, discount 0.00 so now your net amount is 500.00.  You have paid your total amount 500.00.', '', NULL, 4, '2025-07-02 10:57:41', 'yes', '2025-07-02 10:57:41');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (93, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n\r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 10:58:55', 'yes', '2025-07-02 10:58:55');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (94, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n\r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 8, '2025-07-02 10:58:55', 'yes', '2025-07-02 10:58:55');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (95, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n\r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 10:58:55', 'yes', '2025-07-02 10:58:55');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (96, 'Notification IPD Prescription Created', 'ipd', 'Dear Raima Sen 15 your IPD prescription number IPDP2 is prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\n Finding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n\r\n Medicine Name : Azithromycin 250mg,Paracetamol 500mg\r\n Radiology Test: {{radilogy_test}}\r\n Pathology Test: {{pathology_test}}', '', NULL, 15, '2025-07-02 10:58:55', 'yes', '2025-07-02 10:58:55');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (97, 'Add Consultant Register', 'ipd', 'New Consultant Register: {doctor_name}} has been added  some instructions: Continue prescribed medication for 5 more days. Review CBC and LFT reports on next visit. Patient advised to maintain hydration and take adequate rest. Follow-up after 7 days or earlier if symptoms worsen. on date 07/02/2025 for the patients Raima Sen (15) of IPD IPDN4.', '', 7, 1, '2025-07-02 10:59:48', 'yes', '2025-07-02 10:59:48');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (98, 'Add Consultant Register', 'ipd', 'New Consultant Register: {doctor_name}} has been added  some instructions: Continue prescribed medication for 5 more days. Review CBC and LFT reports on next visit. Patient advised to maintain hydration and take adequate rest. Follow-up after 7 days or earlier if symptoms worsen. on date 07/02/2025 for the patients Raima Sen (15) of IPD IPDN4.', '', 3, 11, '2025-07-02 10:59:48', 'yes', '2025-07-02 10:59:48');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (99, 'Add Consultant Register', 'ipd', 'New Consultant Register: {doctor_name}} has been added  some instructions: Continue prescribed medication for 5 more days. Review CBC and LFT reports on next visit. Patient advised to maintain hydration and take adequate rest. Follow-up after 7 days or earlier if symptoms worsen. on date 07/02/2025 for the patients Raima Sen (15) of IPD IPDN4.', '', 3, 8, '2025-07-02 10:59:48', 'yes', '2025-07-02 10:59:48');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (100, 'Add Consultant Register', 'ipd', 'Dear Raima Sen (15) IPD Number: (IPDN4). Consultant: Anirban Ghosh (D010) has added some instructions: Continue prescribed medication for 5 more days. Review CBC and LFT reports on next visit. Patient advised to maintain hydration and take adequate rest. Follow-up after 7 days or earlier if symptoms worsen. on applied date 07/02/2025.', '', NULL, 15, '2025-07-02 10:59:48', 'yes', '2025-07-02 10:59:48');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (101, 'Add IPD Patient Charge', 'ipd', 'Add Charge for IPD Patient Name : Raima Sen (15) IPD Number (IPDN4) has applied charge IPD, category  IPD Doctor Fees, and Name IPD Doctor Fees total quantity 1 . Now total net amount 800 date 07/02/2025 04:30 PM.', '', 7, 1, '2025-07-02 11:01:24', 'yes', '2025-07-02 11:01:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (102, 'Add IPD Patient Charge', 'ipd', 'Add Charge for IPD Patient Name : Raima Sen (15) IPD Number (IPDN4) has applied charge IPD, category  IPD Doctor Fees, and Name IPD Doctor Fees total quantity 1 . Now total net amount 800 date 07/02/2025 04:30 PM.', '', 3, 8, '2025-07-02 11:01:24', 'yes', '2025-07-02 11:01:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (103, 'Add IPD Patient Charge', 'ipd', 'Dear Raima Sen (15) IPD Number IPDN4 you have applied charge name is IPD, category IPD Doctor Fees ,charge name IPD Doctor Fees  and total quantity 1 now your net amount 800 and date 07/02/2025 04:30 PM.', '', NULL, 15, '2025-07-02 11:01:24', 'yes', '2025-07-02 11:01:24');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (104, 'Add IPD Payment', 'ipd', 'Payment has been received from Patient Name: Raima Sen (15) IPD NO: IPDN4 transaction id: TRID16 payment date: 07/04/2025 04:32 PM payment amount: 800.00 payment mode: Cash.', '', 7, 1, '2025-07-02 11:02:44', 'yes', '2025-07-02 11:02:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (105, 'Add IPD Payment', 'ipd', 'Payment has been received from Patient Name: Raima Sen (15) IPD NO: IPDN4 transaction id: TRID16 payment date: 07/04/2025 04:32 PM payment amount: 800.00 payment mode: Cash.', '', 3, 8, '2025-07-02 11:02:44', 'yes', '2025-07-02 11:02:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (106, 'Add IPD Payment', 'ipd', 'Dear Raima Sen (15) IPD: IPDN4 we have received your payment amount (800.00) transaction id: TRID16 payment date: 07/04/2025 04:32 PM payment mode: Cash .', '', NULL, 15, '2025-07-02 11:02:44', 'yes', '2025-07-02 11:02:44');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (107, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: Abdominal Ultrasound (Abdominal Ultrasound)\r\nPathology Test: Urine Routine & Microscopy (URM)\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 11:03:10', 'yes', '2025-07-02 11:03:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (108, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: Abdominal Ultrasound (Abdominal Ultrasound)\r\nPathology Test: Urine Routine & Microscopy (URM)\r\nAmitabh Kulkarni (D007)', '', 3, 8, '2025-07-02 11:03:10', 'yes', '2025-07-02 11:03:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (109, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: Abdominal Ultrasound (Abdominal Ultrasound)\r\nPathology Test: Urine Routine & Microscopy (URM)\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 11:03:10', 'yes', '2025-07-02 11:03:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (110, 'Notification IPD Prescription Created', 'ipd', 'Dear Raima Sen 15 your IPD prescription number IPDP2 is prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\n Finding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n \r\n Medicine Name : Azithromycin 250mg,Paracetamol 500mg\r\n Radiology Test: Abdominal Ultrasound (Abdominal Ultrasound)\r\n Pathology Test: Urine Routine & Microscopy (URM)', '', NULL, 15, '2025-07-02 11:03:10', 'yes', '2025-07-02 11:03:10');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (111, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (112, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 8, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (113, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 2, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (114, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 3, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (115, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 4, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (116, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 5, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (117, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 6, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (118, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 7, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (119, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 8, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (120, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 9, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (121, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 10, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (122, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 11, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (123, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 3, 12, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (124, 'Notification IPD Prescription Created', 'ipd', 'Prescription(IPDP2) for IPD (IPDN4) prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\nFinding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\nMedicine Name: Azithromycin 250mg,Paracetamol 500mg\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\nAmitabh Kulkarni (D007)', '', 7, 1, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `role_id`, `receiver_id`, `date`, `is_active`, `created_at`) VALUES (125, 'Notification IPD Prescription Created', 'ipd', 'Dear Raima Sen 15 your IPD prescription number IPDP2 is prescribe by: Amitabh Kulkarni (D007). \r\n\r\nPrescription  Details-\r\n Finding Description: Pallor present, No icterus, Febrile, BMI normal, Conscious and oriented\r\n  \r\n Medicine Name : Azithromycin 250mg,Paracetamol 500mg\r\n Radiology Test: {{radilogy_test}}\r\n Pathology Test: {{pathology_test}}', '', NULL, 15, '2025-07-02 11:09:38', 'yes', '2025-07-02 11:09:38');


#
# TABLE STRUCTURE FOR: system_notification_setting
#

DROP TABLE IF EXISTS `system_notification_setting`;

CREATE TABLE `system_notification_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `staff_message` text DEFAULT NULL,
  `is_staff` int(11) NOT NULL DEFAULT 1,
  `patient_message` text DEFAULT NULL,
  `is_patient` int(11) NOT NULL DEFAULT 0,
  `variables` text DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `patient_url` varchar(255) NOT NULL,
  `notification_type` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_event` (`event`),
  KEY `index_is_staff` (`is_staff`),
  KEY `index_is_patient` (`is_patient`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (1, 'notification_appointment_created', 'New Appointment Created', 'Appointment has been created for Patient: {{patient_name}} ({{patient_id}}). Appointment Date: {{appointment_date}}  With Doctor Name: {{doctor_name}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) your appointment has been created with Doctor: {{doctor_name}}.', 1, '{{appointment_date}} {{patient_name}} {{patient_id}} {{doctor_name}} {{message}}', '', '', 'appointment', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (2, 'appointment_approved', 'Appointment Status', 'Patient: {{patient_name}} ({{patient_id}}) appointment status is {{appointment_status}} with Doctor:  {{doctor_name}} Date: {{appointment_date}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) your appointment status is {{appointment_status}} Date: {{appointment_date}} with Doctor {{doctor_name}}.', 1, '{{appointment_date}} {{patient_name}} {{patient_id}} {{doctor_name}} {{message}} {{appointment_status}}', '', '', 'appointment', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (3, 'opd_visit_created', 'New OPD Visit Created', 'OPD Visit has been created for patient: {{patient_name}} ({{patient_id}}) with doctor: {{doctor_name}}. Patient Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}} .', 1, 'Dear: {{patient_name}} ({{patient_id}}) your OPD visit has been created.  Your Symptoms Details are {{symptoms_description}} and any known allergies: {{any_known_allergies}}. ', 1, '{{patient_name}} {{patient_id}} {{symptoms_description}} {{any_known_allergies}} {{appointment_date}} {{doctor_name}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (4, 'notification_opd_prescription_created', 'New OPD Prescription Created', 'New OPD prescription has been created for Patient: {{patient_name}} ({{patient_id}}) Checkup ID: ({{checkup_id}}). Prescription {{prescription_no}} prescribe by {{prescribe_by}}.  \r\n\r\n Prescription Details.\r\n(1) Finding Description: {{finding_description}}\r\n(2) Medicine Details: {{medicine}}\r\n(3) Radiology Test: {{radilogy_test}}\r\n(4) Pathology Test: {{pathology_test}}', 1, 'Dear {{patient_name}} ({{patient_id}}) Checkup ID: ({{checkup_id}}) your OPD ({{opd_no}}) prescription has been created . Please Check your finding details {{finding_description}} prescribe by {{prescribe_by}}.\r\n\r\nPlease Check prescription details. \r\n(1) Medicines Details: {{medicine}}\r\n(2) Radiology Test: {{radilogy_test}}\r\n(3) Pathology Test: {{pathology_test}}', 1, '{{prescription_no}} {{opd_no}} {{checkup_id}} {{finding_description}} {{medicine}} {{radilogy_test}} {{pathology_test}} {{prescribe_by}} {{generated_by}} {{patient_name}} {{patient_id}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (5, 'add_opd_patient_charge', 'Add OPD Patient Charge', 'New OPD charges added in OPD Number: ({{opd_no}}) For Patient: {{patient_name}} ({{patient_id}}). In OPD applied charges is {{charge_type}}, charge category {{charge_category}} and charge Name {{charge_name}} quantity {{qty}}. Total net payable bill amount is {{net_amount}} date {{date}}', 1, 'Dear {{patient_name}}({{patient_id}}) OPD Number ({{opd_no}}) . In OPD applied charge name {{charge_type}} , category {{charge_category}},  charge name {{charge_name}} quantity {{qty}} and your net payable bill amount is {{net_amount}} Date {{date}}.', 1, '{{patient_name}} {{patient_id}}  {{opd_no}} {{charge_type}} {{charge_category}} {{charge_name}} {{qty}} {{net_amount}} {{date}} {{doctor_name}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (6, 'add_opd_payment', 'Add OPD Payment', 'New OPD payment has been received from Patient: {{patient_name}}({{patient_id}}) OPD Number: ({{opd_no}}) transaction id: {{transaction_id}} payment date: {{date}} payment amount: {{amount}} payment mode: {{payment_mode}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) your payment successfully received. OPD Number: {{opd_no}} transaction id: {{transaction_id}} payment date: {{date}} payment amount: ${{amount}} payment mode: {{payment_mode}}. ', 1, '{{patient_name}} {{patient_id}} {{opd_no}} {{date}} {{amount}} {{payment_mode}} {{transaction_id}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (7, 'add_opd_medication_dose', 'New OPD Medication Dose', 'Consultant Doctor {{doctor_name}} has given medicine {{medicine_name}} Category is {{medicine_category}} Dosage {{dosage}} for OPD patient number is  {{opd_no}} patient name is {{patient_name}} medicine time  {{date}} {{time}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) OPD Number: {{opd_no}} you have been given the Medicine is {{medicine_name}} Dose ({{dosage}}) medicine time {{date}} {{time}}.', 1, '{{patient_name}} {{patient_id}}  {{opd_no}} {{case_id}} \r\n{{date}} {{time}}  {{medicine_name}} {{dosage}} {{medicine_category}}  {{doctor_name}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (8, 'add_nurse_note', 'New IPD Nurse Note', 'Add New Nurse Note for IPD Number: ({{ipd_no}}) Patient: {{patient_name}} ({{patient_id}}) Case ID: {{case_id}} with consultant doctor  {{doctor_name}}. \r\n\r\nNurse Note Details:\r\n(1) Nurse Name: {{nurse_name}} ({{nurse_id}})\r\n(2) Note: {{note}}\r\n(3) Comment: {{comment}}', 1, 'Dear {{patient_name}} ({{patient_id}}) IPD Number: ({{ipd_no}}) and Case ID: {{case_id}} your consultant doctor is {{doctor_name}}. \r\n\r\nNurse Note Details:\r\n(1) Nurse Name: {{nurse_name}} ({{nurse_id}})\r\n(2) Note: {{note}}\r\n(3) Comment: {{comment}}', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{doctor_name}} {{date}} {{nurse_name}} {{nurse_id}} {{note}} {{comment}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (9, 'move_in_ipd_from_opd', 'Patient Move in IPD From OPD', 'Patient {{patient_name}} ({{patient_id}}) move in IPD From OPD. Symptoms Details: {{symptoms_description}} and known allergies is  {{any_known_allergies}}. The patient is being shifted from opd to ipd whose consultant doctor is {{doctor_name}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) you have been shifted from OPD to IPD consultant doctor is {{doctor_name}}. Check your symptoms details {{symptoms_description}} and known allergies {{any_known_allergies}}.\r\n\r\n', 1, '{{patient_name}} {{patient_id}} {{symptoms_description}} {{any_known_allergies}} {{appointment_date}} {{doctor_name}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (10, 'add_opd_operation', 'New OPD Operation', 'OPD Number: ({{opd_no}}) Patient: {{patient_name}} ({{patient_id}}) Case id: {{case_id}} has been shifted to the operation ward. Consultant Doctor is {{doctor_name}} .\r\n\r\nOperation Details.\r\nOperation Name: {{operation_name}}\r\nOperation Date: {{operation_date}}', 1, 'Dear {{patient_name}} {{patient_id}} your operation {{operation_name}} date is on {{operation_date}} and your consultant doctor is {{doctor_name}}.', 1, '{{patient_name}} {{patient_id}} {{opd_no}} {{case_id}} {{operation_name}} {{operation_date}} {{doctor_name}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (11, 'ipd_visit_created', 'New IPD Visit Created', 'IPD Visit has been created for {{patient_name}} ({{patient_id}}) with Doctor: {{doctor_name}}. Patient Symptoms Details are {{symptoms_description}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) your IPD visit has been created .', 1, '{{patient_name}} {{patient_id}} {{symptoms_description}} {{admission_date}} {{doctor_name}} {{bed_location}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (12, 'notification_ipd_prescription_created', 'Notification IPD Prescription Created', 'Prescription({{prescription_no}}) for IPD ({{ipd_no}}) prescribe by: {{priscribe_by}}. \r\n\r\nPrescription  Details-\r\nFinding Description: {{finding_description}}\r\nMedicine Name: {{medicine}}\r\nRadiology Test: {{radilogy_test}}\r\nPathology Test: {{pathology_test}}\r\n{{priscribe_by}}', 1, 'Dear {{patient_name}} {{patient_id}} your IPD prescription number {{prescription_no}} is prescribe by: {{priscribe_by}}. \r\n\r\nPrescription  Details-\r\n Finding Description: {{finding_description}}\r\n Medicine Name : {{medicine}}\r\n Radiology Test: {{radilogy_test}}\r\n Pathology Test: {{pathology_test}}', 1, '{{prescription_no}} {{ipd_no}} {{finding_description}} {{medicine}} {{radilogy_test}} {{pathology_test}} {{priscribe_by}} {{generated_by}} {{patient_name}} {{patient_id}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (14, 'add_ipd_operation', 'Add IPD Operation', 'Patient Name : {{patient_name}} ({{patient_id}}) IPD Number : {{ipd_no}} Case Id : {{case_id}} has been shifted to the operation ward. Whose doctor is {{doctor_name}}.\r\n\r\nOperation Details-\r\n(1) Operation Name: {{operation_name}}\r\n(2) Operation  Date:  {{operation_date}}', 1, 'Dear {{patient_name}} ({{patient_id}}) your operation {{operation_name}} date is on {{operation_date}} with {{doctor_name}}.', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{operation_name}} {{operation_date}} {{doctor_name}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (15, 'add_ipd_generate_bill', 'Add IPD Generate Bill', 'Generated bill for IPD Number {{ipd_no}}  Patient Name {{patient_name}} {{patient_id}} .\r\n\r\nBill Details\r\nTotal Amount {{total}}\r\nNet Amount {{net_amount}}\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   {{due}}', 1, 'Dear {{patient_name}} {{patient_id}}  your IPD bill is generated for Case Id {{case_id}} .\r\n\r\nBill Details\r\nTotal Amount {{total}}\r\nNet Amount {{net_amount}}\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   {{due}}', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{net_amount}} {{total}} {{tax}} {{paid}} {{due}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (16, 'add_ipd_patient_charge', 'Add IPD Patient Charge', 'Add Charge for IPD Patient Name : {{patient_name}} ({{patient_id}}) IPD Number ({{ipd_no}}) has applied charge {{charge_type}}, category  {{charge_category}}, and Name {{charge_name}} total quantity {{qty}} . Now total net amount {{net_amount}} date {{date}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) IPD Number {{ipd_no}} you have applied charge name is {{charge_type}}, category {{charge_category}} ,charge name {{charge_name}}  and total quantity {{qty}} now your net amount {{net_amount}} and date {{date}}.', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{charge_type}} {{charge_category}} {{charge_name}} {{qty}} {{net_amount}} {{date}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (17, 'add_ipd_payment', 'Add IPD Payment', 'Payment has been received from Patient Name: {{patient_name}} ({{patient_id}}) IPD NO: {{ipd_no}} transaction id: {{transaction_id}} payment date: {{date}} payment amount: {{amount}} payment mode: {{payment_mode}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) IPD: {{ipd_no}} we have received your payment amount ({{amount}}) transaction id: {{transaction_id}} payment date: {{date}} payment mode: {{payment_mode}} .', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{date}} {{amount}} {{payment_mode}} {{transaction_id}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (18, 'add_ipd_medication_dose', 'Add IPD Medication Dose', 'Doctor {{doctor_name}}  has given medicine {{medicine_name}} Category is {{medicine_category}} Dosage {{dosage}} to Patient:  {{patient_name}} {{patient_id}} at {{date}} {{time}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) IPD Number {{ipd_no}} you have been given the {{medicine_name}} dose {{dosage}} of medicine at {{date}} {{time}}.', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{date}} {{time}} {{medicine_name}} {{dosage}} {{medicine_category}} {{doctor_name}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (20, 'add_consultant_register', 'Add Consultant Register', 'New Consultant Register: {doctor_name}} has been added  some instructions: {{instruction}} on date {{applied_date}} for the patients {{patient_name}} ({{patient_id}}) of IPD {{ipd_no}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) IPD Number: ({{ipd_no}}). Consultant: {{doctor_name}} has added some instructions: {{instruction}} on applied date {{applied_date}}.', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{applied_date}} {{instruction_date}} {{doctor_name}} {{instruction}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (22, 'pharmacy_generate_bill', 'Pharmacy Generate Bill', 'Pharmacy Bill Generated for Patient: {{patient_name}} ({{patient_id}}) Case ID: {{case_id}}.\r\n\r\nPharmacy Bill Details-\r\nTotal Amount: {{total}}\r\nNet Amount: {{net_amount}}\r\nDiscount: {discount}} \r\nTax: {{tax}}\r\nPaid Amount  $ {{paid}}\r\nDue Amount  $ {{due_amount}}', 1, 'Dear {{patient_name}} {{patient_id}} your pharmacy bill is generated. \r\n\r\nBill Details-\r\nTotal Amount: {{total}}\r\nNet Amount: {{net_amount}}\r\nDiscount: {{discount}}\r\nTax: {{tax}}\r\nPaid Amount: {{paid}}\r\nDue Amount: {{due_amount}}', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{medicine_details}} {{doctor_name}} {{total}} {{discount}} {{tax}} {{net_amount}} {{date}} {{paid}} {{due_amount}}', '', '', 'pharmacy', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (23, 'add_medicine', 'Add Medicine', 'New Add Medicine Details: \r\n\r\nMedicine Name  {{medicine_name}} , \r\nMedicine Category  {{medicine_category}} ,\r\nMedicine Company  {{medicine_company}} ,\r\nMedicine Composition  {{medicine_composition}} ,\r\nMedicine Group {{medicine_group}} , \r\nUnit {{unit}} ,\r\nPacking  {{unit_packing}} ,', 1, '', 0, '{{medicine_name}} {{medicine_category}} {{medicine_company}} {{medicine_composition}} {{medicine_group}} {{unit}} {{unit_packing}}', '', '', 'pharmacy', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (24, 'add_bad_stock', 'Add Bad Stock', 'Add Bad Stock Details :\r\n\r\nBatch No {{batch_no}}\r\nExpiry Date  {{expiry_date}}\r\nOutward Date   {{outward_date}}  \r\n Total Qty  {{qty}}', 1, '', 0, '{{batch_no}} {{expiry_date}} {{outward_date}} {{qty}}', '', '', 'pharmacy', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (25, 'purchase_medicine', 'Purchase Medicine', 'Purchase Medicine Details :\r\nSupplier Name: {{supplier_name}} \r\nMedicine Details: {{medicine_details}}\r\nPurchase Date: {{purchase_date}}\r\nInvoice Number:  {{invoice_number}}\r\nTotal: {{total}}\r\nDiscount: {{discount}} \r\nTax: {{tax}}\r\nNet Amount: {{net_amount}}', 1, '', 0, '{{supplier_name}} {{medicine_details}} {{purchase_date}} {{invoice_number}} {{total}} {{discount}} {{tax}} {{net_amount}}', '', '', 'pharmacy', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (26, 'pathology_investigation', 'Pathology Investigation', 'Pathology Test Report for Patient: {{patient_name}} ({{patient_id}}) case id: {{case_id}}. Pathology test assign by {{doctor_name}}. pathology charge- total amount {{total}}, discount {{discount}} ,tax {{tax}}  net amount is {{net_amount}} and total paid amount {{paid_amount}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) case id: {{case_id}}. Your pathology test bill number is {{bill_no}} and total amount {{total}}, tax {{tax}}, discount {{discount}} so now your net amount is {{net_amount}}.  You have paid your total amount {{paid_amount}}.', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{date}} {{doctor_name}}  {{total}} {{discount}} {{tax}} {{net_amount}} {{paid_amount}}', '', '', 'pathology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (27, 'pathology_sample_collection', 'Pathology Sample Collection', 'Pathology Bill Number {{bill_no}} Patient: {{patient_name}} ({{patient_id}}) Case id: {{case_id}}. Sample Collected  by  {{sample_collected_person_name}} on {{collected_date}} from {{pathology_center}} and report expected date is {{expected_date}}.', 1, 'Dear {{patient_name}} {{patient_id}} Case id: {{case_id}}  your pathology test sample collected by {{sample_collected_person_name}} on {{collected_date}} from {{pathology_center}} . Pathology Test report expected date {{expected_date}}. ', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{test_name}} {{sample_collected_person_name}} {{collected_date}} {{pathology_center}} {{expected_date}} {{doctor_name}}', '', '', 'pathology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (28, 'pathology_test_report', 'Pathology Test Report', 'Pathology Test Report Bill Number {{bill_no}} for Patient Name is {{patient_name}} {{patient_id}} Case id {{case_id}} and test approved by {{approved_by}} on {{approve_date}} . Pathology Test {{test_name}} sample collected by {{sample_collected_person_name}} on {{collected_date}} from {{pathology_center}} and Expected date {{expected_date}} . {{doctor_name}}', 1, 'Dear {{patient_name}} {{patient_id}} Case id  {{case_id}}. Your Pathology Test {{test_name}} sample collected by {{sample_collected_person_name}} on  {{collected_date}} from {{pathology_center}} .', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{test_name}} {{sample_collected_person_name}} {{collected_date}} {{pathology_center}} {{expected_date}} {{approved_by}} {{approve_date}} {{doctor_name}}', '', '', 'pathology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (29, 'radiology_investigation', 'Radiology Investigation', 'Radiology Test Report for Patient: {{patient_name}} ({{patient_id}}) case id: {{case_id}}. Radiology test assign by {{doctor_name}}. Test Charge total amount {{total}}, total discount {{discount}}, tax {{tax}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) case id: {{case_id}}. Your Radiology test bill number is {{bill_no}},  total bill amount {{total}} tax {{tax}}, discount {{discount}} so now your net amount {{net_amount}} and total paid amount is {{paid}}. ', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{date}} {{doctor_name}}  {{total}} {{net_amount}} {{paid}} {{discount}} {{tax}}', '', '', 'radiology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (30, 'radiology_sample_collection', 'Radiology Sample Collection', 'Radiology Bill Number: {{bill_no}} for Patient: {{patient_name}} ({{patient_id}}) Case id: {{case_id}}. Radiology test name is {{test_name}} and sample collected by {{sample_collected_person_name}} on {{collected_date}} from {{radiology_center}} and report expected date is {{expected_date}}.', 1, 'Dear {{patient_name}} {{patient_id}} Case id: {{case_id}}  your radiology test is {{test_name}} and  sample collected by {{sample_collected_person_name}} on {{collected_date}} from {{radiology_center}}. Test report expected date {{expected_date}}. ', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{test_name}} {{sample_collected_person_name}} {{collected_date}} {{radiology_center}} {{expected_date}} {{doctor_name}}', '', '', 'radiology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (31, 'radiology_test_report', 'Radiology Test Report', 'Radiology Bill Number {{bill_no}} Patient Name {{patient_name}} ({{patient_id}}) Case id ( {{case_id}}). Sample Collected  by  {{sample_collected_person_name}} on {{collected_date}} from {{radiology_center}} and Expected date is {{expected_date}}.', 1, 'Dear {{patient_name}} {{patient_id}} Case id ({{case_id}}) your radiology test sample collected by {{sample_collected_person_name}} on {{collected_date}} from  {{radiology_center}}. radiology test report expected date {{expected_date}} .', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{test_name}} {{sample_collected_person_name}} {{collected_date}} {{radiology_center}} {{expected_date}} {{approved_by}} {{approved_date}} {{doctor_name}}', '', '', 'radiology', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (32, 'add_bag_stock', 'Add Bag Stock', 'New Add Bag Stock Details- Donor Name: {{donor_name}}, Blood Group: ({{blood_group}}) and contact number {{contact_no}} . Donate bag details blood bag number ({{bag}}) and charge {{charge_name}} donated date {{donate_date}}. Total amount {{total}} discount {{discount}} tax {{tax}} so total net amount is {{net_amount}}.', 1, '', 0, '{{donor_name}} {{blood_group}} {{contact_no}} {{donate_date}} {{bag}} {{charge_name}} {{total}} {{discount}} {{tax}} {{net_amount}}', '', '', 'blood_bank', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (33, 'blood_issue', 'Blood Issue', 'Blood issue for Bill Number {{bill_no}} Patient: {{patient_name}} ({{patient_id}}) Case Id {{case_id}} . Patient blood group is {{blood_group}} and bag number ({{bag}}) issue on {{issue_date}}, reference by {{reference_name}}. Applied charge name is {{charge_name}} and total amount {{total}}, discount {{discount}}, tax {{tax}}, now total net amount{{net_amount}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) case id: {{case_id}} your bill number {{bill_no}} blood group {{blood_group}} bag number is {{bag}} charge name  {{charge_name}} issue on {{issue_date}} reference by {{reference_name}} .Total amount {{total}}, discount {{discount}}, tax {{tax}} now your total net amount {{net_amount}}.', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{issue_date}} {{reference_name}} {{blood_group}} {{bag}} {{charge_name}} {{total}} {{discount}} {{tax}} {{net_amount}} ', '', '', 'blood_bank', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (34, 'add_component_of_blood', 'Add Component of Blood', '{{component_name}} component has been added on the bag number {{bag}} of Blood Group {{blood_group}} .', 1, '', 0, '{{blood_group}} {{bag}} {{ component_name}} {{component_bag}}', '', '', 'blood_bank', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (35, 'component_issue', 'Component Issue', 'Component Issue for  Bill Number {{bill_no}} Patient Name is {{patient_name}} ({{patient_id}}) Case Id: {{case_id}}.  Blood group {{blood_group}} Component: {{component}}, bag number {{bag}} issue on {{issue_date}}  reference by {{reference_name}}. Applied charge name {{charge_name}} total amount {{total}}  discount {{discount}} tax {{tax}} now total net amount {{net_amount}}.', 1, 'Dear {{patient_name}} ({{patient_id}}) {{case_id}} you have issued a component {{component}} Bag number is {{bag}}  blood group is {{blood_group}} issue on  {{issue_date}} reference by {{reference_name}} . Total amount {{total}} Discount {{discount}} Tax {{tax}} now your total net amount  is {{net_amount}}.', 1, '{{patient_name}} {{patient_id}} {{case_id}} {{bill_no}} {{issue_date}} {{reference_name}} {{blood_group}} {{component}} {{bag}} {{charge_name}} {{total}} {{discount}} {{tax}} {{net_amount}} ', '', '', 'blood_bank', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (36, 'live_opd_consultation_add', 'Live OPD Consultation Add', 'Live Consultation for  OPD {{opd_no}} Patient  Name {{patient_name}} {{patient_id}}  with Consultant Doctor {{doctor_name}} {{doctor_id}} . Live consulatent Title  {{consultation_title}} Date {{consultation_date}} minutes {{consultation_date}} {{consultation_duration_minutes}}.', 1, 'Dear {{patient_name}} {{patient_id}} your live consultation subject {{consultation_title}} date {{consultation_date}} minute {{consultation_duration_minutes}}  with Consultant Doctor {{doctor_name}} ({{doctor_id}}).', 1, '{{patient_name}} {{patient_id}} {{consultation_title}} {{consultation_date}} {{consultation_duration_minutes}}  {{opd_no}} {{checkup_id}} {{doctor_id}} {{doctor_name}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (37, 'live_opd_consultation_start', 'Live Opd Consultation Start', 'patient_name: {{patient_name}} patient_id: {{patient_id}} consultation_title: {{consultation_title}} consultation_date: {{consultation_date}}  consultation_duration_minutes: {{consultation_duration_minutes}} opd_no: {{opd_no}} checkup_id: {{checkup_id}} doctor_name: {{doctor_name}}', 1, 'patient_name: {{patient_name}} patient_id: {{patient_id}} consultation_title: {{consultation_title}} consultation_date: {{consultation_date}}  consultation_duration_minutes: {{consultation_duration_minutes}} opd_no: {{opd_no}} checkup_id: {{checkup_id}} doctor_name: {{doctor_name}}', 1, '{{patient_name}} {{patient_id}} {{consultation_title}} {{consultation_date}} {{consultation_duration_minutes}}  {{opd_no}} {{checkup_id}} {{doctor_name}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (38, 'live_meeting_start', 'Live Meeting Start', 'Live Meeting has been created for Staff: {{staff_list}}  Meeting Title is {{meeting_title}}  and Meeting Date {{meeting_date}} Meeting Duration Minutes: {{meeting_duration_minutes}}.', 1, '', 0, '{{meeting_title}} {{meeting_date}} {{meeting_duration_minutes}} {{staff_list}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (39, 'live_meeting_add', 'Live Meeting Add', 'Live Meeting Created for Staff {{staff_list}} and  Meeting Title is {{meeting_title}} on Meeting Date {{meeting_date}} Meeting Duration Minutes{{meeting_duration_minutes}} .', 1, '', 0, '{{meeting_title}} {{meeting_date}} {{meeting_duration_minutes}} {{staff_list}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (40, 'add_referral_payment', 'Add Referral Payment', 'Patient Name {{patient_name}} ({{patient_id}}) in {{patient_type}} Bill number {{bill_no}} and patient bill amount is {{patient_bill_amount}}. Commission percentage of total bill {{commission_percentage}}. Commission amount {{commission_amount}} has been given to the payee {{payee}}.', 1, '', 0, '{{patient_name}} {{patient_id}} {{patient_type}} {{bill_no}} {{patient_bill_amount}} {{payee}} {{commission_percentage}} {{commission_amount}}', '', '', 'referral', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (41, 'patient_certificate_generate', 'Patient Certificate Generate', 'Patient Name {{patient_name}} {{patient_id}} certificate {{certificate_name}} has been generated. OPD/ IPD number {{opd_ipd_no}}.', 1, 'Dear Patient {{patient_name}} {{patient_id}} OPD / IPD number is {{opd_ipd_no}}  your certificate {{certificate_name}} has been generated.', 1, '{{patient_name}} {{patient_id}} {{opd_ipd_no}} {{certificate_name}}', '', '', 'certificate', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (42, 'patient_id_card_generate', 'remaining', 'ID Card is generated for Patient Name {{patient_name}} {{patient_id}} .', 1, 'Dear {{patient_name}} {{patient_id}} your id card is generated .', 1, '{{patient_name}} {{patient_id}}  {{id_card_template}}', '', '', 'certificate', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (43, 'generate_staff_id_card', 'Generate Staff ID Card', 'Staff ID card is generated for Role: {{role}}, staff name {{staff_name}} suename {{staff_surname}} employee id: {{employee_id}}.', 1, '', 0, '{{role}} {{staff_name}} {{staff_surname}} {{employee_id}} {{id_card_template}}', '', '', 'certificate', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (44, 'create_ambulance_call', 'Create Ambulance Call', '{{patient_name}} {{patient_id}} has booked an ambulance on {{date}} his charge name {{charge_name}} tax {{tax}}  net amount {{net_amount}} and total paid  amount {{paid_amount}}.\r\n\r\nAmbulance Details \r\n\r\nVehicle Model  {{vehicle_model}}\r\nDriver Name  {{driver_name}}', 1, 'Dear {{patient_name}} {{patient_id}} your ambulance is booked on {{date}} . Charge applied {{charge_name}}, tax {{tax}} net amount is {{net_amount}} and your paid amount is {{paid_amount}} .\r\n\r\nAmbulance Details-\r\nVehicle Model: {{vehicle_model}}\r\nDriver Name: {{driver_name}}', 1, '{{patient_name}} {{patient_id}} {{vehicle_model}} {{driver_name}} {{date}} {{charge_name}} {{tax}} {{net_amount}} {{paid_amount}}', '', '', 'ambulance', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (45, 'add_birth_record', 'Add Birth Record', 'Patient {{mother_name}} ({{mother_id}}) has given birth to a new baby {{child_name}} on {{birth_date}}.', 1, 'Dear {{mother_name}} {{mother_id}} case id : {{case_id}} your baby {{child_name}} is born on {{birth_date}}.', 1, '{{mother_name}} {{mother_id}} {{child_name}} {{birth_date}} {{case_id}}', '', '', 'birth_death_record', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (46, 'add_death_record', 'Add Death Record', 'Patient {{patient_name}} ({{patient_id}}) Case id :{{case_id}} has died on {{death_date}}.', 1, '', 0, '{{case_id}} {{patient_name}} {{patient_id}} {{death_date}}', '', '', 'birth_death_record', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (47, 'staff_enabale_disable', 'Staff Enabale/Disable', 'Staff Name: {{staff_name}} surname: {{staff_surname}} Employment ID: ({{employee_id}}) has been {{status}}.', 1, '', 0, '{{staff_name}} {{staff_surname}} {{employee_id}} {{status}}', '', '', 'human_resource', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (48, 'staff_generate_payroll', 'Staff Generate Payroll', 'Payroll Generated for  Month {{month}} year {{year}}  Role {{role}} . Basic Salary is {{basic_salary}} Earning  {{earning}} Deduction {{deduction}} Gross salary  {{gross_salary}}.  Now Total Net Salary {{net_salary}}.', 1, '', 0, '{{role}} {{month}} {{year}} {{basic_salary}} {{earning}} {{deduction}} {{gross_salary}} {{tax_amount}} {{net_salary}}', '', '', 'human_resource', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (49, 'staff_leave', 'Staff Leave', 'Staff {{staff_name}} {{staff_surname}} ({{employee_id}}) has applied leave on Date {{apply_date}} for leave {{days}} days. date {{leave_date}} . Currently Leave Status is {{leave_status}} .', 1, '', 0, '{{apply_date}} {{leave_type}} {{leave_date}} {{days}} {{staff_name}} {{staff_surname}} {{employee_id}}\r\n{{leave_status}}', '', '', 'human_resource', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (50, 'staff_leave_status', 'Staff Leave Status', 'Staff Name {{staff_name}} {{staff_surname}} {{employee_id}} has applied leave for {{days}} days. leave date: {{leave_date}}, Leave Status:  {{leave_status}}.', 1, '', 0, '{{apply_date}} {{leave_type}} {{leave_date}} {{days}} {{staff_name}} {{staff_surname}} {{employee_id}}\r\n{{leave_status}}', '', '', 'human_resource', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (51, 'live_ipd_consultation_add', 'Live IPD Consultation Add', 'Live Consultation for IPD {{ipd_no}} Patient  Name {{patient_name}} {{patient_id}} with Consultant Doctor {{doctor_name}} {{doctor_id}} . Live consulatent Title  {{consultation_title}} Date {{consultation_date}} minutes {{consultation_date}} {{consultation_duration_minutes}}.', 1, 'Dear {{patient_name}} {{patient_id}} your live consultation subject {{consultation_title}} date {{consultation_date}} minute {{consultation_duration_minutes}}  with Consultant Doctor {{doctor_name}} ({{doctor_id}}).', 1, '{{patient_name}} {{patient_id}} {{consultation_title}} {{consultation_date}} {{consultation_duration_minutes}} \r\n{{ipd_no}} {{doctor_id}} {{doctor_name}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (52, 'live_ipd_consultation_start', 'Live IPD Consultation Start', 'IPD No {{ipd_no}} Patient Name {{patient_name}} {{patient_id}}. Live Consultation Doctor {{doctor_name}}. \r\n\r\nLive Consultation Details.\r\nConsultation Title {{consultation_title}}\r\nConsultation Date  {{consultation_date}}\r\nConsultation Duration Minutes  {{consultation_duration_minutes}}', 1, 'Dear patient patient_name: {{patient_name}} patient_id: {{patient_id}} , your live consultation consultation_title: {{consultation_title}} has been scheduled on Consultation Date: {{consultation_date}} for the duration of consultation_duration_minutes: {{consultation_duration_minutes}} minute, ipd_no: {{ipd_no}} and your consultant doctor doctor_name: {{doctor_name}}  please do not share the link to any body.', 1, '{{patient_name}} {{patient_id}} {{consultation_title}} {{consultation_date}} {{consultation_duration_minutes}}  {{ipd_no}} {{doctor_name}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (53, 'add_ipd_discharge_patient', 'Add IPD Discharge Patient', 'IPD Patient: {{patient_name}}({{patient_id}}) status: ({{discharge_status}}) on {{discharge_date}}.', 1, 'Dear {{patient_name}} {{patient_id}} you have been {{discharge_status}} on {{discharge_date}}.', 1, '{{patient_name}} {{patient_id}} {{discharge_status}} {{discharge_date}} {{ipd_no}} {{case_id}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (54, 'add_opd_discharge_patient', 'Add OPD Discharge Patient', 'OPD Patient {{patient_name}} {{patient_id}} discharge status: {discharge_status}} on {{discharge_date}}.', 1, '\r\nDear {{patient_name}} {{patient_id}} you have been {{discharge_status}} on {{discharge_date}}.', 1, '{{patient_name}} {{patient_id}} {{discharge_status}} {{discharge_date}} {{opd_no}} {{case_id}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (55, 'add_payroll_payment', 'Add Payroll Payment', 'Month {{month}} salary amount {{payment_amount}} has been given to staff name {{staff}} on date {{payment_date}}.', 1, 'staff: {{staff}} payment_amount: {{payment_amount}} month: {{month}} year: {{year}} payment_mode: {{payment_mode}} payment_date: {{payment_date}}\r\n', 0, '{{staff}} {{payment_amount}} {{month}} {{year}} {{payment_mode}} {{payment_date}}', '', '', 'human_resource', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (56, 'add_opd_generate_bill', 'Add OPD Generate Bill', 'Generated bill for OPD Number {{opd_id}}  Patient Name {{patient_name}} {{patient_id}} .\r\n\r\nBill Details\r\nTotal Amount {{total}}\r\nNet Amount {{net_amount}}\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   {{due}}', 1, 'Dear {{patient_name}} {{patient_id}}  your OPD bill is generated for Case Id {{case_id}} .\r\n\r\nBill Details\r\nTotal Amount {{total}}\r\nNet Amount {{net_amount}}\r\nTax  {{tax}}\r\nPaid Amount   {{paid}}\r\nDue Amount   {{due}}', 1, '{{patient_name}} {{patient_id}} {{opd_id}} {{case_id}} {{net_amount}} {{total}} {{tax}} {{paid}} {{due}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (57, 'patient_consultation_add', 'Patient Consultation Add', 'Live Consultation for Patient  Name {{patient_name}} {{patient_id}}  with Consultant Doctor {{doctor_name}} . Live consulatent Title  {{consultation_title}} Date {{consultation_date}} minutes {{consultation_date}} {{consultation_duration_minutes}}.', 1, 'Dear {{patient_name}} {{patient_id}} your live consultation subject {{consultation_title}} date {{consultation_date}} minute {{consultation_duration_minutes}}  with Consultant Doctor {{doctor_name}}.', 1, '{{patient_name}} {{patient_id}} {{consultation_title}} {{consultation_date}} {{consultation_duration_minutes}}  {{checkup_id}} {{doctor_name}}', '', '', 'live_consultation', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (58, 'opd_patient_discharge_revert', 'opd_patient_discharge_revert', 'patient_name: {{patient_name}} patient_id: {{patient_id}} discharge_status: {{discharge_status}} discharge_date: {{discharge_date}} opd_no: {{opd_no}} case_id: {{case_id}}', 1, 'patient_name: {{patient_name}} patient_id: {{patient_id}} discharge_status: {{discharge_status}} discharge_date: {{discharge_date}} opd_no: {{opd_no}} case_id: {{case_id}}', 1, '{{patient_name}} {{patient_id}} {{discharge_status}} {{discharge_date}} {{opd_no}} {{case_id}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (59, 'ipd_patient_discharge_revert', 'ipd_patient_discharge_revert', 'patient_name: {{patient_name}} patient_id: {{patient_id}} discharge_status: {{discharge_status}} discharge_date: {{discharge_date}} ipd_no: {{ipd_no}} case_id: {{case_id}}', 1, 'patient_name: {{patient_name}} patient_id: {{patient_id}} discharge_status: {{discharge_status}} discharge_date: {{discharge_date}} ipd_no: {{ipd_no}} case_id: {{case_id}}', 1, '{{patient_name}} {{patient_id}} {{discharge_status}} {{discharge_date}} {{ipd_no}} {{case_id}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (60, 'add_ipd_previous_obstetric_history', 'Add IPD  Previous Obstetric History', 'IPD  Previous Obstetric History been created for Patient: {{patient_name}} ({{patient_id}}).', 1, 'IPD  Previous Obstetric History been created for Patient: {{patient_name}} ({{patient_id}}). ', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{place_of_delivery}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (61, 'add_ipd_postnatal_history', 'Add IPD Postnatal History', 'IPD Postnatal History\r\n has been created for Patient: {{patient_name}} ({{patient_id}}).', 1, 'IPD Postnatal History\r\n has been created for Patient: {{patient_name}} ({{patient_id}}).\r\n', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{labor_time}} {{delivery_time}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (62, 'add_ipd_antenatal', 'Add IPD Antenatal', 'IPD Antenatal has been created for Patient: {{patient_name}} ({{patient_id}}).', 1, 'IPD Antenatal has been created for Patient: {{patient_name}} ({{patient_id}}). \r\n\r\n', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{date}}', '', '', 'ipd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (63, 'add_opd_antenatal', 'Add OPD Antenatal', 'OPD Antenatal has been created for Patient: {{patient_name}} ({{patient_id}}).', 1, '\r\n OPD Antenatal has been created for Patient: {{patient_name}} ({{patient_id}}).', 1, '{{patient_name}} {{patient_id}} {{opd_no}} {{case_id}} {{date}}', '', '', 'opd', 1, '2021-09-17 02:54:13');
INSERT INTO `system_notification_setting` (`id`, `event`, `subject`, `staff_message`, `is_staff`, `patient_message`, `is_patient`, `variables`, `url`, `patient_url`, `notification_type`, `is_active`, `created_at`) VALUES (64, 'opd_new_checkup_created', 'OPD New Checkup Created', 'OPD New Checkup Created {{patient_name}} doctor and admin msg', 1, 'OPD New Checkup Created {{patient_name}} patient mesg', 1, '{{patient_name}} {{patient_id}} {{ipd_no}} {{case_id}} {{place_of_delivery}}', '', '', 'opd', 1, '2021-09-17 02:54:13');


#
# TABLE STRUCTURE FOR: tax_category
#

DROP TABLE IF EXISTS `tax_category`;

CREATE TABLE `tax_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percentage` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `tax_category` (`id`, `name`, `percentage`, `created_at`) VALUES (1, 'None', '0.00', '2025-06-17 19:47:28');


#
# TABLE STRUCTURE FOR: transactions
#

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `section` varchar(50) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `opd_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `pharmacy_bill_basic_id` int(11) DEFAULT NULL,
  `pathology_billing_id` int(11) DEFAULT NULL,
  `radiology_billing_id` int(11) DEFAULT NULL,
  `blood_donor_cycle_id` int(11) DEFAULT NULL,
  `blood_issue_id` int(11) DEFAULT NULL,
  `ambulance_call_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `amount_type` varchar(10) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `opd_id` (`opd_id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `pharmacy_bill_basic_id` (`pharmacy_bill_basic_id`),
  KEY `pathology_billing_id` (`pathology_billing_id`),
  KEY `radiology_billing_id` (`radiology_billing_id`),
  KEY `blood_donor_cycle_id` (`blood_donor_cycle_id`),
  KEY `blood_issue_id` (`blood_issue_id`),
  KEY `ambulance_call_id` (`ambulance_call_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `bill_id` (`bill_id`),
  KEY `idx_type` (`type`),
  KEY `idx_patient_id` (`patient_id`),
  KEY `index_type` (`type`),
  KEY `index_section` (`section`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (3, 'payment', 'OPD', 9, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100.00', 'Cash', NULL, NULL, '2025-07-04 10:31:00', '', 1, NULL, '2025-07-02 05:02:27');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (4, 'payment', 'OPD', 10, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100.00', 'Cash', NULL, NULL, '2025-07-07 10:33:00', '', 1, NULL, '2025-07-02 05:04:04');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (6, 'payment', 'Appointment', 13, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '400.00', 'Cash', NULL, NULL, '2025-07-02 09:01:40', NULL, 1, NULL, '2025-07-02 09:01:40');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (7, 'payment', 'Blood Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '400.00', 'Cash', NULL, NULL, '2025-07-02 14:51:00', NULL, 1, NULL, '2025-07-02 09:22:23');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (8, 'payment', 'Blood Bank', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '700.00', 'Cash', NULL, NULL, '2025-07-02 14:59:00', '', 1, NULL, '2025-07-02 09:29:58');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (9, 'payment', 'Pharmacy', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24.32', 'Cash', NULL, NULL, '2025-07-02 15:00:00', '', 1, NULL, '2025-07-02 09:31:12');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (10, 'payment', 'Pathology', 11, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 'Cash', NULL, NULL, '2025-07-02 15:01:00', NULL, 1, NULL, '2025-07-02 09:31:44');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (11, 'payment', 'Pharmacy', 6, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '27.77', 'Cash', NULL, NULL, '2025-07-02 15:05:00', '', 1, NULL, '2025-07-02 09:37:01');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (12, 'payment', 'Blood Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '400.00', 'Cash', NULL, NULL, '2025-07-02 15:11:00', NULL, 1, NULL, '2025-07-02 09:42:11');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (13, 'payment', 'Blood Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, '400.00', 'Cash', NULL, NULL, '2025-07-02 15:13:00', NULL, 1, NULL, '2025-07-02 09:54:09');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (14, 'payment', 'ipd', 4, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '800.00', 'Cash', NULL, NULL, '2025-07-02 16:17:00', '', 1, NULL, '2025-07-02 10:48:00');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (15, 'payment', 'Pathology', 4, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500.00', 'Cash', NULL, NULL, '2025-07-02 16:26:00', NULL, 1, NULL, '2025-07-02 10:57:41');
INSERT INTO `transactions` (`id`, `type`, `section`, `patient_id`, `case_reference_id`, `opd_id`, `ipd_id`, `pharmacy_bill_basic_id`, `pathology_billing_id`, `radiology_billing_id`, `blood_donor_cycle_id`, `blood_issue_id`, `ambulance_call_id`, `appointment_id`, `attachment`, `attachment_name`, `amount_type`, `amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_date`, `note`, `received_by`, `bill_id`, `created_at`) VALUES (16, 'payment', 'IPD', 15, 10, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '800.00', 'Cash', NULL, NULL, '2025-07-04 16:32:00', '', 1, NULL, '2025-07-02 11:02:44');


#
# TABLE STRUCTURE FOR: transactions_processing
#

DROP TABLE IF EXISTS `transactions_processing`;

CREATE TABLE `transactions_processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_ins_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `section` varchar(50) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `case_reference_id` int(11) DEFAULT NULL,
  `opd_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) DEFAULT NULL,
  `pharmacy_bill_basic_id` int(11) DEFAULT NULL,
  `pathology_billing_id` int(11) DEFAULT NULL,
  `radiology_billing_id` int(11) DEFAULT NULL,
  `blood_donor_cycle_id` int(11) DEFAULT NULL,
  `blood_issue_id` int(11) DEFAULT NULL,
  `ambulance_call_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `amount_type` varchar(10) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `case_reference_id` (`case_reference_id`),
  KEY `opd_id` (`opd_id`),
  KEY `ipd_id` (`ipd_id`),
  KEY `pharmacy_bill_basic_id` (`pharmacy_bill_basic_id`),
  KEY `pathology_billing_id` (`pathology_billing_id`),
  KEY `radiology_billing_id` (`radiology_billing_id`),
  KEY `blood_donor_cycle_id` (`blood_donor_cycle_id`),
  KEY `blood_issue_id` (`blood_issue_id`),
  KEY `ambulance_call_id` (`ambulance_call_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `bill_id` (`bill_id`),
  KEY `index_attachment` (`attachment`),
  KEY `index_amount_type` (`amount_type`),
  KEY `index_amount` (`amount`),
  KEY `index_payment_mode` (`payment_mode`),
  KEY `index_cheque_no` (`cheque_no`),
  KEY `index_cheque_date` (`cheque_date`),
  KEY `index_payment_date` (`payment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: unit
#

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_unit_name` (`unit_name`),
  KEY `index_unit_type` (`unit_type`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (1, 'Tablet', 'pharmacy', '2025-07-01 13:31:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (2, 'Syrup', 'pharmacy', '2025-07-01 13:31:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (3, 'Injection', 'pharmacy', '2025-07-01 13:31:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (4, 'Cream', 'pharmacy', '2025-07-01 13:31:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (5, 'Ointment', 'pharmacy', '2025-07-01 13:31:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (6, 'Complete Blood Count (CBC)', 'patho', '2025-07-01 13:33:57');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (7, 'Hemoglobin (Hb)', 'patho', '2025-07-01 13:34:15');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (8, 'Platelet Count', 'patho', '2025-07-01 13:34:34');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (9, 'Blood Smear Examination', 'patho', '2025-07-01 13:34:43');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (10, 'Liver Function Test (LFT)', 'patho', '2025-07-01 13:34:51');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (11, 'Kidney Function Test (KFT)', 'patho', '2025-07-01 13:34:59');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (12, 'Lipid Profile (Cholesterol, Triglycerides)', 'patho', '2025-07-01 13:35:12');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (13, 'Electrolytes (Na, K, Cl)', 'patho', '2025-07-01 13:35:23');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (14, 'HIV, HBsAg, HCV', 'patho', '2025-07-01 13:35:41');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (15, 'Urine Routine & Microscopy', 'patho', '2025-07-01 13:36:02');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (16, 'Semen Analysis', 'patho', '2025-07-01 13:36:19');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (17, 'CSF Analysis (Cerebrospinal Fluid)', 'patho', '2025-07-01 13:36:29');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (18, 'Thyroid Profile (TSH, T3, T4)', 'patho', '2025-07-01 13:36:49');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (19, 'Testosterone, Estrogen', 'patho', '2025-07-01 13:36:58');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (20, 'Chest X-Ray (CXR)', 'radio', '2025-07-01 13:47:53');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (21, 'Skull X-Ray', 'radio', '2025-07-01 13:48:00');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (22, 'Abdomen X-Ray', 'radio', '2025-07-01 13:48:07');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (23, 'Spine X-Ray (Cervical, Lumbar, Thoracic)', 'radio', '2025-07-01 13:48:15');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (24, 'Abdominal Ultrasound', 'radio', '2025-07-01 13:48:21');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (25, 'Obstetric Ultrasound (Pregnancy scan)', 'radio', '2025-07-01 13:48:30');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (26, 'CT Brain/Head', 'radio', '2025-07-01 13:48:40');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (27, 'CT Chest', 'radio', '2025-07-01 13:48:48');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (28, 'CT Spine', 'radio', '2025-07-01 13:48:53');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (29, 'Inhaler', 'pharmacy', '2025-07-01 13:51:51');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (30, 'MRI Abdomen/Pelvis', 'radio', '2025-07-02 06:12:50');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (31, 'MRI Brain', 'radio', '2025-07-02 06:13:00');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (32, 'Solution', 'pharmacy', '2025-07-02 07:04:53');


#
# TABLE STRUCTURE FOR: upload_contents
#

DROP TABLE IF EXISTS `upload_contents`;

CREATE TABLE `upload_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `thumb_path` text DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `real_name` text NOT NULL,
  `img_name` text DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `mime_type` text NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_by` (`upload_by`),
  KEY `upload_contents_ibfk_2` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (1, 'saumen@gmail.com', 'Super Admin', '127.0.0.1', 'Firefox 138.0, Windows 10', '2025-05-22 10:48:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 'saumen@gmail.com', 'Super Admin', '::1', 'Chrome 137.0.0.0, Windows 10', '2025-06-17 16:17:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (3, 'saumen@gmail.com', 'Super Admin', '::1', 'Chrome 137.0.0.0, Windows 10', '2025-06-24 05:47:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (4, 'saumen@gmail.com', 'Super Admin', '103.249.39.159', 'Firefox 139.0, Windows 10', '2025-06-24 12:41:15');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (5, 'bkundu@gmail.com', 'Doctor', '103.249.39.159', 'Firefox 139.0, Windows 10', '2025-06-24 12:45:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (6, 'saumen@gmail.com', 'Super Admin', '103.249.39.159', 'Firefox 139.0, Windows 10', '2025-06-24 12:51:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (7, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Firefox 140.0, Windows 10', '2025-07-01 13:13:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (8, 'saumen@gmail.com', 'Super Admin', '103.242.189.206', 'Chrome 137.0.0.0, Windows 10', '2025-07-01 13:16:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (9, 'saumen@gmail.com', 'Super Admin', '2409:40e0:103a:49d4:4c27:7933:d8a:afe8', 'Chrome 137.0.0.0, Windows 10', '2025-07-01 13:16:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (10, 'saumen@gmail.com', 'Super Admin', '45.124.4.181', 'Chrome 138.0.0.0, Windows 10', '2025-07-01 13:22:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (11, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Firefox 140.0, Windows 10', '2025-07-01 13:47:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (12, 'saumen@gmail.com', 'Super Admin', '103.77.139.193', 'Chrome 137.0.0.0, Windows 10', '2025-07-01 14:14:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (13, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Firefox 140.0, Windows 10', '2025-07-02 02:42:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (14, 'saumen@gmail.com', 'Super Admin', '103.242.189.206', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 04:55:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (15, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 05:42:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (16, 'saumen@gmail.com', 'Super Admin', '2409:40e3:40e6:58f6:21f5:2e42:806b:3601', 'Chrome 137.0.0.0, Windows 10', '2025-07-02 05:54:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (17, 'saumen@gmail.com', 'Super Admin', '103.77.139.193', 'Chrome 137.0.0.0, Windows 10', '2025-07-02 06:03:03');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (18, 'saumen@gmail.com', 'Super Admin', '103.77.139.193', 'Chrome 137.0.0.0, Windows 10', '2025-07-02 06:03:25');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (19, 'saumen@gmail.com', 'Super Admin', '45.124.4.181', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 06:08:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (20, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Firefox 140.0, Windows 10', '2025-07-02 06:40:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (21, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 07:02:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (22, 'swati.das@healthpoint.com', 'Doctor', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:07:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (23, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:09:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (24, 'swati.das@healthpoint.com', 'Doctor', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:18:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (25, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:18:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (26, 'swati.das@healthpoint.com', 'Doctor', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:19:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (27, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:21:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (28, 'naveen.reddy@medilife.in', 'Doctor', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:29:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (29, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 08:31:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (30, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 09:29:33');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (31, 'saumen@gmail.com', 'Super Admin', '223.185.29.80', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 09:31:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (32, 'saumen@gmail.com', 'Super Admin', '115.187.40.45', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 09:52:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (33, 'saumen@gmail.com', 'Super Admin', '103.242.189.206', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 10:23:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (34, 'saumen@gmail.com', 'Super Admin', '103.242.189.206', 'Chrome 138.0.0.0, Windows 10', '2025-07-02 11:19:39');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text DEFAULT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (4, 4, 'pat4', '5psax5', NULL, 'patient', '', 'yes', '2025-07-01 14:10:14');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (5, 5, 'pat5', '64sv51', NULL, 'patient', '', 'yes', '2025-07-01 14:11:52');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (6, 6, 'pat6', 'yingrs', NULL, 'patient', '', 'yes', '2025-07-02 02:45:47');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (7, 7, 'pat7', '90xynn', NULL, 'patient', '', 'yes', '2025-07-02 02:57:15');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (8, 8, 'pat8', '4ndf38', NULL, 'patient', '', 'yes', '2025-07-02 04:57:54');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (9, 9, 'pat9', '7xo6ar', NULL, 'patient', '', 'yes', '2025-07-02 05:01:38');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (10, 10, 'pat10', 'w5tsqc', NULL, 'patient', '', 'yes', '2025-07-02 05:03:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (11, 11, 'pat11', '0zh0cb', NULL, 'patient', '', 'yes', '2025-07-02 06:10:43');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (12, 12, 'pat12', 'w6tdzj', NULL, 'patient', '', 'yes', '2025-07-02 07:48:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (13, 13, 'pat13', '2aqeo1', NULL, 'patient', '', 'yes', '2025-07-02 08:56:41');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (14, 14, 'pat14', '1spizq', NULL, 'patient', '', 'yes', '2025-07-02 09:26:43');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (15, 15, 'pat15', 'exhozo', NULL, 'patient', '', 'yes', '2025-07-02 10:46:45');


#
# TABLE STRUCTURE FOR: users_authentication
#

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `token` varchar(200) NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_vehicle_no` (`vehicle_no`),
  KEY `index_vehicle_model` (`vehicle_model`),
  KEY `index_manufacture_year` (`manufacture_year`),
  KEY `index_vehicle_type` (`vehicle_type`),
  KEY `index_driver_name` (`driver_name`),
  KEY `index_driver_licence` (`driver_licence`),
  KEY `index_driver_contact` (`driver_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: visit_details
#

DROP TABLE IF EXISTS `visit_details`;

CREATE TABLE `visit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opd_details_id` int(11) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `patient_charge_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `cons_doctor` int(11) DEFAULT NULL,
  `case_type` varchar(200) NOT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `symptoms_type` int(11) DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `pulse` varchar(200) DEFAULT NULL,
  `temperature` varchar(200) DEFAULT NULL,
  `respiration` varchar(200) DEFAULT NULL,
  `known_allergies` varchar(100) DEFAULT NULL,
  `patient_old` varchar(50) DEFAULT NULL,
  `casualty` varchar(200) DEFAULT NULL,
  `refference` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `note_remark` mediumtext DEFAULT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `live_consult` varchar(50) DEFAULT NULL,
  `is_antenatal` int(11) NOT NULL,
  `can_delete` varchar(11) NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `generated_by` (`generated_by`),
  KEY `opd_details_id` (`opd_details_id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `cons_doctor` (`cons_doctor`),
  KEY `patient_charge_id` (`patient_charge_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `index_case_type` (`case_type`),
  KEY `index_appointment_date` (`appointment_date`),
  KEY `index_symptoms_type` (`symptoms_type`),
  KEY `index_bp` (`bp`),
  KEY `index_height` (`height`),
  KEY `index_weight` (`weight`),
  KEY `index_pulse` (`pulse`),
  KEY `index_temperature` (`temperature`),
  KEY `index_respiration` (`respiration`),
  KEY `index_known_allergies` (`known_allergies`),
  KEY `index_patient_old` (`patient_old`),
  KEY `index_casualty` (`casualty`),
  KEY `index_refference` (`refference`),
  KEY `index_date` (`date`),
  KEY `index_payment_mode` (`payment_mode`),
  KEY `index_generated_by` (`generated_by`),
  KEY `index_live_consult` (`live_consult`),
  KEY `index_is_antenatal` (`is_antenatal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (1, 1, NULL, 1, 1, 2, '', '2025-06-18 01:19:00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'no', '', NULL, '', NULL, 'Cash', 1, 'no', 0, 'no', '2025-06-17 19:50:10');
INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (2, 2, NULL, 2, 2, 8, '', '2025-07-03 10:25:00', 2, 'Fever\r\n', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'no', 'tt', NULL, '', NULL, 'Cash', 1, 'no', 0, 'no', '2025-07-02 04:58:25');
INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (3, 3, NULL, 3, 3, 9, '', '2025-07-04 10:31:00', NULL, 'Shortness of Breath\r\n', NULL, NULL, NULL, NULL, NULL, NULL, '', 'no', 'no', '', NULL, '', NULL, 'Cash', 1, 'no', 0, 'no', '2025-07-02 05:02:27');
INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (4, 4, NULL, 4, 4, 9, '', '2025-07-07 10:33:00', NULL, 'Chest Pain\r\n\r\n\r\nJoint Pain\r\n', NULL, NULL, NULL, NULL, NULL, NULL, '', 'no', 'no', '', NULL, '', NULL, 'Cash', 1, 'no', 0, 'no', '2025-07-02 05:04:04');
INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (5, 5, NULL, 5, 5, 12, '', '2025-07-07 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 'no', 0, 'no', '2025-07-02 08:51:24');
INSERT INTO `visit_details` (`id`, `opd_details_id`, `organisation_id`, `patient_charge_id`, `transaction_id`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms_type`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `patient_old`, `casualty`, `refference`, `date`, `note`, `note_remark`, `payment_mode`, `generated_by`, `live_consult`, `is_antenatal`, `can_delete`, `created_at`) VALUES (6, 6, NULL, 6, 6, 12, '', '2025-07-02 19:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 'no', 0, 'no', '2025-07-02 09:01:40');


#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `visit_to` varchar(20) NOT NULL,
  `ipd_opd_staff_id` int(11) DEFAULT NULL,
  `related_to` varchar(60) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_source` (`source`),
  KEY `index_purpose` (`purpose`),
  KEY `index_name` (`name`),
  KEY `index_email` (`email`),
  KEY `index_contact` (`contact`),
  KEY `index_id_proof` (`id_proof`),
  KEY `index_visit_to` (`visit_to`),
  KEY `index_related_to` (`related_to`),
  KEY `index_no_of_pepple` (`no_of_pepple`),
  KEY `index_date` (`date`),
  KEY `index_in_time` (`in_time`),
  KEY `index_out_time` (`out_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_visitors_purpose` (`visitors_purpose`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`, `created_at`) VALUES (1, 'New Patient Registration', 'For first-time visitors to the hospital/clinic.', '2025-07-02 11:32:02');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`, `created_at`) VALUES (2, 'Appointment Booking', 'Scheduling a consultation with a doctor or department.', '2025-07-02 11:32:02');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`, `created_at`) VALUES (3, 'Medical Report Collection', 'Collecting lab or diagnostic reports.', '2025-07-02 11:32:02');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`, `created_at`) VALUES (4, 'Admission Request', 'Requesting or processing inpatient admission.', '2025-07-02 11:32:02');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`, `created_at`) VALUES (5, 'Discharge Process', 'Completing discharge formalities and collecting documents.', '2025-07-02 11:32:02');


#
# TABLE STRUCTURE FOR: vitals
#

DROP TABLE IF EXISTS `vitals`;

CREATE TABLE `vitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `unit` varchar(11) DEFAULT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `index_name` (`name`),
  KEY `index_reference_range` (`reference_range`),
  KEY `index_unit` (`unit`),
  KEY `index_is_system` (`is_system`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `vitals` (`id`, `name`, `reference_range`, `unit`, `is_system`, `created_at`) VALUES (1, 'Height', '1  -  200', 'Centimeters', 1, '2024-03-14 06:03:18');
INSERT INTO `vitals` (`id`, `name`, `reference_range`, `unit`, `is_system`, `created_at`) VALUES (2, 'Weight', '0  -  150', 'Kilograms', 1, '2024-05-20 09:06:24');
INSERT INTO `vitals` (`id`, `name`, `reference_range`, `unit`, `is_system`, `created_at`) VALUES (3, 'Pulse ', '70 -   100 ', 'Beats per', 1, '2024-03-07 11:27:43');
INSERT INTO `vitals` (`id`, `name`, `reference_range`, `unit`, `is_system`, `created_at`) VALUES (4, 'Temperature', '95.8  -  99.3', 'Fahrenheit ', 1, '2024-05-16 10:59:30');
INSERT INTO `vitals` (`id`, `name`, `reference_range`, `unit`, `is_system`, `created_at`) VALUES (5, 'BP', '90/60  -  140/90', 'mmHg', 1, '2024-03-07 11:27:48');


#
# TABLE STRUCTURE FOR: zoom_settings
#

DROP TABLE IF EXISTS `zoom_settings`;

CREATE TABLE `zoom_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoom_api_key` varchar(200) DEFAULT NULL,
  `zoom_api_secret` varchar(200) DEFAULT NULL,
  `use_doctor_api` int(11) DEFAULT 1,
  `use_zoom_app` int(11) DEFAULT 1,
  `opd_duration` int(11) DEFAULT NULL,
  `ipd_duration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `zoom_settings` (`id`, `zoom_api_key`, `zoom_api_secret`, `use_doctor_api`, `use_zoom_app`, `opd_duration`, `ipd_duration`, `created_at`) VALUES (1, '', '', 0, 0, 0, 0, '2021-10-29 09:58:05');


