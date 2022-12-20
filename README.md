# CSP Portal

### Steps to run the app

- run the spring boot application
- access the h2 inmemory database console - ```http://localhost:8080/h2-ui/login.do``` and click on connect button.
- run below commands to insert the basic roles:

```agsl
INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');

-- Pre-inset one admin user, username: admin, password: admin123 (minimum password length is 6 char)
insert into users (id, email, password, username) values (1, 'admin@gmail.com', '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'admin');
insert into user_roles (user_id, role_id) values(1, 2);
```
- using postman, register an admin user.
- open the CSP portal - ```http://localhost:8080/csp``` which redirects to login page
- click on signup link or use - ```http://localhost:8080/csp/usersignup``` to register yourself