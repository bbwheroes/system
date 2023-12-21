CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "github_id" int UNIQUE NOT NULL,
  "bbw_email" varchar(255) UNIQUE,
  "discord_id" varchar(255) UNIQUE
);

CREATE TABLE "projects" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "owner_id" int NOT NULL,
  "module" int NOT NULL,
  "teacher" varchar(255) NOT NULL,
  "task_name" varchar(255) NOT NULL,
  "slugified_task_name" varchar(255) NOT NULL,
  "username" varchar(255) NOT NULL,
  "open_proposal" bool NOT NULL DEFAULT false
);

CREATE TABLE "proposals" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "project_id" int NOT NULL,
  "type" varchar(255) NOT NULL,
  "data" json NOT NULL
);

CREATE TABLE "activities" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "activity" varchar(255) NOT NULL,
  "message" text NOT NULL,
  "points_gained" int NOT NULL
);

CREATE TABLE "portainer_machines" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "project_id" int NOT NULL,
  "compose_file_path" varchar(255) NOT NULL
);

CREATE TABLE "portainer_machine_secrets" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "portainer_machine_id" int NOT NULL,
  "name" varchar(255) NOT NULL,
  "value" text NOT NULL
);

CREATE TABLE "dns_services" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "project_id" int NOT NULL,
  "subdomain" varchar(255) UNIQUE NOT NULL,
  "to_github" bool NOT NULL
);

ALTER TABLE "projects" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "proposals" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");

ALTER TABLE "activities" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "portainer_machines" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");

ALTER TABLE "portainer_machine_secrets" ADD FOREIGN KEY ("portainer_machine_id") REFERENCES "portainer_machines" ("id");

ALTER TABLE "dns_services" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");
