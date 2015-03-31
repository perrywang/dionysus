insert into categories (id, name) values(1, '亲子关系');
insert into categories (id, name) values(2, '家庭关系');
insert into categories (id, name) values(3, '婚姻关系');
insert into categories (id, name) values(4, '职业心理');
insert into categories (id, name) values(5, '个人成长');


insert into modules (id, title, subtitle, href, image, body) values (1, '汇心网', '汇心网络中心', '/app/articles', '/public/images/slide-2.jpeg', '关怀无处不在');
insert into modules (id, title, subtitle, href, image, body) values (2, '心理服务小站', '心灵避风港.汇心心理', '/app/colleges', '/public/images/slide-3.jpeg', '国内最专业的校园心理服务提供商');
insert into modules (id, title, subtitle, href, image, body) values (3, '汇心心理学院', '专业心理从业人员孵化基地', '/app/about', '/public/images/slide-1.jpeg', '汇心心理学院，专业源于权威');

insert into pages (id, name, title, body) values (1, 'about', 'About Us', '关于我们的详细页面');

insert into psychtests(id, title, description) values (1, '你是一个心地善良的人吗？', '测试你是一个心地善良的人还是一个老好人');
insert into psychtestitems(id, test_id, description) values (1, 1, '看到有人在你面前抢劫你会怎么做？');
insert into psychtestitemoptions(id, item_id, description) values (1, 1, '装作没看见');
insert into psychtestitemoptions(id, item_id, description) values (2, 1, '上前搏斗');
insert into psychtestitemoptions(id, item_id, description) values (3, 1, '犹豫了一下，然后低头不语');

insert into psychtestitems(id, test_id, description) values (2, 1, '看到有人在你面前乞讨你会怎么做？');
insert into psychtestitemoptions(id, item_id, description) values (4, 2, '立刻给钱');
insert into psychtestitemoptions(id, item_id, description) values (5, 2, '判断下是不是骗子，然后再决定给不给');
insert into psychtestitemoptions(id, item_id, description) values (6, 2, '担心被骗，犹豫下走开');

insert into psychtestitems(id, test_id, description) values (3, 1, '你会向慈善机构捐款吗？');
insert into psychtestitemoptions(id, item_id, description) values (7, 3, '从不');
insert into psychtestitemoptions(id, item_id, description) values (8, 3, '很少');
insert into psychtestitemoptions(id, item_id, description) values (9, 3, '经常');

insert into psychtestitems(id, test_id, description) values (4, 1, '亲眼目睹了一场车祸，你多久能够忘记？');
insert into psychtestitemoptions(id, item_id, description) values (10, 4, '一天');
insert into psychtestitemoptions(id, item_id, description) values (11, 4, '一周');
insert into psychtestitemoptions(id, item_id, description) values (12, 4, '一个月');


insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled)
values (1, 'admin','$2a$10$04TVADrR6/SPLBjsK0N30.Jf5fNjBugSACeGv1S69dZALR7lSov0y', TRUE, TRUE, TRUE, TRUE);