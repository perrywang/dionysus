
insert into psychtestsets(id, title, description) values (1, '人格类', '常规检测项目');

insert into psychtests(id, title, description) values (1, '16PF', '人格评定以及心理健康评定');

insert into set_test(set_id,test_id) values (1,1);

insert into psychtestcategories(id,test_id,name) values (1, 1, '乐群性');
insert into psychtestcategories(id,test_id,name) values (2, 1, '聪慧性');
insert into psychtestcategories(id,test_id,name) values (3, 1, '稳定性');
insert into psychtestcategories(id,test_id,name) values (4, 1, '恃强性');
insert into psychtestcategories(id,test_id,name) values (5, 1, '兴奋性');
insert into psychtestcategories(id,test_id,name) values (6, 1, '有恒性');
insert into psychtestcategories(id,test_id,name) values (7, 1, '敢为性');
insert into psychtestcategories(id,test_id,name) values (8, 1, '敏感性');
insert into psychtestcategories(id,test_id,name) values (9, 1, '怀疑性');
insert into psychtestcategories(id,test_id,name) values (10, 1, '幻想性');
insert into psychtestcategories(id,test_id,name) values (11, 1, '世故性');
insert into psychtestcategories(id,test_id,name) values (12, 1, '忧虑性');
insert into psychtestcategories(id,test_id,name) values (13, 1, '实验性');
insert into psychtestcategories(id,test_id,name) values (14, 1, '独立性');
insert into psychtestcategories(id,test_id,name) values (15, 1, '自律性');
insert into psychtestcategories(id,test_id,name) values (16, 1, '紧张性');

insert into psychtestings(id, test_id) values (1, 1);

insert into psychtestcategories16pf(id, name, topname) values (1, '适应与焦虑型', '次级人格因素分析');
insert into psychtestcategories16pf(id, name, topname) values (2, '内向与外向型', '次级人格因素分析');
insert into psychtestcategories16pf(id, name, topname) values (3, '感情用事与安详机警型', '次级人格因素分析');
insert into psychtestcategories16pf(id, name, topname) values (4, '怯懦与果断型', '次级人格因素分析');
insert into psychtestcategories16pf(id, name, topname) values (5, '心理健康因素', '16种人格因素测验应用的计算');
insert into psychtestcategories16pf(id, name, topname) values (6, '专业而有成就者的人格因素', '16种人格因素测验应用的计算');
insert into psychtestcategories16pf(id, name, topname) values (7, '创造能力人格因素', '16种人格因素测验应用的计算');
insert into psychtestcategories16pf(id, name, topname) values (8, '在新的环境中有成长能力的人格因素', '16种人格因素测验应用的计算');

insert into psychtestquestions(id, test_id, category_id, description) values (1, 1, 1, '我很明了本测验的说明');
insert into psychtestquestions(id, test_id, category_id, description) values (2, 1, 1, '我对本测验的每一个问题，都能做到诚实的回答');
insert into psychtestquestions(id, test_id, category_id, description) values (3, 1, 1, '如果我有机会的话，我愿意');
insert into psychtestquestions(id, test_id, category_id, description) values (4, 1, 1, '我有能力应付各种困难');
insert into psychtestquestions(id, test_id, category_id, description) values (5, 1, 1, '即使是关在铁笼里的猛兽，我见了也会感到惴惴不安');
insert into psychtestquestions(id, test_id, category_id, description) values (6, 1, 1, '我总是不敢大胆批评别人的言行');
insert into psychtestquestions(id, test_id, category_id, description) values (7, 1, 1, '我的思想似乎');
insert into psychtestquestions(id, test_id, category_id, description) values (8, 1, 1, '我不擅长说笑话、讲有趣的事');
insert into psychtestquestions(id, test_id, category_id, description) values (9, 1, 1, '当我见到亲友和邻居争吵时，我总是');
insert into psychtestquestions(id, test_id, category_id, description) values (10, 1, 1, '在群众集会中，我');
insert into psychtestquestions(id, test_id, category_id, description) values (11, 1, 1, '我愿做一个');
insert into psychtestquestions(id, test_id, category_id, description) values (12, 1, 1, '阅读时，我喜欢选读');
insert into psychtestquestions(id, test_id, category_id, description) values (13, 1, 1, '我认为很多人都有些心理不正常、只是他们不愿意承认');
insert into psychtestquestions(id, test_id, category_id, description) values (14, 1, 1, '我希望我的爱人擅长交际，无须具有文艺才能');
insert into psychtestquestions(id, test_id, category_id, description) values (15, 1, 1, '对于性情急噪，爱发脾气的人，我仍能以礼相待');
insert into psychtestquestions(id, test_id, category_id, description) values (16, 1, 1, '受人侍奉时我常常局促不安');
insert into psychtestquestions(id, test_id, category_id, description) values (17, 1, 1, '在从事体力或脑力劳动之后，我总是需要有比别人更多的休息时间，才能保持工作效率');
insert into psychtestquestions(id, test_id, category_id, description) values (18, 1, 1, '半夜醒来，我常常为种种惴虑不安而不能再入睡');
insert into psychtestquestions(id, test_id, category_id, description) values (19, 1, 1, '事情进行得不顺利时，我常常急得涕泪交流');
insert into psychtestquestions(id, test_id, category_id, description) values (20, 1, 1, '我认为只要双方同意可以离婚，可以不受传统观念的束缚');
insert into psychtestquestions(id, test_id, category_id, description) values (21, 1, 1, '我对人或物的兴趣都很容易改变');
insert into psychtestquestions(id, test_id, category_id, description) values (22, 1, 1, '在工作中，我愿意');
insert into psychtestquestions(id, test_id, category_id, description) values (23, 1, 1, '我常常会无缘无故地自言自语');
insert into psychtestquestions(id, test_id, category_id, description) values (24, 1, 1, '无论是工作、饮食或外出游览，我总是');
insert into psychtestquestions(id, test_id, category_id, description) values (25, 1, 1, '有时我怀疑别人是否对我的言行真正的有兴趣');
insert into psychtestquestions(id, test_id, category_id, description) values (26, 1, 1, '如果我在工厂里工作，我愿做');
insert into psychtestquestions(id, test_id, category_id, description) values (27, 1, 1, '在阅读时，我愿阅读');
insert into psychtestquestions(id, test_id, category_id, description) values (28, 1, 1, '本题后面列出的三个单词，哪个与其他两个单词不类同');
insert into psychtestquestions(id, test_id, category_id, description) values (29, 1, 1, '如果我能到一个新的环境，我要');
insert into psychtestquestions(id, test_id, category_id, description) values (30, 1, 1, '在一生中，我总觉得我能达到我所预期的目标');
insert into psychtestquestions(id, test_id, category_id, description) values (31, 1, 1, '当我说谎时，总觉得内心羞愧，不敢正视对方');
insert into psychtestquestions(id, test_id, category_id, description) values (32, 1, 1, '假使我手里拿着一颗装有子弹的手枪，我必须把子弹取出来才能安心');

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (1, 1, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (2, 1, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (3, 1, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (4, 2, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (5, 2, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (6, 2, '不同意', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (7, 3, '到一个繁华的城市去旅行', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (8, 3, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (9, 3, '游览清静的山区', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (10, 4, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (11, 4, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (12, 4, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (13, 5, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (14, 5, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (15, 5, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (16, 6, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (17, 6, '有时如此', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (18, 6, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (19, 7, '比较先进', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (20, 7, '一般', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (21, 7, '比较保守', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (22, 8, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (23, 8, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (24, 8, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (25, 9, '任其自己解决', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (26, 9, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (27, 9, '予以劝解', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (28, 10, '谈吐自如', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (29, 10, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (30, 10, '保持沉默', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (31, 11, '建筑工程师', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (32, 11, '不确定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (33, 11, '社会科学研究者', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (34, 12, '自然科学书籍', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (35, 12, '不确定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (36, 12, '政治理论书籍', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (37, 13, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (38, 13, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (39, 13, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (40, 14, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (41, 14, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (42, 14, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (43, 15, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (44, 15, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (45, 15, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (46, 16, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (47, 16, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (48, 16, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (49, 17, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (50, 17, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (51, 17, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (52, 18, '常常如此', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (53, 18, '有时如此', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (54, 18, '极少如此', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (55, 19, '极少如此', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (56, 19, '有时如此', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (57, 19, '常常如此', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (58, 20, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (59, 20, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (60, 20, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (61, 21, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (62, 21, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (63, 21, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (64, 22, '和别人合作', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (65, 22, '不确定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (66, 22, '自己单独进行', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (67, 23, '常常如此', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (68, 23, '偶然如此', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (69, 23, '从不如此', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (70, 24, '匆匆忙忙，不能尽兴', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (71, 24, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (72, 24, '从容不迫', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (73, 25, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (74, 25, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (75, 25, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (76, 26, '技术科的工作', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (77, 26, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (78, 26, '宣传科的工作', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (79, 27, '有关太空旅行的书籍', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (80, 27, '不太确定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (81, 27, '有关家庭教育的书籍', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (82, 28, '狗', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (83, 28, '石头', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (84, 28, '牛', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (85, 29, '把生活安排得和从前不一样', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (86, 29, '不确定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (87, 29, '和从前相仿', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (88, 30, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (89, 30, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (90, 30, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (91, 31, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (92, 31, '不一定', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (93, 31, '不是的', 0, 30);

insert into psychtestquestionoptions(id, item_id, description, score, weight) values (94, 32, '是的', 2, 10);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (95, 32, '介于A-C之间', 1, 20);
insert into psychtestquestionoptions(id, item_id, description, score, weight) values (96, 32, '不是的', 0, 30);
