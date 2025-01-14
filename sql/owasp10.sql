DROP TABLE IF EXISTS "risks";
DROP SEQUENCE IF EXISTS risks_id_seq;
CREATE SEQUENCE risks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."risks" (
    "id" integer DEFAULT nextval('risks_id_seq') NOT NULL,
    "risk_id" integer NOT NULL,
    "risk_position" integer NOT NULL,
    "risk_name" text NOT NULL,
    "risk_descr" text NOT NULL,
    CONSTRAINT "risks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "risks_risk_id" ON "public"."risks" USING btree ("risk_id");

INSERT INTO "risks" ("risk_id", "risk_position", "risk_name", "risk_descr") VALUES
(1, 1,	'A01:2021-Broken Access Control',	'A01:2021-Broken Access Control moves up from the fifth position; 94% of applications were tested for some form of broken access control. The 34 Common Weakness Enumerations (CWEs) mapped to Broken Access Control had more occurrences in applications than any other category.'),
(2, 2,	'A02:2021-Cryptographic Failures',	'A02:2021-Cryptographic Failures shifts up one position to #2, previously known as Sensitive Data Exposure, which was broad symptom rather than a root cause. The renewed focus here is on failures related to cryptography which often leads to sensitive data exposure or system compromise.'),
(3, 3,	'A03:2021-Injection',	'A03:2021-Injection slides down to the third position. 94% of the applications were tested for some form of injection, and the 33 CWEs mapped into this category have the second most occurrences in applications. Cross-site Scripting is now part of this category in this edition.'),
(4, 4, 'A04:2021-Insecure Design',	'A04:2021-Insecure Design is a new category for 2021, with a focus on risks related to design flaws. If we genuinely want to “move left” as an industry, it calls for more use of threat modeling, secure design patterns and principles, and reference architectures.'),
(5,	5, 'A05:2021-Security Misconfiguration', 'A05:2021-Security Misconfiguration moves up from #6 in the previous edition; 90% of applications were tested for some form of misconfiguration. With more shifts into highly configurable software, it’s not surprising to see this category move up. The former category for XML External Entities (XXE) is now part of this category.'),
(6, 6, 'A06:2021-Vulnerable and Outdated Components', 'A06:2021-Vulnerable and Outdated Components was previously titled Using Components with Known Vulnerabilities and is #2 in the Top 10 community survey, but also had enough data to make the Top 10 via data analysis. This category moves up from #9 in 2017 and is a known issue that we struggle to test and assess risk. It is the only category not to have any Common Vulnerability and Exposures (CVEs) mapped to the included CWEs, so a default exploit and impact weights of 5.0 are factored into their scores.'),
(7,	7, 'A07:2021-Identification and Authentication Failures', 'A07:2021-Identification and Authentication Failures was previously Broken Authentication and is sliding down from the second position, and now includes CWEs that are more related to identification failures. This category is still an integral part of the Top 10, but the increased availability of standardized frameworks seems to be helping.'),
(8,	8, 'A08:2021-Software and Data Integrity Failures', 'A08:2021-Software and Data Integrity Failures is a new category for 2021, focusing on making assumptions related to software updates, critical data, and CI/CD pipelines without verifying integrity. One of the highest weighted impacts from Common Vulnerability and Exposures/Common Vulnerability Scoring System (CVE/CVSS) data mapped to the 10 CWEs in this category. Insecure Deserialization from 2017 is now a part of this larger category.'),
(9,	9, 'A09:2021-Security Logging and Monitoring Failures', 'A09:2021-Security Logging and Monitoring Failures was previously Insufficient Logging & Monitoring and is added from the industry survey (#3), moving up from #10 previously. This category is expanded to include more types of failures, is challenging to test for, and isn’t well represented in the CVE/CVSS data. However, failures in this category can directly impact visibility, incident alerting, and forensics.'),
(10, 10, 'A10:2021-Server-Side Request Forgery', 'A10:2021-Server-Side Request Forgery is added from the Top 10 community survey (#1). The data shows a relatively low incidence rate with above average testing coverage, along with above-average ratings for Exploit and Impact potential. This category represents the scenario where the security community members are telling us this is important, even though it’s not illustrated in the data at this time.');

DROP TABLE IF EXISTS "hosts";
DROP SEQUENCE IF EXISTS hosts_id_seq;
CREATE SEQUENCE hosts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."hosts" (
    "id" integer DEFAULT nextval('hosts_id_seq') NOT NULL,
    "host_ip" character(15) NOT NULL,
    "risk_id" integer NOT NULL,
    "scan_date" timestamp NOT NULL,
    CONSTRAINT "hosts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


INSERT INTO "hosts" ("id", "host_ip", "risk_id", "scan_date") VALUES
(1,	'8.8.8.8', 1, '2024-05-27 10:02:13'),
(2,	'8.8.8.8', 3, '2024-05-27 11:02:13'),
(3,	'1.1.1.1', 2, '2024-05-27 10:02:13'),
(4,	'2.2.2.2', 3, '2024-05-27 10:02:13');
