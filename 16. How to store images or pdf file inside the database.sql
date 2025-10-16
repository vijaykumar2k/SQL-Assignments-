use regexdb;

create table files (
    id int auto_increment primary key,
    file_name varchar(255),
    file_data longblob
);

insert into files (file_name, file_data)
values ('file.pdf', load_file('c:/users/iamvi/onedrive/desktop/data science/sql work/file.pdf'));

insert into files (file_name, file_data)
values ('image.jpg', load_file('c:/users/iamvi/onedrive/desktop/data science/sql work/image.jpg'));

select * from files;
