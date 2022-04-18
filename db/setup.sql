
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    fullname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    refresh_token TEXT NOT NULL,
    status SMALLINT DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)  NOT NULL,
    machine_name VARCHAR(255) UNIQUE NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE users_roles (
    "usersId" INTEGER REFERENCES users (id),
    "rolesId" INTEGER REFERENCES roles (id)
);

INSERT INTO roles (machine_name, name) VALUES 
('master_admin', 'Master Admin'),
('admin', 'Admin'),
('company_manager', 'Company Manager'),
('customer', 'Customer'),
('vendor', 'Vendor'),
('consumer', 'Consumer');

CREATE TABLE emails_otp (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    token TEXT NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE colors_pallete (
    id SERIAL PRIMARY KEY,
    primary_color VARCHAR(6) NOT NULL,
    secodary_color VARCHAR(6) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE brandings (
    id SERIAL PRIMARY KEY,
    logo varchar(255) NOT NULL,
    "colorId" INTEGER REFERENCES colors_pallete (id) DEFAULT NULL,
    "companiesId" INTEGER REFERENCES colors_pallete (id) DEFAULT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(255) UNIQUE NOT NULL,
    url VARCHAR(255) UNIQUE NOT NULL,
    pan VARCHAR(10) UNIQUE NOT NULL,
    "brandingsId" INTEGER REFERENCES brandings (id) DEFAULT NULL,
    created_by INTEGER REFERENCES users (id) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE offices (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    gst_no VARCHAR(255) DEFAULT NULL,
    gst_address TEXT DEFAULT NULL,
    "companiesId" INTEGER REFERENCES companies (id) DEFAULT NULL,
    created_by INTEGER REFERENCES users (id) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE units (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    machine_name VARCHAR(255)
);

CREATE TABLE unit_users (
    "unitsId" INTEGER REFERENCES units (id),
    "usersId" INTEGER REFERENCES users (id)
);

CREATE TABLE companies_users_roles (
    id SERIAL PRIMARY KEY,
    "companiesId" INTEGER REFERENCES companies (id),
    "userId" INTEGER REFERENCES users (id),
    "roleId" INTEGER REFERENCES roles (id),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE offices_users (
    "officesId" INTEGER REFERENCES offices (id),
    "usersId" INTEGER REFERENCES users (id)
);
 


