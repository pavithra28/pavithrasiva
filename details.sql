create database details;
use details;
create table userdetails (Username varchar(200),Passwrd varchar(200),email varchar(200),Phonenumber double  );
insert into userdetails(Username,Passwrd,email,Phonenumber) values ('Jeshwanth','aeos','jeswanth@gmail.com',9634567802),
                                                                    ('Sravya','sra','srav123@gmail.com',8789654322),
                                                                    ('Pavithra','pavi','pavi@gmail.com',9626758341),
                                                                    ('Pretesh','pre','pretesh@gmail.com',7658901234),
                                                                    ('Siva','siv','sivasamy@gmailcom',678904321),
                                                                    ('Bilu','bil','bilal@gmail.com',8907651234),
                                                                    ('lavanya','lava','lavanya@gmail.com',9012873456);
create table accountdetails(Accno double,Username varchar(200),Typeofacc varchar(200));
insert into accountdetails(Accno,Username,Typeofacc) values (9012893,'Jeshwanth','Savings'),
                                                            (2345678,'Sravya','Current'),
                                                            (0987123,'Pavithra','Savings'),
                                                            (6712340,'Pretesh','Savings'),
                                                            (8902342,'Siva','Current'),
                                                            (0981235,'Bilu','Savings'),
                                                            (8769012,'Lavanya','Savings');
create table transfer(Accno double,Operation varchar(200),Balance double);
insert into  transfer(Accno,Operation,Balance) values(9012883,'Withdraw',250000),
                                                     (2345688,'Withdraw',30000),
                                                     (0987133,'Deposit',50000),
                                                     (6712350,'Deposit',80000),
                                                     (8902362,'Withdraw',90000),
                                                     (0981205,'Withdraw',10000),
                                                     (8769011,'Deposit',20000);
                                                     
