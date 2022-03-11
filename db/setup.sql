CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    refresh_token VARCHAR(255) NULL,
    status SMALLINT DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);



CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    machine_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255)  NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE user_roles (
    user_id INTEGER REFERENCES users (id),
    role_id INTEGER REFERENCES roles (id)
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
    otp VARCHAR(6) NOT NULL,
    otp_token VARCHAR(255) NOT NULL,
    expiry BIGINT NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);