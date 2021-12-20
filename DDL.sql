create table user
	(email			varchar(254),
	 password		varchar(20),
	 country		varchar(20),
	 province		varchar(20),
	 city			varchar(20),
	 street			varchar(20),
	 street_num		numeric(6),
	 apt_num		numeric(6),
	 postal_code	varchar(6),
	 card_num		numeric(16),
	 primary key (email),
	 foreign key (card_num) references card
	);

create table card
	(card_num		numeric(16),
	 first_name		varchar(20),
	 last_name		varchar(20),
	 middle_name	varchar(20),
	 country		varchar(20),
	 province		varchar(20),
	 city			varchar(20),
	 street			varchar(20),
	 street_num		numeric(6),
	 apt_num		numeric(6),
	 postal_code	varchar(6),
	 cvn			numeric(3),
	 primary key (card_num)
	);

create table publisher
	(supplier_num	numeric(9),
	 name			varchar(20),
	 email			varchar(254),
	 country		varchar(20),
	 province		varchar(20),
	 city			varchar(20),
	 street			varchar(20),
	 street_num		numeric(6),
	 apt_num		numeric(6),
	 postal_code	varchar(6),
	 phone			numeric(13),
	 bank			varchar(64),
	 bank_acc_num	varchar(64),
	 primary key (supplier_num)
	);

create table order
	(order_num		numeric(9),
	 email			varchar(254),
	 cost			numeric(10,2),
	 status			varchar(20),
	 time_placed	timestamp default current_timestamp,
	 time_shipped	timestamp,
	 time_delivered	timestamp,
	 primary key (order_num),
	 foreign key (email) references user
	);

create table book
	(isbn				varchar(13),
	 supplier_num		numeric(9),
	 title				varchar(64),
	 genre				varchar(20),
	 page_count			integer,
	 publisher_percent	numeric(2),
	 target_stock		integer,
	 current_stock		integer,
	 reorder_stock		integer,
	 primary key (isbn),
	 foreign key (supplier_num) references publisher
	);

create table ordered_items
	(order_num			numeric(9),
	 isbn				varchar(13),
	 quantity			integer,
	 primary key (order_num, isbn),
	 foreign key (order_num) references order,
	 foreign key (isbn) references book
	);

create table authors
	(isbn				varchar(13),
	 author				varchar(64),
	 primary key (author, isbn),
	 foreign key (isbn) references book
	);