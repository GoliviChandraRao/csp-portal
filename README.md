# CSP Portal

### Steps to run the app

- run the spring boot application
- access the h2 inmemory database console - ```http://localhost:8080/h2-ui/login.do``` and click on connect button.
- run below commands to insert the basic roles:

```agsl
INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');

-- Pre-inset one admin user, username: admin, password: admin123 (minimum password length is 6 char)
insert into users (id, email, password, username) values (101, 'admin@gmail.com', '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'admin');
insert into user_roles (user_id, role_id) values(101, 2);
```
<img width="939" alt="image" src="https://user-images.githubusercontent.com/116070875/208569518-0b4dce95-cf0b-451e-b4e7-e2b85422249b.png">

- open the CSP portal - ```http://localhost:8080/csp``` which redirects to login page
- click on signup link or use - ```http://localhost:8080/csp/usersignup``` to register yourself

Admin pages will be accessed by only admin, Citizen pages will be accessed only by citizen. Only citizen can register, an admin account will be pre-inserted in database. User registration defaults to citizen. Once logged into the portal we must logout to see the login/register page. without logout citizen will be landed on home pages(birth certificate related pages) of respective user roles(user or admin)
