import sqlite3
conn = sqlite3.connect('princess.db') # Warning: This file is created in the current directory

conn.execute("DROP TABLE if exists User")
conn.execute("DROP TABLE if exists GameHistory ")
conn.execute("DROP TABLE if exists Questions")
conn.execute("DROP TABLE if exists Answers")
conn.execute("DROP TABLE if exists Options")

conn.execute("CREATE TABLE User (UserID INTEGER PRIMARY KEY AUTOINCREMENT, EmailAddress nvarchar(300) , CurrentGameLevel char(1000) )")

conn.execute("CREATE TABLE GameHistory (UserID INTEGER PRIMARY KEY AUTOINCREMENT , QuestionID INTEGER)")

conn.execute("CREATE TABLE Questions (QuestionID INTEGER PRIMARY KEY,Question nvarchar(500)  , GameLevel char(1000) )")

conn.execute("CREATE TABLE Answers (QuestionID INTEGER PRIMARY KEY, CorrectOptionID char(30) )")

conn.execute("CREATE TABLE Options (OptionID char(30)   , QuestionID INTEGER, Options_value CHAR(100))")





conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (1,'Which insect inspired the term computer bug?','EntryLevel')")
conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (2,'Which of these U.S. presidents appeared on the television series LaughIn ? ','EntryLevel')")
conn.execute ("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (3,'which of the following landlocked countries is entirely contained within another country?', 'EntryLevel')")
conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (4,'who is credited with inventing the first mass produced helicopter?','MidLevel')")
conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (5,'What letter must appear at the beginning of the registration number of all non-military aircraft in the U.S.?','MidLevel')")
conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (6,'Who did artist Grant Wood use as the model for the farmer in his classic painting an American Gothic?','MidLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (7,'The U.S. icon Uncle sam was based on samuel wilson,who worked during the war of 1812 as a what?','MidLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (8,'Which of the following men does not have a chemical element named after him?','MidLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (9,'Where should choking victims place their hands to indicate to others that they need help?' , 'MidLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (10,'In the Road Runner and Coyote; cartoons, what famous sound does the Road Runner make?','MidLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (11,'Which of these dance names is used to describe a fashionable dot?','HighLevel')")

conn.execute("INSERT into Questions(QuestionID,Question,GameLevel) VALUES (12,'What is the only position on a football team that can be sacked? ',  'HighLevel')")





conn.execute("Insert into GameHistory(QuestionID) values (1)")
conn.execute("Insert into GameHistory(QuestionID) values (2)")
conn.execute("Insert into GameHistory(QuestionID) values (3)")
conn.execute("Insert into GameHistory(QuestionID) values (4)")
conn.execute("Insert into GameHistory(QuestionID) values (5)")
conn.execute("Insert into GameHistory(QuestionID) values (6)")
conn.execute("Insert into GameHistory(QuestionID) values (7)")
conn.execute("Insert into GameHistory(QuestionID) values (8)")
conn.execute("Insert into GameHistory(QuestionID) values (9)")
conn.execute("Insert into GameHistory(QuestionID) values (10)")
conn.execute("Insert into GameHistory(QuestionID) values (11)")
conn.execute("Insert into GameHistory(QuestionID) values (12)")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',1,'Moth')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',1,'Cockroach')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',1,'Fly')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',1,'Beetle')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',2,'Lyndon Johnson')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',2,'Richard Nixon')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',2,'Jimmy carter')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',2,'Gerald Ford')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',3,'Lesotho')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',3,'Burkina Faso')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',3,'Mongolia')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',3,'Luxembourg')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',4,'Igor sikorsky')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',4,'Elmer sperry')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',4,'ferdinard von zeppelin')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',4,'Gottlieb Daimler')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',5,'N')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',5,'A')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',5,'U')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',5,'L')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',6,'Traveling  Salesman')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',6,'Local  Sheriff')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',6,'His dentist')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',6,'His butcher')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',7,'Meat Inspector')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',7,'Mail deliver')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',7,'Historian')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',7,'Weapons Mechanic')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',8,'Albert Einstein')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',8,'Niels bohr')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',8,'Issac Newton')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',8,'Enrico Fermi')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',9,'Over the eyes')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',9,'On the knees')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',9,'Around the throat')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',9,'On the hips?')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',10,'ping!ping!')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',10,'beep!beep!')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',10,'Aooga!Aooga!')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',10,'Vroom!Vroom!')")

conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',11,'Hora')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',11,'Swing')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',11,'Lambada')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',11,'Polka')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('A',12,'Center')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('B',12,'Wide receiver')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('C',12,'Tight End')")
conn.execute("Insert into Options(OptionID,QuestionID,Options_value) values ('D',12,'Quarter back')")



conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (1,'A')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (2,'B')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (3,'A')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (4,'A')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (5,'A')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (6,'C')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (7,'A')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (8,'C')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (9,'C')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (10,'B')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (11,'D')")
conn.execute("Insert into Answers(QuestionID,CorrectOptionID) values (12,'D')")


conn.execute("insert into User (EmailAddress,CurrentGameLevel) values ('eg46shrsr@gmail.com','Entrylevel')")
conn.execute("insert into User (EmailAddress,CurrentGameLevel) values ('gxhxjyj@gmail.com','MidLevel')")
conn.execute("insert into User (EmailAddress,CurrentGameLevel) values ('seystuhsrtu@gmail.com','HighLevel')")

conn.commit()








