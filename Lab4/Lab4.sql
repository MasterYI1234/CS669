Create Table person(
person_id decimal(12) PRIMARY KEY NOT NULL,
first_name varchar(32) NOT NULL,
last_name varchar(32) NOT NULL,
username varchar(20) NOT NULL);


Create Table post(
post_id decimal(12) PRIMARY KEY NOT NULL,
person_id decimal(12) NOT NULL,
content varchar(255) NOT NULL,
created_on DATE NOT NULL,
summary varchar(15) NOT NULL,
FOREIGN KEY(person_id) REFERENCES person(person_id));


Create Table likes(
likes_id decimal(12) PRIMARY KEY NOT NULL,
person_id decimal(12) NOT NULL,
post_id decimal(12) NOT NULL,
liked_on DATE,
FOREIGN KEY(person_id) REFERENCES person(person_id),
FOREIGN KEY(post_id) REFERENCES post(post_id));


--person
Insert into person Values(1,'SiCheng','Yi','masteryi');
Insert into person Values(2,'Brian','Todd','todd');
Insert into person Values(3,'Judy','Date','judy');
Insert into person Values(4,'LiPing','He','pingping');
Insert into person Values(5,'Peter','Marsh','peter');

--post
Insert into post Values(1,1,'I Like This T-shirt', CAST('4/1/2015' AS DATE),'I like this ...');
Insert into post Values(2,1,'Do not do this things', CAST('8/3/2018' AS DATE),'Do not do th...');
Insert into post Values(3,2,'Look at these animals', CAST('9/7/2017' AS DATE),'Look at thes...');
Insert into post Values(4,3,'Big News For Boston', CAST('3/8/2020' AS DATE),'Big News for...');
Insert into post Values(5,3,'Enjoy these ice creams', CAST('2/7/2012' AS DATE),'Enjoy these ...');
Insert into post Values(6,4,'I like playing soccer', CAST('1/8/2020' AS DATE),'I like playi...');
Insert into post Values(7,4,'New semester is comming', CAST('9/6/2021' AS DATE),'New semester...');
Insert into post Values(8,5,'It is snow now', CAST('12/7/2018' AS DATE),'It is snow n...');



--likes
Insert into likes Values(1,1,1,CAST('2/7/2022' AS DATE));
Insert into likes Values(2,2,3,CAST('3/7/2022' AS DATE));
Insert into likes Values(3,3,5,CAST('4/7/2022' AS DATE));
Insert into likes Values(4,4,7,CAST('5/7/2022' AS DATE));
Insert into likes Values(5,5,8,CAST('6/7/2022' AS DATE));


Create Procedure add_zana_sage
AS
BEGIN
  Insert into person(person_id,first_name,last_name,username)
  Values(6,'Zana','Sage','zanasage');
END;

EXECUTE add_zana_sage

SELECT * from person;



Create Procedure add_person
  @usid DECIMAL,
  @FNAME VARCHAR(30),
  @LNAME VARCHAR(40),
  @UNAME VARCHAR(40)
AS
BEGIN
  Insert into person(person_id,first_name,last_name,username)
  VALUES(@usid,@FNAME,@LNAME,@UNAME);
END;

EXECUTE add_person 7,'Mary','Smith','marysmith';

SELECT * from person;



Create Procedure add_post
  @poid DECIMAL(12),
  @persid DECIMAL(12),
  @content VARCHAR(64),
  @creatd DATE
AS
BEGIN
  DECLARE @sum VARCHAR(20) 
  SET @sum = CONCAT(SUBSTRING(@content,1,12),'...')
  INSERT INTO post(post_id,person_id,content,created_on,summary)
  VALUES(@poid,@persid,@content,@creatd,@sum);
END;
GO

EXECUTE add_post 9,5,'Hello everyone','5/7/2021';

SELECT * from post;



Create Procedure add_like
  @liid  DECIMAL(12),
  @poid DECIMAL(12),
  @username VARCHAR(20),
  @lion DATE
AS
BEGIN
  DECLARE @v_personid DECIMAL(12);

  SELECT @v_personid = person_id
  FROM person
  WHERE username = @username;

  Insert into likes(likes_id,person_id,post_id,liked_on)
  VALUES(@liid,@v_personid,@poid,@lion);
END;
GO

add_like 6,8,'peter','4/6/2020';

SELECT * FROM likes;



Create Procedure delete_person
  @username VARCHAR(20)
AS
BEGIN

  DELETE FROM post
  Where person_id IN (SELECT person_id
                      FROM person
					  Where username = @username);

  DELETE FROM likes 
  Where person_id IN (SELECT person_id
                      FROM person
					  Where username = @username);

  DELETE FROM person
  Where username = @username;
END;
GO

EXECUTE delete_person 'peter';

SELECT * FROM person 
JOIN post ON person.person_id = post.person_id
JOIN likes ON person.person_id = likes.person_id
Where username = 'peter'



Create TRIGGER checksummary
ON post AFTER INSERT,UPDATE
AS
BEGIN
  DECLARE @sum VARCHAR(15);
  SET @sum = (SELECT INSERTED.summary FROM INSERTED);
  DECLARE @post VARCHAR(255)
  SET @post= (SELECT INSERTED.content FROM INSERTED);
  
  IF (@sum != CONCAT(SUBSTRING(@post,1,12),'...'))
  BEGIN
    ROLLBACK;
	RAISERROR('SUMMARY NOT RIGHT FORMAT!',14,1);
  END;
END;

Insert into post Values(9,6,'Look at these animals', CAST('9/7/2017' AS DATE),'I like this ...');

Insert into post Values(9,6,'Look at these animals', CAST('9/7/2017' AS DATE),'Look at thes...');

SELECT * FROM post;



Create TRIGGER checklike
ON likes AFTER INSERT,UPDATE
AS
BEGIN
  DECLARE @likeon DATE;
  DECLARE @createdon DATE;
  SELECT @likeon = INSERTED.liked_on FROM INSERTED;
  SELECT @createdon = created_on 
  FROM post 
  JOIN INSERTED ON INSERTED.post_id = post.post_id;

  IF @likeon<@createdon
  BEGIN
    ROLLBACK;
	RAISERROR('The like on date is earlyer than created on date!',14,1);
  END;
END;

Insert into likes Values(5,2,3,CAST('2/7/1997' AS DATE));

Insert into likes Values(5,2,3,CAST('2/7/2022' AS DATE));

SELECT * FROM likes;



Create Table post_content_history(
post_id DECIMAL(12) NOT NULL,
old_post_content VARCHAR(255) NOT NULL,
new_post_content VARCHAR(255) NOT NULL,
changed_date DATE NOT NULL,
FOREIGN KEY(post_id) REFERENCES post(post_id));



Create TRIGGER updatehis
ON post AFTER UPDATE
AS
BEGIN
  DECLARE @oldcontent VARCHAR(255);
  SELECT @oldcontent = post.content
  FROM post,INSERTED
  WHERE post.post_id = INSERTED.post_id;
  DECLARE @newcontent VARCHAR(255) = (SELECT content FROM INSERTED);
  DECLARE @poid DECIMAL(12) = (SELECT post_id FROM INSERTED);

  IF @oldcontent <> @newcontent
  BEGIN
    Insert into post_content_history(post_id,old_post_content,new_post_content,changed_date)
	VALUES(@poid,@oldcontent,@newcontent,GETDATE());
  END;
END;
GO

UPDATE post
SET content='Small News for Boston', summary='Small News f...' 
Where post_id = 4;

SELECT * FROM post_content_history
JOIN post on post.post_id = post_content_history.post_id;


