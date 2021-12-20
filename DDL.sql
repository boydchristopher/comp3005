create table user
	(email			varchar(254),
	 password		varchar(20) not null,
	 country		varchar(20),
	 province		varchar(20),
	 city			varchar(20),
	 street			varchar(20),
	 street_num		integer,
	 apt_num		integer,
	 postal_code	varchar(6),
	 card_num		numeric(16),
	 primary key (email),
	 foreign key (card_num) references card
	);

create table card
	(card_num		numeric(16),
	 first_name		varchar(20) not null,
	 last_name		varchar(20) not null,
	 middle_name	varchar(20) not null,
	 country		varchar(20) not null,
	 province		varchar(20) not null,
	 city			varchar(20) not null,
	 street			varchar(20) not null,
	 street_num		integer not null,
	 apt_num		integer,
	 postal_code	varchar(6) not null,
	 cvn			numeric(3) not null,
	 primary key (card_num)
	);

create table publisher
	(supplier_num	numeric(9),
	 name			varchar(20) not null,
	 email			varchar(254),
	 country		varchar(20),
	 province		varchar(20),
	 city			varchar(20),
	 street			varchar(20),
	 street_num		integer,
	 apt_num		integer,
	 postal_code	varchar(6),
	 phone			numeric(13),
	 bank			varchar(64) not null,
	 bank_acc_num	varchar(64) not null,
	 primary key (supplier_num)
	);

create table order
	(order_num		numeric(9),
	 email			varchar(254),
	 cost			money not null check (cost >= 0),
	 status			varchar(9) check (status in ('Warehouse','Transit','Complete')),
	 time_placed	timestamp default current_timestamp,
	 time_shipped	timestamp check (time_shipped >= time_placed),
	 time_delivered	timestamp check (time_delivered >= time_shipped),
	 primary key (order_num),
	 foreign key (email) references user
	);

create table book
	(isbn				varchar(13),
	 supplier_num		numeric(9),
	 title				varchar(64),
	 genre				varchar(20),
	 page_count			integer check (page_count > 0),
	 publisher_percent	numeric(2),
	 target_stock		integer,
	 current_stock		integer default 0,
	 reorder_stock		integer,
	 price				smallmoney not null check (price >= 0),
	 primary key (isbn),
	 foreign key (supplier_num) references publisher
	);

create table ordered_items
	(order_num			numeric(9),
	 isbn				varchar(13) not null,
	 quantity			integer default 1 check (quantity > 0),
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