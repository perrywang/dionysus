insert into psychtestsuites(id, title, description) values (1, '人格类', '人格类');

insert into psychtests(id, type, format, min, title, description, object, duration, cost, approach) values (1, 'PF16', 'ONE_BY_ONE', 187, '16PF', '人格评定以及心理健康评定', '12岁以上', '30', '120', 'MACHINE');
insert into psychtests(id, type, format, min, title, description, object, duration, cost, approach) values (2, 'EPQ',  'TABLE', 88, '艾森克量表', '人格评定以及心理健康评定', '3岁以上', '10', '100', 'MACHINE');
insert into psychtests(id, type, format, min, title, description, object, duration, cost, approach) values (3, 'MMPI', 'TABLE', 399, '明尼苏达', '人格评定及精神疾病评定', '12岁以上', '60', '300', 'MACHINE');
insert into psychtests(id, type, format, min, title, description, object, duration, cost, approach) values (4, 'EPPS', 'ONE_BY_ONE', 225, '爱德华个人偏好量表', '了解性格特点以及内在各项需求评定认知', '12岁以上', '40', '100', 'MACHINE');
insert into psychtests(id, type, format, title, description, object, duration, cost, approach) values (5, 'TAT',  'ONE_BY_ONE', 'TAT测试', '人格评定以及需求评定', '12岁以上', '10', '100', 'MANUAL');

insert into suite_test(suite_id, test_id) values (1, 1);
insert into suite_test(suite_id, test_id) values (1, 2);
insert into suite_test(suite_id, test_id) values (1, 3);
insert into suite_test(suite_id, test_id) values (1, 4);
insert into suite_test(suite_id, test_id) values (1, 5);




-- 卡特尔十六种人格因素测试(16PF)

-- 指导语
--     卡特尔十六种人格因素测验包括一些有关个人兴趣与态度的问题。每个人都有自己的看法，对问题的回答自然不同。无所谓正确或错误。请来试者尽量表达自己的意见。
--     本测验共有187道题， 每道题有三种选择，请将你的选择用鼠标点击,并按回车键确认。作答时，请注意下列四点：
--     １．请不要费时斟酌。应当顺其自然地依你个人的反应选答。一般地说来，问题都略嫌简短而不能包含所有有关的因素或条件。通常每分钟可作五六题，全部问题应在半小时内完成。
--     ２．除非在万不得已的情形下，尽量避免如“介乎Ａ与Ｃ之间”或“不甚确定”这样的中性答案。
--     ３．请不要遗漏，务必对每一个问题作答。 有些问题似乎不符合于你，有些问题又似乎涉及隐私，但本测验的目的，在于研究比较青年或成人的兴趣和态度，希望来试者真实作答。
--     ４．作答时，请坦白表达自己的兴趣与态度，不必顾虑到主试者或其他人的意见与立场。


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (1, 1, 1, 'SINGLE_CHOICE', 'REQUIRED', '我很明了本测验的说明');
insert into psychtestquestionoptions(id, question_id, identity, description) values (1, 1, 'A', '是的');
insert into psychtestquestionoptions(id, question_id, identity, description) values (2, 1, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (3, 1, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (2, 2, 1, 'SINGLE_CHOICE', 'REQUIRED', '我对本测验每个问题都会按自己的真实情况作答');
insert into psychtestquestionoptions(id, question_id, identity, description) values (4, 2, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (5, 2, 'B', '不一定');
insert into psychtestquestionoptions(id, question_id, identity, description) values (6, 2, 'C', '不同意.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (3, 3, 1, 'SINGLE_CHOICE', 'REQUIRED', '有度假机会时,我宁愿');
insert into psychtestquestionoptions(id, question_id, identity, description) values (7, 3, 'A', '去一个繁华的都市.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (8, 3, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (9, 3, 'C', '闲居清静而偏僻的郊区.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (4, 4, 1, 'SINGLE_CHOICE', 'REQUIRED', '我有足够的能力应付困难');
insert into psychtestquestionoptions(id, question_id, identity, description) values (10, 4, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (11, 4, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (12, 4, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (5, 5, 1, 'SINGLE_CHOICE', 'REQUIRED', '即使是关在铁笼内的猛兽,我见了也会惴惴不安');
insert into psychtestquestionoptions(id, question_id, identity, description) values (13, 5, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (14, 5, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (15, 5, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (6, 6, 1, 'SINGLE_CHOICE', 'REQUIRED', '我总避免批评别人的言行');
insert into psychtestquestionoptions(id, question_id, identity, description) values (16, 6, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (17, 6, 'B', '有时如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (18, 6, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (7, 7, 1, 'SINGLE_CHOICE', 'REQUIRED', '我的思想似乎:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (19, 7, 'A', '走在了时代前面.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (20, 7, 'B', '不太一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (21, 7, 'C', '正符合时代.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (8, 8, 1, 'SINGLE_CHOICE', 'REQUIRED', '我不擅长说笑话讲趣事');
insert into psychtestquestionoptions(id, question_id, identity, description) values (22, 8, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (23, 8, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (24, 8, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (9, 9, 1, 'SINGLE_CHOICE', 'REQUIRED', '当我看到亲友邻居争执时,我总是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (25, 9, 'A', '任其自己解决.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (26, 9, 'B', '置之不理.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (27, 9, 'C', '予以劝解.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (10, 10, 1, 'SINGLE_CHOICE', 'REQUIRED', '在社交场合中,我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (28, 10, 'A', '谈吐自然.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (29, 10, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (30, 10, 'C', '退避三舍,保持沉默.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (11, 11, 1, 'SINGLE_CHOICE', 'REQUIRED', '我愿做一名');
insert into psychtestquestionoptions(id, question_id, identity, description) values (31, 11, 'A', '建筑工程师.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (32, 11, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (33, 11, 'C', '社会科学的教员.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (12, 12, 1, 'SINGLE_CHOICE', 'REQUIRED', '阅读时,我宁愿选读');
insert into psychtestquestionoptions(id, question_id, identity, description) values (34, 12, 'A', '著名的宗教教义.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (35, 12, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (36, 12, 'C', '国家政治组织的理论.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (13, 13, 1, 'SINGLE_CHOICE', 'REQUIRED', '我相信许多人都有些心理不正常，但他们都不愿意这样承认');
insert into psychtestquestionoptions(id, question_id, identity, description) values (37, 13, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (38, 13, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (39, 13, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (14, 14, 1, 'SINGLE_CHOICE', 'REQUIRED', '我所希望的结婚对象应擅长交际而无须有文艺才能');
insert into psychtestquestionoptions(id, question_id, identity, description) values (40, 14, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (41, 14, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (42, 14, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (15, 15, 1, 'SINGLE_CHOICE', 'REQUIRED', '对于头脑简单和不讲理的人,我仍然能待之以礼');
insert into psychtestquestionoptions(id, question_id, identity, description) values (43, 15, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (44, 15, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (45, 15, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (16, 16, 1, 'SINGLE_CHOICE', 'REQUIRED', '受人侍奉时我常感到不安');
insert into psychtestquestionoptions(id, question_id, identity, description) values (46, 16, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (47, 16, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (48, 16, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (17, 17, 1, 'SINGLE_CHOICE', 'REQUIRED', '从事体力或脑力劳动后，我比平常人需要更多的休息才能恢复工作效率');
insert into psychtestquestionoptions(id, question_id, identity, description) values (49, 17, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (50, 17, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (51, 17, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (18, 18, 1, 'SINGLE_CHOICE', 'REQUIRED', '半夜醒来,我会为种种忧虑而不能再入眠');
insert into psychtestquestionoptions(id, question_id, identity, description) values (52, 18, 'A', '常常如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (53, 18, 'B', '有时如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (54, 18, 'C', '极少如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (19, 19, 1, 'SINGLE_CHOICE', 'REQUIRED', '事情进行不顺利时,我常会急得掉眼泪');
insert into psychtestquestionoptions(id, question_id, identity, description) values (55, 19, 'A', '从不如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (56, 19, 'B', '有时如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (57, 19, 'C', '时常如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (20, 20, 1, 'SINGLE_CHOICE', 'REQUIRED', '我认为只要双方同意就可以离婚，不应当受传统礼教的束缚');
insert into psychtestquestionoptions(id, question_id, identity, description) values (58, 20, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (59, 20, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (60, 20, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (21, 21, 1, 'SINGLE_CHOICE', 'REQUIRED', '我对于人或物的兴趣都很容易改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values (61, 21, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (62, 21, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (63, 21, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (22, 22, 1, 'SINGLE_CHOICE', 'REQUIRED', '筹划事务时,我宁愿:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (64, 22, 'A', '和别人合作.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (65, 22, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (66, 22, 'C', '自己单独进行.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (23, 23, 1, 'SINGLE_CHOICE', 'REQUIRED', '我常会无端地自言自语:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (67, 23, 'A', '常常如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (68, 23, 'B', '偶然如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (69, 23, 'C', '从不如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (24, 24, 1, 'SINGLE_CHOICE', 'REQUIRED', '无论工作,饮食或出游,我总');
insert into psychtestquestionoptions(id, question_id, identity, description) values (70, 24, 'A', '很匆忙,不能尽兴.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (71, 24, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (72, 24, 'C', '很从容不迫.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (25, 25, 1, 'SINGLE_CHOICE', 'REQUIRED', '有时我会怀疑别人是否对我的言谈真正有兴趣');
insert into psychtestquestionoptions(id, question_id, identity, description) values (73, 25, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (74, 25, 'B', '介乎A与C之间');
insert into psychtestquestionoptions(id, question_id, identity, description) values (75, 25, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (26, 26, 1, 'SINGLE_CHOICE', 'REQUIRED', '在工厂中,我宁愿负责');
insert into psychtestquestionoptions(id, question_id, identity, description) values (76, 26, 'A', '机械组.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (77, 26, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (78, 26, 'C', '人事组.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (27, 27, 1, 'SINGLE_CHOICE', 'REQUIRED', '在阅读时,我宁愿选读');
insert into psychtestquestionoptions(id, question_id, identity, description) values (79, 27, 'A', '太空旅行.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (80, 27, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (81, 27, 'C', '家庭教育.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (28, 28, 1, 'SINGLE_CHOICE', 'REQUIRED', '下列三个字中哪个字与其它两个字属于不同类别');
insert into psychtestquestionoptions(id, question_id, identity, description) values (82, 28, 'A', '狗.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (83, 28, 'B', '石.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (84, 28, 'C', '牛.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (29, 29, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果我能重新做人,我要');
insert into psychtestquestionoptions(id, question_id, identity, description) values (85, 29, 'A', '把生活安排得和以前不同.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (86, 29, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (87, 29, 'C', '生活得和以前相仿.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (30, 30, 1, 'SINGLE_CHOICE', 'REQUIRED', '在我的一生中,我总能达到我所预期的目标');
insert into psychtestquestionoptions(id, question_id, identity, description) values (88, 30, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (89, 30, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (90, 30, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (31, 31, 1, 'SINGLE_CHOICE', 'REQUIRED', '当我说谎时,我总觉得内心不安,不敢正视对方');
insert into psychtestquestionoptions(id, question_id, identity, description) values (91, 31, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (92, 31, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (93, 31, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (32, 32, 1, 'SINGLE_CHOICE', 'REQUIRED', '假使我手持一支装有子弹的手枪，我必须取出子弹后才能心安');
insert into psychtestquestionoptions(id, question_id, identity, description) values (94, 32, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (95, 32, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (96, 32, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (33, 33, 1, 'SINGLE_CHOICE', 'REQUIRED', '朋友们大都认为我是一个说话有风趣的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values (97, 33, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (98, 33, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (99, 33, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (34, 34, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果人们知道我的内心世界,他们都会感到惊讶');
insert into psychtestquestionoptions(id, question_id, identity, description) values (100, 34, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (101, 34, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (102, 34, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (35, 35, 1, 'SINGLE_CHOICE', 'REQUIRED', '在社交场合中,如果我突然成为众所注意的中心,我会感到局促不安');
insert into psychtestquestionoptions(id, question_id, identity, description) values (103, 35, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (104, 35, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (105, 35, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (36, 36, 1, 'SINGLE_CHOICE', 'REQUIRED', '我总喜欢参加规模庞大的聚会,舞会或公共集会');
insert into psychtestquestionoptions(id, question_id, identity, description) values (106, 36, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (107, 36, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (108, 36, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (37, 37, 1, 'SINGLE_CHOICE', 'REQUIRED', '在下列工作中,我喜欢的是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (109, 37, 'A', '音乐.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (110, 37, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (111, 37, 'C', '手工.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (38, 38, 1, 'SINGLE_CHOICE', 'REQUIRED', '我常常怀疑那些出乎意料的,对我过于友善的人的诚实动机');
insert into psychtestquestionoptions(id, question_id, identity, description) values (112, 38, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (113, 38, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (114, 38, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (39, 39, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿自己的生活象');
insert into psychtestquestionoptions(id, question_id, identity, description) values (115, 39, 'A', '一个艺人或博物学家.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (116, 39, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (117, 39, 'C', '会计师或保险公司的经纪人.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (40, 40, 1, 'SINGLE_CHOICE', 'REQUIRED', '目前世界所需要的是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (118, 40, 'A', '多产生一些富有改善世界计划的理想家.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (119, 40, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (120, 40, 'C', '脚踏实地的可靠公民.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (41, 41, 1, 'SINGLE_CHOICE', 'REQUIRED', '有时候我觉得我需要做剧烈的体力活动');
insert into psychtestquestionoptions(id, question_id, identity, description) values (121, 41, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (122, 41, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (123, 41, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (42, 42, 1, 'SINGLE_CHOICE', 'REQUIRED', '我愿意与有礼貌有教养的人来往，而不愿和粗鲁野蛮的人为伍');
insert into psychtestquestionoptions(id, question_id, identity, description) values (124, 42, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (125, 42, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (126, 42, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (43, 43, 1, 'SINGLE_CHOICE', 'REQUIRED', '在处理一些必须凭借智慧的事务中,我的父母的确');
insert into psychtestquestionoptions(id, question_id, identity, description) values (127, 43, 'A', '较一般人差.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (128, 43, 'B', '普通.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (129, 43, 'C', '超人一等.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (44, 44, 1, 'SINGLE_CHOICE', 'REQUIRED', '当上司(或教师)召见我时,我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (130, 44, 'A', '总觉得可以趁机会提出建议.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (131, 44, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (132, 44, 'C', '总怀疑自己做错了什么事.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (45, 45, 1, 'SINGLE_CHOICE', 'REQUIRED', '假使薪俸优厚,我愿意专任照料精神病人的职务');
insert into psychtestquestionoptions(id, question_id, identity, description) values (133, 45, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (134, 45, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (135, 45, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (46, 46, 1, 'SINGLE_CHOICE', 'REQUIRED', '看报时,我喜欢读');
insert into psychtestquestionoptions(id, question_id, identity, description) values (136, 46, 'A', '当前世界基本社会问题的辩论.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (137, 46, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (138, 46, 'C', '地方新闻的报道.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (47, 47, 1, 'SINGLE_CHOICE', 'REQUIRED', '我曾担任过');
insert into psychtestquestionoptions(id, question_id, identity, description) values (139, 47, 'A', '一般职务.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (140, 47, 'B', '多种职务.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (141, 47, 'C', '非常多的职务.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (48, 48, 1, 'SINGLE_CHOICE', 'REQUIRED', '逛街时,我宁愿观看一个画家写生,而不愿听人家的辩论');
insert into psychtestquestionoptions(id, question_id, identity, description) values (142, 48, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (143, 48, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (144, 48, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (49, 49, 1, 'SINGLE_CHOICE', 'REQUIRED', '我的神经脆弱,稍有刺激的声音就会使我战栗');
insert into psychtestquestionoptions(id, question_id, identity, description) values (145, 49, 'A', '时常如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (146, 49, 'B', '有时如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (147, 49, 'C', '从未如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (50, 50, 1, 'SINGLE_CHOICE', 'REQUIRED', '我在清晨起身时,就常常感到疲乏不堪');
insert into psychtestquestionoptions(id, question_id, identity, description) values (148, 50, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (149, 50, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (150, 50, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (51, 51, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿是一个');
insert into psychtestquestionoptions(id, question_id, identity, description) values (151, 51, 'A', '管森林的工作人员.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (152, 51, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (153, 51, 'C', '中小学教员.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (52, 52, 1, 'SINGLE_CHOICE', 'REQUIRED', '每逢年节或亲友生日,我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (154, 52, 'A', '喜欢互相赠送礼物.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (155, 52, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (156, 52, 'C', '觉得交换礼物是麻烦多事.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (53, 53, 1, 'SINGLE_CHOICE', 'REQUIRED', '下列数字中,哪个数字与其他两个数字属于不同类别');
insert into psychtestquestionoptions(id, question_id, identity, description) values (157, 53, 'A', '  5.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (158, 53, 'B', '  2.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (159, 53, 'C', '  7.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (54, 54, 1, 'SINGLE_CHOICE', 'REQUIRED', '[猫]与[鱼]就如同[牛]与');
insert into psychtestquestionoptions(id, question_id, identity, description) values (160, 54, 'A', '牛乳.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (161, 54, 'B', '牧草.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (162, 54, 'C', '盐.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (55, 55, 1, 'SINGLE_CHOICE', 'REQUIRED', '在做人处事的各个方面,我的父母很值得敬佩');
insert into psychtestquestionoptions(id, question_id, identity, description) values (163, 55, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (164, 55, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (165, 55, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (56, 56, 1, 'SINGLE_CHOICE', 'REQUIRED', '我觉得我有一些别人所不及的优良品质');
insert into psychtestquestionoptions(id, question_id, identity, description) values (166, 56, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (167, 56, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (168, 56, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (57, 57, 1, 'SINGLE_CHOICE', 'REQUIRED', '只要有利于大家,尽管别人认为卑贱的工作,我也乐而为之,不以为耻');
insert into psychtestquestionoptions(id, question_id, identity, description) values (169, 57, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (170, 57, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (171, 57, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (58, 58, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢看电影或参加其他娱乐活动');
insert into psychtestquestionoptions(id, question_id, identity, description) values (172, 58, 'A', '每周一次以上(比一般人多).');
insert into psychtestquestionoptions(id, question_id, identity, description) values (173, 58, 'B', '每周一次(与通常人相似).');
insert into psychtestquestionoptions(id, question_id, identity, description) values (174, 58, 'C', '偶然一次(比通常人少).');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (59, 59, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢从事需要精确技术的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (175, 59, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (176, 59, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (177, 59, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (60, 60, 1, 'SINGLE_CHOICE', 'REQUIRED', '在有思想,有地位的长者面前,我总较为缄默');
insert into psychtestquestionoptions(id, question_id, identity, description) values (178, 60, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (179, 60, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (180, 60, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (61, 61, 1, 'SINGLE_CHOICE', 'REQUIRED', '就我来说,在大众前演讲或表演是一件不容易的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values (181, 61, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (182, 61, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (183, 61, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (62, 62, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿');
insert into psychtestquestionoptions(id, question_id, identity, description) values (184, 62, 'A', '指挥几个人工作.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (185, 62, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (186, 62, 'C', '和团体共同工作.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (63, 63, 1, 'SINGLE_CHOICE', 'REQUIRED', '纵使我做了一桩贻笑大方的事，我也仍然能够将它淡然忘却');
insert into psychtestquestionoptions(id, question_id, identity, description) values (187, 63, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (188, 63, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (189, 63, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (64, 64, 1, 'SINGLE_CHOICE', 'REQUIRED', '没有人会幸灾乐祸地希望我遭遇困难');
insert into psychtestquestionoptions(id, question_id, identity, description) values (190, 64, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (191, 64, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (192, 64, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (65, 65, 1, 'SINGLE_CHOICE', 'REQUIRED', '堂堂男子汉应该');
insert into psychtestquestionoptions(id, question_id, identity, description) values (193, 65, 'A', '考虑人生的意义.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (194, 65, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (195, 65, 'C', '谋家庭的温饱.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (66, 66, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢解决别人已弄得一塌糊涂的问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values (196, 66, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (197, 66, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (198, 66, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (67, 67, 1, 'SINGLE_CHOICE', 'REQUIRED', '我十分高兴的时候总有[好景不长]之感');
insert into psychtestquestionoptions(id, question_id, identity, description) values (199, 67, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (200, 67, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (201, 67, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (68, 68, 1, 'SINGLE_CHOICE', 'REQUIRED', '在一般困难处境下,我总能保持乐观');
insert into psychtestquestionoptions(id, question_id, identity, description) values (202, 68, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (203, 68, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (204, 68, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (69, 69, 1, 'SINGLE_CHOICE', 'REQUIRED', '迁居是一桩极不愉快的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values (205, 69, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (206, 69, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (207, 69, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (70, 70, 1, 'SINGLE_CHOICE', 'REQUIRED', '在我年轻的时候,如果我和父母的意见不同,我经常');
insert into psychtestquestionoptions(id, question_id, identity, description) values (208, 70, 'A', '坚持自己的意见.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (209, 70, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (210, 70, 'C', '接受他们的意见.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (71, 71, 1, 'SINGLE_CHOICE', 'REQUIRED', '我希望我的爱人能够使家庭');
insert into psychtestquestionoptions(id, question_id, identity, description) values (211, 71, 'A', '有其本身的欢乐与活动.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (212, 71, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (213, 71, 'C', '成为邻里社交活动的一部分.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (72, 72, 1, 'SINGLE_CHOICE', 'REQUIRED', '我解决问题多数依靠');
insert into psychtestquestionoptions(id, question_id, identity, description) values (214, 72, 'A', '个人独立思考.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (215, 72, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (216, 72, 'C', '与人互相讨论.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (73, 73, 1, 'SINGLE_CHOICE', 'REQUIRED', '需要[当机立断]时,我总');
insert into psychtestquestionoptions(id, question_id, identity, description) values (217, 73, 'A', '镇静地运用理智.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (218, 73, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (219, 73, 'C', '常常紧张兴奋,不能冷静思考.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (74, 74, 1, 'SINGLE_CHOICE', 'REQUIRED', '最近,在一两桩事情上,我觉得自己是无辜受累');
insert into psychtestquestionoptions(id, question_id, identity, description) values (220, 74, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (221, 74, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (222, 74, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (75, 75, 1, 'SINGLE_CHOICE', 'REQUIRED', '我善于控制我的表情');
insert into psychtestquestionoptions(id, question_id, identity, description) values (223, 75, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (224, 75, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (225, 75, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (76, 76, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果薪俸相等,我宁愿做');
insert into psychtestquestionoptions(id, question_id, identity, description) values (226, 76, 'A', '一个化学研究师.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (227, 76, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (228, 76, 'C', '旅行社经理.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (77, 77, 1, 'SINGLE_CHOICE', 'REQUIRED', '[惊讶]与[新奇]犹如[惧怕]与');
insert into psychtestquestionoptions(id, question_id, identity, description) values (229, 77, 'A', '勇敢.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (230, 77, 'B', '焦虑.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (231, 77, 'C', '恐怖.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (78, 78, 1, 'SINGLE_CHOICE', 'REQUIRED', '下列三个分数中,哪一个与其他两个属不同类别:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (232, 78, 'A', '  3/7.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (233, 78, 'B', '  3/9.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (234, 78, 'C', '  3/11.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (79, 79, 1, 'SINGLE_CHOICE', 'REQUIRED', '不知什么缘故,有些人故意回避或冷淡我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (235, 79, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (236, 79, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (237, 79, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (80, 80, 1, 'SINGLE_CHOICE', 'REQUIRED', '我虽善意待人,却得不到好报');
insert into psychtestquestionoptions(id, question_id, identity, description) values (238, 80, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (239, 80, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (240, 80, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (81, 81, 1, 'SINGLE_CHOICE', 'REQUIRED', '我不喜欢那些夜郎自大,目空一切的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values (241, 81, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (242, 81, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (243, 81, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (82, 82, 1, 'SINGLE_CHOICE', 'REQUIRED', '和一般人相比,我的朋友的确太少');
insert into psychtestquestionoptions(id, question_id, identity, description) values (244, 82, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (245, 82, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (246, 82, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (83, 83, 1, 'SINGLE_CHOICE', 'REQUIRED', '出于万不得已时,我才参加社交集会,否则我总设法回避');
insert into psychtestquestionoptions(id, question_id, identity, description) values (247, 83, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (248, 83, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (249, 83, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (84, 84, 1, 'SINGLE_CHOICE', 'REQUIRED', '在服务机关中,对上级的逢迎得当,比工作上的表现更为重要');
insert into psychtestquestionoptions(id, question_id, identity, description) values (250, 84, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (251, 84, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (252, 84, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (85, 85, 1, 'SINGLE_CHOICE', 'REQUIRED', '参加竞赛时,我看重的是竞赛活动,而不计较其成败');
insert into psychtestquestionoptions(id, question_id, identity, description) values (253, 85, 'A', '总是如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (254, 85, 'B', '一般如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (255, 85, 'C', '偶然如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (86, 86, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿我所就的职业有');
insert into psychtestquestionoptions(id, question_id, identity, description) values (256, 86, 'A', '固定可靠的薪水.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (257, 86, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (258, 86, 'C', '薪资高低能随我工作的表现而随时调整.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (87, 87, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿阅读');
insert into psychtestquestionoptions(id, question_id, identity, description) values (259, 87, 'A', '军事与政治的事实记载.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (260, 87, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (261, 87, 'C', '一部富有情感与幻想的作品.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (88, 88, 1, 'SINGLE_CHOICE', 'REQUIRED', '有许多人不敢欺骗或犯罪,主要原因是怕受到惩罚');
insert into psychtestquestionoptions(id, question_id, identity, description) values (262, 88, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (263, 88, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (264, 88, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (89, 89, 1, 'SINGLE_CHOICE', 'REQUIRED', '我的父母(或保护人)从未很严格地要我事事顺从');
insert into psychtestquestionoptions(id, question_id, identity, description) values (265, 89, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (266, 89, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (267, 89, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (90, 90, 1, 'SINGLE_CHOICE', 'REQUIRED', '[百折不挠][再接再励]的精神似乎完全被现代人忽视了');
insert into psychtestquestionoptions(id, question_id, identity, description) values (268, 90, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (269, 90, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (270, 90, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (91, 91, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果有人对我发怒,我总:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (271, 91, 'A', '设法使他镇静下来.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (272, 91, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (273, 91, 'C', '也会恼怒起来.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (92, 92, 1, 'SINGLE_CHOICE', 'REQUIRED', '我希望大家都提倡');
insert into psychtestquestionoptions(id, question_id, identity, description) values (274, 92, 'A', '多吃水果以避免杀生.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (275, 92, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (276, 92, 'C', '发展农业捕灭对农产品有害的动物.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (93, 93, 1, 'SINGLE_CHOICE', 'REQUIRED', '无论在极高的屋顶上或极深的隧道中，我很少觉得胆怯不安');
insert into psychtestquestionoptions(id, question_id, identity, description) values (277, 93, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (278, 93, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (279, 93, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (94, 94, 1, 'SINGLE_CHOICE', 'REQUIRED', '我只要没有过错,不管人家怎样归咎于我,我总能心安理得');
insert into psychtestquestionoptions(id, question_id, identity, description) values (280, 94, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (281, 94, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (282, 94, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (95, 95, 1, 'SINGLE_CHOICE', 'REQUIRED', '凡是无法运用理智来解决的问题，有时就不得不靠权力来处理');
insert into psychtestquestionoptions(id, question_id, identity, description) values (283, 95, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (284, 95, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (285, 95, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (96, 96, 1, 'SINGLE_CHOICE', 'REQUIRED', '我十六、七岁时与异性朋友的交往');
insert into psychtestquestionoptions(id, question_id, identity, description) values (286, 96, 'A', '极多.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (287, 96, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (288, 96, 'C', '不很多.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (97, 97, 1, 'SINGLE_CHOICE', 'REQUIRED', '我在交际场或所参加的组织中是一个活跃分子');
insert into psychtestquestionoptions(id, question_id, identity, description) values (289, 97, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (290, 97, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (291, 97, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (98, 98, 1, 'SINGLE_CHOICE', 'REQUIRED', '在人声噪杂中,我仍能不受妨碍,专心工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (292, 98, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (293, 98, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (294, 98, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (99, 99, 1, 'SINGLE_CHOICE', 'REQUIRED', '在某环境下,我常因困惑引起幻想而将工作搁置下来');
insert into psychtestquestionoptions(id, question_id, identity, description) values (295, 99, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (296, 99, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (297, 99, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (100, 100, 1, 'SINGLE_CHOICE', 'REQUIRED', '我很少用难堪的话去中伤别人的感情');
insert into psychtestquestionoptions(id, question_id, identity, description) values (298, 100, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (299, 100, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (300, 100, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (101, 101, 1, 'SINGLE_CHOICE', 'REQUIRED', '我更愿意做一名');
insert into psychtestquestionoptions(id, question_id, identity, description) values (301, 101, 'A', '商店经理.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (302, 101, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (303, 101, 'C', '建筑师.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (102, 102, 1, 'SINGLE_CHOICE', 'REQUIRED', '[理不胜辞]的意思是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (304, 102, 'A', '理不如辞.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (305, 102, 'B', '理多而辞寡.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (306, 102, 'C', '辞藻丰富而理由不足.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (103, 103, 1, 'SINGLE_CHOICE', 'REQUIRED', '[锄头]与[挖掘]犹如[刀子]与');
insert into psychtestquestionoptions(id, question_id, identity, description) values (307, 103, 'A', '雕刻.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (308, 103, 'B', '切剖.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (309, 103, 'C', '铲除.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (104, 104, 1, 'SINGLE_CHOICE', 'REQUIRED', '我常横过街道,以回避我不愿招乎的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values (310, 104, 'A', '很少如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (311, 104, 'B', '偶然如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (312, 104, 'C', '有时如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (105, 105, 1, 'SINGLE_CHOICE', 'REQUIRED', '在我倾听音乐时,如果人家高谈阔论');
insert into psychtestquestionoptions(id, question_id, identity, description) values (313, 105, 'A', '我仍然能够专心听,不受影响.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (314, 105, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (315, 105, 'C', '我会不能专心欣赏而感到恼恐.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (106, 106, 1, 'SINGLE_CHOICE', 'REQUIRED', '在课堂上,如果我的意见与教师不同,我常');
insert into psychtestquestionoptions(id, question_id, identity, description) values (316, 106, 'A', '保持缄默.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (317, 106, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (318, 106, 'C', '当场表明立场.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (107, 107, 1, 'SINGLE_CHOICE', 'REQUIRED', '我和异性友伴交谈时, 竭力避免涉及有关 [性] 的话题');
insert into psychtestquestionoptions(id, question_id, identity, description) values (319, 107, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (320, 107, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (321, 107, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (108, 108, 1, 'SINGLE_CHOICE', 'REQUIRED', '我待人接物的确不太成功');
insert into psychtestquestionoptions(id, question_id, identity, description) values (322, 108, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (323, 108, 'B', '不尽然.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (324, 108, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (109, 109, 1, 'SINGLE_CHOICE', 'REQUIRED', '每当考虑困难问题时,我总是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (325, 109, 'A', '一切都未雨稠缪.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (326, 109, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (327, 109, 'C', '相信到时候会自然解决.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (110, 110, 1, 'SINGLE_CHOICE', 'REQUIRED', '我所结交的朋友中,男女各占一半');
insert into psychtestquestionoptions(id, question_id, identity, description) values (328, 110, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (329, 110, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (330, 110, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (111, 111, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁可');
insert into psychtestquestionoptions(id, question_id, identity, description) values (331, 111, 'A', '结识很多的人.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (332, 111, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (333, 111, 'C', '维持几个深交的朋友.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (112, 112, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁为哲学家,而不做机械工程师');
insert into psychtestquestionoptions(id, question_id, identity, description) values (334, 112, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (335, 112, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (336, 112, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (113, 113, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果我发现某人自私不义，我总不计一切指责他的弱点');
insert into psychtestquestionoptions(id, question_id, identity, description) values (337, 113, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (338, 113, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (339, 113, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (114, 114, 1, 'SINGLE_CHOICE', 'REQUIRED', '我善用心机去影响同伴,使他们能协助实现我的目标');
insert into psychtestquestionoptions(id, question_id, identity, description) values (340, 114, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (341, 114, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (342, 114, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (115, 115, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢做戏剧,音乐,歌剧等新闻采访工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (343, 115, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (344, 115, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (345, 115, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (116, 116, 1, 'SINGLE_CHOICE', 'REQUIRED', '当人们颂扬我时,我总觉得不好意思');
insert into psychtestquestionoptions(id, question_id, identity, description) values (346, 116, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (347, 116, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (348, 116, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (117, 117, 1, 'SINGLE_CHOICE', 'REQUIRED', '我以为现代最需要解决的问题是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (349, 117, 'A', '政治纠纷.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (350, 117, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (351, 117, 'C', '道德标准的有无.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (118, 118, 1, 'SINGLE_CHOICE', 'REQUIRED', '我有时会无故地产生一种面临横祸的恐惧');
insert into psychtestquestionoptions(id, question_id, identity, description) values (352, 118, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (353, 118, 'B', '有时如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (354, 118, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (119, 119, 1, 'SINGLE_CHOICE', 'REQUIRED', '我在童年时,害怕黑暗的次数');
insert into psychtestquestionoptions(id, question_id, identity, description) values (355, 119, 'A', '极多.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (356, 119, 'B', '不太多.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (357, 119, 'C', '没有.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (120, 120, 1, 'SINGLE_CHOICE', 'REQUIRED', '黄昏闲暇,我喜欢');
insert into psychtestquestionoptions(id, question_id, identity, description) values (358, 120, 'A', '看一部历史探险影片.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (359, 120, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (360, 120, 'C', '念一本科学幻想小说.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (121, 121, 1, 'SINGLE_CHOICE', 'REQUIRED', '当人们批评我古怪时,我觉得');
insert into psychtestquestionoptions(id, question_id, identity, description) values (361, 121, 'A', '非常气恼.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (362, 121, 'B', '有些动气.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (363, 121, 'C', '无所谓.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (122, 122, 1, 'SINGLE_CHOICE', 'REQUIRED', '在一个陌生的城市找住址时,我经常');
insert into psychtestquestionoptions(id, question_id, identity, description) values (364, 122, 'A', '就人问路.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (365, 122, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (366, 122, 'C', '参考市区地图.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (123, 123, 1, 'SINGLE_CHOICE', 'REQUIRED', '朋友们声明要在家休息时,我仍设法怂恿他们外出');
insert into psychtestquestionoptions(id, question_id, identity, description) values (367, 123, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (368, 123, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (369, 123, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (124, 124, 1, 'SINGLE_CHOICE', 'REQUIRED', '在就寝时,我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (370, 124, 'A', '不易入睡.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (371, 124, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (372, 124, 'C', '极容易入睡.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (125, 125, 1, 'SINGLE_CHOICE', 'REQUIRED', '有人烦扰我时,我');
insert into psychtestquestionoptions(id, question_id, identity, description) values (373, 125, 'A', '能不露生色.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (374, 125, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (375, 125, 'C', '要说给别人听,以泄气愤.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (126, 126, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果薪俸相等,我宁愿做一个');
insert into psychtestquestionoptions(id, question_id, identity, description) values (376, 126, 'A', '律师.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (377, 126, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (378, 126, 'C', '飞行员或航海员.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (127, 127, 1, 'SINGLE_CHOICE', 'REQUIRED', '时间永恒是比喻');
insert into psychtestquestionoptions(id, question_id, identity, description) values (379, 127, 'A', '时间过得很慢.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (380, 127, 'B', '忘了时间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (381, 127, 'C', '光阴一去不复返.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (128, 128, 1, 'SINGLE_CHOICE', 'REQUIRED', '下列三项记号中,哪一项应紧接:XOOOOXXOOOXXX');
insert into psychtestquestionoptions(id, question_id, identity, description) values (382, 128, 'A', ' XOX0.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (383, 128, 'B', ' OOX.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (384, 128, 'C', ' OXX.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (129, 129, 1, 'SINGLE_CHOICE', 'REQUIRED', '在陌生的地方,我仍能清楚地辩别东西南北的方向');
insert into psychtestquestionoptions(id, question_id, identity, description) values (385, 129, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (386, 129, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (387, 129, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (130, 130, 1, 'SINGLE_CHOICE', 'REQUIRED', '我的确比一般人幸运,因为我能从事自己热爱的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (388, 130, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (389, 130, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (390, 130, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (131, 131, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果我急于想借用别人的东西而物主恰又不在，我认为不告而取亦无大碍');
insert into psychtestquestionoptions(id, question_id, identity, description) values (391, 131, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (392, 131, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (393, 131, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (132, 132, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢向友人追述一些已往有趣的社交经验');
insert into psychtestquestionoptions(id, question_id, identity, description) values (394, 132, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (395, 132, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (396, 132, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (133, 133, 1, 'SINGLE_CHOICE', 'REQUIRED', '我更愿意做一名');
insert into psychtestquestionoptions(id, question_id, identity, description) values (397, 133, 'A', '演员.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (398, 133, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (399, 133, 'C', '建筑师.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (134, 134, 1, 'SINGLE_CHOICE', 'REQUIRED', '工作学习之余,我总要安排计划,不使时间浪费');
insert into psychtestquestionoptions(id, question_id, identity, description) values (400, 134, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (401, 134, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (402, 134, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (135, 135, 1, 'SINGLE_CHOICE', 'REQUIRED', '与人交际时,我常会无端地产生一种自卑感:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (403, 135, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (404, 135, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (405, 135, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (136, 136, 1, 'SINGLE_CHOICE', 'REQUIRED', '主动与陌生人交谈:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (406, 136, 'A', '是一桩难事.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (407, 136, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (408, 136, 'C', '毫无困难.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (137, 137, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢的音乐,多数是:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (409, 137, 'A', '轻快活泼.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (410, 137, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (411, 137, 'C', '富于情感.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (138, 138, 1, 'SINGLE_CHOICE', 'REQUIRED', '我爱做[白日梦]即[完全沉浸于幻想之中]');
insert into psychtestquestionoptions(id, question_id, identity, description) values (412, 138, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (413, 138, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (414, 138, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (139, 139, 1, 'SINGLE_CHOICE', 'REQUIRED', '未来二十年的世界局势定将好');
insert into psychtestquestionoptions(id, question_id, identity, description) values (415, 139, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (416, 139, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (417, 139, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (140, 140, 1, 'SINGLE_CHOICE', 'REQUIRED', '童年时,我喜欢阅读');
insert into psychtestquestionoptions(id, question_id, identity, description) values (418, 140, 'A', '战争故事.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (419, 140, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (420, 140, 'C', '神仙幻想故事.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (141, 141, 1, 'SINGLE_CHOICE', 'REQUIRED', '我素来对机械、汽车、飞机等有兴趣');
insert into psychtestquestionoptions(id, question_id, identity, description) values (421, 141, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (422, 141, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (423, 141, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (142, 142, 1, 'SINGLE_CHOICE', 'REQUIRED', '我愿意做一个缓刑释放罪犯的管理监视人');
insert into psychtestquestionoptions(id, question_id, identity, description) values (424, 142, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (425, 142, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (426, 142, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (143, 143, 1, 'SINGLE_CHOICE', 'REQUIRED', '人们认为我只不过是一个能苦干,稍有成就的人而已');
insert into psychtestquestionoptions(id, question_id, identity, description) values (427, 143, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (428, 143, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (429, 143, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (144, 144, 1, 'SINGLE_CHOICE', 'REQUIRED', '在逆境中,我总能保持精神振奋');
insert into psychtestquestionoptions(id, question_id, identity, description) values (430, 144, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (431, 144, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (432, 144, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (145, 145, 1, 'SINGLE_CHOICE', 'REQUIRED', '我以为人工节育是解决世界经济与和平问题的要诀');
insert into psychtestquestionoptions(id, question_id, identity, description) values (433, 145, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (434, 145, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (435, 145, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (146, 146, 1, 'SINGLE_CHOICE', 'REQUIRED', '在工作中我喜欢独自筹划，不愿受别人的干涉');
insert into psychtestquestionoptions(id, question_id, identity, description) values (436, 146, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (437, 146, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (438, 146, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (147, 147, 1, 'SINGLE_CHOICE', 'REQUIRED', '我相信[上司不可能没有过错,但他仍有权做当权者]');
insert into psychtestquestionoptions(id, question_id, identity, description) values (439, 147, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (440, 147, 'B', '不一定');
insert into psychtestquestionoptions(id, question_id, identity, description) values (441, 147, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (148, 148, 1, 'SINGLE_CHOICE', 'REQUIRED', '我总设法使自己不粗心大意,忽略细节');
insert into psychtestquestionoptions(id, question_id, identity, description) values (442, 148, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (443, 148, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (444, 148, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (149, 149, 1, 'SINGLE_CHOICE', 'REQUIRED', '与人争辩或险遭事故后，我常发抖，精疲力竭，不能安心工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (445, 149, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (446, 149, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (447, 149, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (150, 150, 1, 'SINGLE_CHOICE', 'REQUIRED', '没有医生处方,我从不乱用药:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (448, 150, 'A', '是的');
insert into psychtestquestionoptions(id, question_id, identity, description) values (449, 150, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (450, 150, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (151, 151, 1, 'SINGLE_CHOICE', 'REQUIRED', '为了培养个人的兴趣,我愿意参加');
insert into psychtestquestionoptions(id, question_id, identity, description) values (451, 151, 'A', '摄影组.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (452, 151, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (453, 151, 'C', '辩论会.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (152, 152, 1, 'SINGLE_CHOICE', 'REQUIRED', '星火,燎原对等于姑息');
insert into psychtestquestionoptions(id, question_id, identity, description) values (454, 152, 'A', '同情.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (455, 152, 'B', '养奸.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (456, 152, 'C', '纵容.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (153, 153, 1, 'SINGLE_CHOICE', 'REQUIRED', '[钟表]与[时间]犹如[载缝]与');
insert into psychtestquestionoptions(id, question_id, identity, description) values (457, 153, 'A', '西装.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (458, 153, 'B', '剪刀.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (459, 153, 'C', '布料.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (154, 154, 1, 'SINGLE_CHOICE', 'REQUIRED', '生动的梦境常常滋扰我的睡眠');
insert into psychtestquestionoptions(id, question_id, identity, description) values (460, 154, 'A', '时常如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (461, 154, 'B', '偶然如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (462, 154, 'C', '从未如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (155, 155, 1, 'SINGLE_CHOICE', 'REQUIRED', '我过去曾撕毁一些禁止人们自由的布告');
insert into psychtestquestionoptions(id, question_id, identity, description) values (463, 155, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (464, 155, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (465, 155, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (156, 156, 1, 'SINGLE_CHOICE', 'REQUIRED', '在一个陌生的城市中,我会');
insert into psychtestquestionoptions(id, question_id, identity, description) values (466, 156, 'A', '到处闲游.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (467, 156, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (468, 156, 'C', '避免去较不安全的地方.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (157, 157, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿服饰素洁大方,而不愿争奇斗艳惹人注目');
insert into psychtestquestionoptions(id, question_id, identity, description) values (469, 157, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (470, 157, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (471, 157, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (158, 158, 1, 'SINGLE_CHOICE', 'REQUIRED', '黄昏时,安静的娱乐远胜过热闹的宴会');
insert into psychtestquestionoptions(id, question_id, identity, description) values (472, 158, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (473, 158, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (474, 158, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (159, 159, 1, 'SINGLE_CHOICE', 'REQUIRED', '我常常明知故犯,不愿意接受好心的建议');
insert into psychtestquestionoptions(id, question_id, identity, description) values (475, 159, 'A', '偶然如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (476, 159, 'B', '罕有如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (477, 159, 'C', '从不如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (160, 160, 1, 'SINGLE_CHOICE', 'REQUIRED', '我总把[是非][善恶]作为判断或取舍的原则');
insert into psychtestquestionoptions(id, question_id, identity, description) values (478, 160, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (479, 160, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (480, 160, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (161, 161, 1, 'SINGLE_CHOICE', 'REQUIRED', '我工作时不喜欢有许多人在旁参观');
insert into psychtestquestionoptions(id, question_id, identity, description) values (481, 161, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (482, 161, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (483, 161, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (162, 162, 1, 'SINGLE_CHOICE', 'REQUIRED', '故意去为难一般有教养的人, 如医生, 教师等人的尊严, 是一件有趣的事:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (484, 162, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (485, 162, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (486, 162, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (163, 163, 1, 'SINGLE_CHOICE', 'REQUIRED', '在各种课程中,我较喜欢:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (487, 163, 'A', '语文.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (488, 163, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (489, 163, 'C', '数学.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (164, 164, 1, 'SINGLE_CHOICE', 'REQUIRED', '那些自以为是、道貌岸然的人最使我生气');
insert into psychtestquestionoptions(id, question_id, identity, description) values (490, 164, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (491, 164, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (492, 164, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (165, 165, 1, 'SINGLE_CHOICE', 'REQUIRED', '与平常循规蹈矩的人交谈');
insert into psychtestquestionoptions(id, question_id, identity, description) values (493, 165, 'A', '颇有兴趣.亦有所得.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (494, 165, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (495, 165, 'C', '他们思想的肤浅使我厌烦.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (166, 166, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢');
insert into psychtestquestionoptions(id, question_id, identity, description) values (496, 166, 'A', '有几个有时对我很苛求而富有感情的朋友.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (497, 166, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (498, 166, 'C', '不受别人的牵涉.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (167, 167, 1, 'SINGLE_CHOICE', 'REQUIRED', '如果做民意投票时,我宁愿投票赞同');
insert into psychtestquestionoptions(id, question_id, identity, description) values (499, 167, 'A', '切实根绝有生理缺陷者的生育.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (500, 167, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (501, 167, 'C', '对杀人犯判处死刑.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (168, 168, 1, 'SINGLE_CHOICE', 'REQUIRED', '我有时会无端地感到沮丧痛苦');
insert into psychtestquestionoptions(id, question_id, identity, description) values (502, 168, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (503, 168, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (504, 168, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (169, 169, 1, 'SINGLE_CHOICE', 'REQUIRED', '当我与立场相反的人辩论时,我主张');
insert into psychtestquestionoptions(id, question_id, identity, description) values (505, 169, 'A', '尽量找出基本观点的差异.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (506, 169, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (507, 169, 'C', '彼此让步以解决矛盾.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (170, 170, 1, 'SINGLE_CHOICE', 'REQUIRED', '我一向重感情而不重理智,因此我的观点常动摇不定');
insert into psychtestquestionoptions(id, question_id, identity, description) values (508, 170, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (509, 170, 'B', '不敢如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (510, 170, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (171, 171, 1, 'SINGLE_CHOICE', 'REQUIRED', '我的学习效率多有赖于:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (511, 171, 'A', '阅读好书.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (512, 171, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (513, 171, 'C', '参加团体讨论.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (172, 172, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁选一个薪俸高的工作,不在乎有无保障;而不愿任薪俸低的固定工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values (514, 172, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (515, 172, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (516, 172, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (173, 173, 1, 'SINGLE_CHOICE', 'REQUIRED', '在参加辩论以前,我总先把握住自己的立场');
insert into psychtestquestionoptions(id, question_id, identity, description) values (517, 173, 'A', '经常如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (518, 173, 'B', '一般如此.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (519, 173, 'C', '必要时才如此.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (174, 174, 1, 'SINGLE_CHOICE', 'REQUIRED', '我常被一些无所谓的琐事所烦扰:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (520, 174, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (521, 174, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (522, 174, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (175, 175, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿住在嘈杂的城市,而不愿住在安静的乡村');
insert into psychtestquestionoptions(id, question_id, identity, description) values (523, 175, 'A', '是的..');
insert into psychtestquestionoptions(id, question_id, identity, description) values (524, 175, 'B', '不太确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (525, 175, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (176, 176, 1, 'SINGLE_CHOICE', 'REQUIRED', '我宁愿');
insert into psychtestquestionoptions(id, question_id, identity, description) values (526, 176, 'A', '负责领导儿童游戏.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (527, 176, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (528, 176, 'C', '协助钟表修理.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (177, 177, 1, 'SINGLE_CHOICE', 'REQUIRED', '一人(  )事,众人受累.我对这句话的反应是');
insert into psychtestquestionoptions(id, question_id, identity, description) values (529, 177, 'A', '愤.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (530, 177, 'B', '偾.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (531, 177, 'C', '喷');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (178, 178, 1, 'SINGLE_CHOICE', 'REQUIRED', '望子成龙的家长往往(  )苗助长');
insert into psychtestquestionoptions(id, question_id, identity, description) values (532, 178, 'A', '揠.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (533, 178, 'B', '堰.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (534, 178, 'C', '偃.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (179, 179, 1, 'SINGLE_CHOICE', 'REQUIRED', '气侯的转变并不影响我的情绪:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (535, 179, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (536, 179, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (537, 179, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (180, 180, 1, 'SINGLE_CHOICE', 'REQUIRED', '因为我对于一切问题都有些见解，大家都公认我富于思想:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (538, 180, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (539, 180, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (540, 180, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (181, 181, 1, 'SINGLE_CHOICE', 'REQUIRED', '我讲话的声音:');
insert into psychtestquestionoptions(id, question_id, identity, description) values (541, 181, 'A', '宏亮.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (542, 181, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (543, 181, 'C', '低沉.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (182, 182, 1, 'SINGLE_CHOICE', 'REQUIRED', '人们公认我是一个活跃热情的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values (544, 182, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (545, 182, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (546, 182, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (183, 183, 1, 'SINGLE_CHOICE', 'REQUIRED', '我喜欢有旅行和变动机会的工作，而不计较工作本身之是否有保障');
insert into psychtestquestionoptions(id, question_id, identity, description) values (547, 183, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (548, 183, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (549, 183, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (184, 184, 1, 'SINGLE_CHOICE', 'REQUIRED', '我治事严格,凡事都务求正确尽善尽美');
insert into psychtestquestionoptions(id, question_id, identity, description) values (550, 184, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (551, 184, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (552, 184, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (185, 185, 1, 'SINGLE_CHOICE', 'REQUIRED', '在取回或归还东西时，我总仔细检查是否东西还保持原状');
insert into psychtestquestionoptions(id, question_id, identity, description) values (553, 185, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (554, 185, 'B', '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (555, 185, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (186, 186, 1, 'SINGLE_CHOICE', 'REQUIRED', '我通常精力充沛,忙碌多事');
insert into psychtestquestionoptions(id, question_id, identity, description) values (556, 186, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (557, 186, 'B', '不一定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (558, 186, 'C', '不是的.');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (187, 187, 1, 'SINGLE_CHOICE', 'REQUIRED', '我确信我没有遗漏或不经心回答上面任何问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values (559, 187, 'A', '是的.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (560, 187, 'B', '不确定.');
insert into psychtestquestionoptions(id, question_id, identity, description) values (561, 187, 'C', '不是的.');














-- 艾森克人格问卷（ＥＰＱ）（成人）
--   请回答下列问题。回答“是“时，就在答题卡内写“1”；回答“否“时就在答题卡内写上打“2”。
--   每个答案无所谓正确与错误。这里没有对你不利的题目。请尽快回答，不要在每道题目上太多思索。
--   回答时不要考虑应该怎样，只回答你平时是怎样的。每题都要回答。

insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (188, 1, 2, 'YES_NO', 'REQUIRED', '你是否有许多不同的业余爱好？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (189, 2, 2, 'YES_NO', 'REQUIRED', '你是否在做任何事情以前都要停下来仔细思考？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (190, 3, 2, 'YES_NO', 'REQUIRED', '你的心境是否常有起伏？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (191, 4, 2, 'YES_NO', 'REQUIRED', '你曾有过明知是别人的功劳而你去接受奖励的事吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (192, 5, 2, 'YES_NO', 'REQUIRED', '你是否健谈？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (193, 6, 2, 'YES_NO', 'REQUIRED', '欠债会使你不安吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (194, 7, 2, 'YES_NO', 'REQUIRED', '你曾无缘无故觉得“真是难受”吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (195, 8, 2, 'YES_NO', 'REQUIRED', '你曾贪图过份外之物吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (196, 9, 2, 'YES_NO', 'REQUIRED', '你是否在晚上小心翼翼地关好门窗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (197, 10, 2, 'YES_NO', 'REQUIRED', '你是否比较活跃？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (198, 11, 2, 'YES_NO', 'REQUIRED', '你在见到一小孩或一动物受折磨时是否会感到非常难过？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (199, 12, 2, 'YES_NO', 'REQUIRED', '你是否常常为自己不该作而作了的事，不该说而说了的话而紧张吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (200, 13, 2, 'YES_NO', 'REQUIRED', '你喜欢跳降落伞吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (201, 14, 2, 'YES_NO', 'REQUIRED', '通常你能在热闹联欢会中尽情地玩吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (202, 15, 2, 'YES_NO', 'REQUIRED', '你容易激动吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (203, 16, 2, 'YES_NO', 'REQUIRED', '你曾经将自己的过错推给别人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (204, 17, 2, 'YES_NO', 'REQUIRED', '你喜欢会见陌生人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (205, 18, 2, 'YES_NO', 'REQUIRED', '你是否相信保险制度是一种好办法？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (206, 19, 2, 'YES_NO', 'REQUIRED', '你是一个容易伤感情的人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (207, 20, 2, 'YES_NO', 'REQUIRED', '你所有的习惯都是好的吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (208, 21, 2, 'YES_NO', 'REQUIRED', '在社交场合你是否总不愿露头角？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (209, 22, 2, 'YES_NO', 'REQUIRED', '你会服用奇异或危险作用的药物吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (210, 23, 2, 'YES_NO', 'REQUIRED', '你常有“厌倦”之感吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (211, 24, 2, 'YES_NO', 'REQUIRED', '你曾拿过别人的东西吗（那怕一针一线）？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (212, 25, 2, 'YES_NO', 'REQUIRED', '你是否常爱外出？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (213, 26, 2, 'YES_NO', 'REQUIRED', '你是否从伤害你所宠爱的人而感到乐趣？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (214, 27, 2, 'YES_NO', 'REQUIRED', '你常为有罪恶之感所苦恼吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (215, 28, 2, 'YES_NO', 'REQUIRED', '你在谈论中是否有时不懂装懂？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (216, 29, 2, 'YES_NO', 'REQUIRED', '你是否宁愿去看书而不愿去多见人？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (217, 30, 2, 'YES_NO', 'REQUIRED', '你有要伤害你的仇人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (218, 31, 2, 'YES_NO', 'REQUIRED', '你觉得自己是一个神经过敏的人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (219, 32, 2, 'YES_NO', 'REQUIRED', '对人有所失礼时你是否经常要表示歉意？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (220, 33, 2, 'YES_NO', 'REQUIRED', '你有许多朋友吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (221, 34, 2, 'YES_NO', 'REQUIRED', '你是否喜爱讲些有时确能伤害人的笑话？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (222, 35, 2, 'YES_NO', 'REQUIRED', '你是一个多忧多虑的人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (223, 36, 2, 'YES_NO', 'REQUIRED', '你在童年是否按照吩咐要做什么便做什么，毫无怨言？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (224, 37, 2, 'YES_NO', 'REQUIRED', '你认为你是一个乐天派吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (225, 38, 2, 'YES_NO', 'REQUIRED', '你很讲究礼貌和整洁吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (226, 39, 2, 'YES_NO', 'REQUIRED', '你是否总在担心会发生可怕的事情？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (227, 40, 2, 'YES_NO', 'REQUIRED', '你曾损坏或遗失过别人的东西吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (228, 41, 2, 'YES_NO', 'REQUIRED', '交新朋友时一般是你采取主动吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (229, 42, 2, 'YES_NO', 'REQUIRED', '当别人向你诉苦时，你是否容易理解他们的苦哀？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (230, 43, 2, 'YES_NO', 'REQUIRED', '你认为自己很紧张，如同“拉紧的弦”一样吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (231, 44, 2, 'YES_NO', 'REQUIRED', '在没有废纸篓时，你是否将废纸扔在地板上？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (232, 45, 2, 'YES_NO', 'REQUIRED', '当你与别人在一起时，你是否言语很少？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (233, 46, 2, 'YES_NO', 'REQUIRED', '你是否认为结婚制度是过时了，应该废止？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (234, 47, 2, 'YES_NO', 'REQUIRED', '你是否有时感到自己可怜？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (235, 48, 2, 'YES_NO', 'REQUIRED', '你是否有时有点自夸？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (236, 49, 2, 'YES_NO', 'REQUIRED', '你是否很容易将一个沉寂的集会搞得活跃起来？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (237, 50, 2, 'YES_NO', 'REQUIRED', '你是否讨厌那种小心翼翼地开车的人？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (238, 51, 2, 'YES_NO', 'REQUIRED', '你为你的健康担忧吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (239, 52, 2, 'YES_NO', 'REQUIRED', '你曾讲过什么人的坏话吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (240, 53, 2, 'YES_NO', 'REQUIRED', '你是否喜欢对朋友讲笑话和有趣的故事？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (241, 54, 2, 'YES_NO', 'REQUIRED', '你小时候曾对父母粗暴无礼吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (242, 55, 2, 'YES_NO', 'REQUIRED', '你是否喜欢与人混在一起？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (243, 56, 2, 'YES_NO', 'REQUIRED', '你如知道自己工作有错误，这会使你感到难过吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (244, 57, 2, 'YES_NO', 'REQUIRED', '你患失眠吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (245, 58, 2, 'YES_NO', 'REQUIRED', '你吃饭前必定洗手吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (246, 59, 2, 'YES_NO', 'REQUIRED', '你常无缘无故感到无精打采和倦怠吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (247, 60, 2, 'YES_NO', 'REQUIRED', '和别人玩游戏时，你有过欺骗行为吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (248, 61, 2, 'YES_NO', 'REQUIRED', '你是否喜欢从事一些动作迅速的工作？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (249, 62, 2, 'YES_NO', 'REQUIRED', '你的母亲是一位善良的妇人吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (250, 63, 2, 'YES_NO', 'REQUIRED', '你是否常常觉得人生非常无味？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (251, 64, 2, 'YES_NO', 'REQUIRED', '你曾利用过某人为自己取得好处吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (252, 65, 2, 'YES_NO', 'REQUIRED', '你是否常常参加许多活动，超过你的时间所允许？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (253, 66, 2, 'YES_NO', 'REQUIRED', '是否有几个人总在躲避你？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (254, 67, 2, 'YES_NO', 'REQUIRED', '你是否为你的容貌而非常烦恼？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (255, 68, 2, 'YES_NO', 'REQUIRED', '你是否觉得人们为了未来有保障而办理储蓄和保险所花的时间太多？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (256, 69, 2, 'YES_NO', 'REQUIRED', '你曾有过不如死了为好的愿望吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (257, 70, 2, 'YES_NO', 'REQUIRED', '如果有把握永远不会被别人发现，你会逃税吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (258, 71, 2, 'YES_NO', 'REQUIRED', '你能使一个集会顺利进行吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (259, 72, 2, 'YES_NO', 'REQUIRED', '你能克制自己不对人无礼吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (260, 73, 2, 'YES_NO', 'REQUIRED', '遇到一次难堪的经历后，你是否在一段很长的时间内还感到难受？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (261, 74, 2, 'YES_NO', 'REQUIRED', '你患有“神经过敏”吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (262, 75, 2, 'YES_NO', 'REQUIRED', '你曾经故意说些什么来伤害别人的感情吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (263, 76, 2, 'YES_NO', 'REQUIRED', '你与别人的友谊是否容易破裂，虽然不是你的过错？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (264, 77, 2, 'YES_NO', 'REQUIRED', '你常感到孤单吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (265, 78, 2, 'YES_NO', 'REQUIRED', '当人家寻你的差错,找你工作中的缺点时,你是否容易在精神上受挫伤？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (266, 79, 2, 'YES_NO', 'REQUIRED', '你赴约会或上班曾迟到过吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (267, 80, 2, 'YES_NO', 'REQUIRED', '你喜欢忙忙碌碌地过日子吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (268, 81, 2, 'YES_NO', 'REQUIRED', '你愿意别人怕你吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (269, 82, 2, 'YES_NO', 'REQUIRED', '你是否觉得有时浑身是劲，而有时又是懒洋洋的吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (270, 83, 2, 'YES_NO', 'REQUIRED', '你有时把今天应做的事拖到明天去做吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (271, 84, 2, 'YES_NO', 'REQUIRED', '别人认为你是生气勃勃吗？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (272, 85, 2, 'YES_NO', 'REQUIRED', '别人是否对你说了许多谎话？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (273, 86, 2, 'YES_NO', 'REQUIRED', '你是否容易对某些事物容易冒火？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (274, 87, 2, 'YES_NO', 'REQUIRED', '当你犯了错误时，你是否常常愿意承认它？');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (275, 88, 2, 'YES_NO', 'REQUIRED', '你会为一动物落入圈套被捉拿而感到很难过吗？');


















-- 明尼苏达多相人格测试(MMPI) 
--     明尼苏达多相人格测试(MMPI)是美国明尼苏达大学教授哈撒韦(S·R·Hathaway)和麦金利(J·C·Mckinley)制定的，此后40多年来，一直被广泛应用于各个领域，如人类学、心理学、医学、社会学等研究工作中。本测验对每个受试者的个性特点提供的客观评价，是临床医师与心理学工作所关注的。在选择测查表的每个问题时Hathaway与Mckinley进行了深入细致的工作。 首先由大量病史、 早期出版的个性量表及医生笔记中选出了550个题目。然后对正常与异常受试进行测验。通过重复测验， 交叉测验，以验证每个量表的信度与效度。在临床实践中反复验证、修订最后确定为13个量表(其中包括10个临床量表，3个效度量表)。
--      目前较常见的测试方式是只做前399道。测试时间最长90分钟，通常是45分钟。
-- 说明：
-- （1）MMPI回答采用“是”或“否”。没有中间答案
-- （2）根据自己的实际情况回答，如果不确定，凭直觉回答。
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (276, 1, 3, 'YES_NO', 'REQUIRED', '我喜欢看机械方面的杂志。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (277, 2, 3, 'YES_NO', 'REQUIRED', '我的胃口很好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (278, 3, 3, 'YES_NO', 'REQUIRED', '我早上起来的时候，多半觉得睡眠充足，头脑清醒。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (279, 4, 3, 'YES_NO', 'REQUIRED', '我想我会喜欢图书管理员的工作。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (280, 5, 3, 'YES_NO', 'REQUIRED', '我很容易被吵醒。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (281, 6, 3, 'YES_NO', 'REQUIRED', '我喜欢看报纸上的犯罪新闻。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (282, 7, 3, 'YES_NO', 'REQUIRED', '我的手脚经常是很暖和的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (283, 8, 3, 'YES_NO', 'REQUIRED', '我的日常生活中，充满了使我感兴趣的事情。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (284, 9, 3, 'YES_NO', 'REQUIRED', '我现在工作（学习）的能力，和从前差不多。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (285, 10, 3, 'YES_NO', 'REQUIRED', '我的喉咙里总好象有一块东西堵着似的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (286, 11, 3, 'YES_NO', 'REQUIRED', '一个人应该去了解自己的梦，并从中得到指导和警告。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (287, 12, 3, 'YES_NO', 'REQUIRED', '我喜欢侦探小说或神秘小说。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (288, 13, 3, 'YES_NO', 'REQUIRED', '我总是在很紧张的情况下工作。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (289, 14, 3, 'YES_NO', 'REQUIRED', '我每个月至少有一二次拉肚子。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (290, 15, 3, 'YES_NO', 'REQUIRED', '偶尔我会想到一些坏得说不出口的话。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (291, 16, 3, 'YES_NO', 'REQUIRED', '我深信生活对我是残酷的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (292, 17, 3, 'YES_NO', 'REQUIRED', '我的父亲是一个好人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (293, 18, 3, 'YES_NO', 'REQUIRED', '我很少有大便不通的毛病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (294, 19, 3, 'YES_NO', 'REQUIRED', '当我干一件新的工作时，总喜欢别人告诉我，我应该接近谁。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (295, 20, 3, 'YES_NO', 'REQUIRED', '我的性生活是满意的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (296, 21, 3, 'YES_NO', 'REQUIRED', '有时我非常想离开家。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (297, 22, 3, 'YES_NO', 'REQUIRED', '有时我会哭一阵笑一阵，连自己也不能控制。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (298, 23, 3, 'YES_NO', 'REQUIRED', '有恶心和呕吐的毛病，我很苦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (299, 24, 3, 'YES_NO', 'REQUIRED', '似乎没有一个人了解我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (300, 25, 3, 'YES_NO', 'REQUIRED', '我想当一个歌唱家。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (301, 26, 3, 'YES_NO', 'REQUIRED', '当我处境困难的时候，我觉得最好是不开口。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (302, 27, 3, 'YES_NO', 'REQUIRED', '有时我觉得有鬼附在身上。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (303, 28, 3, 'YES_NO', 'REQUIRED', '当别人惹了我时，我觉得只要有机会就应报复是理所当然的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (304, 29, 3, 'YES_NO', 'REQUIRED', '我有胃酸过多的毛病。一星期要犯好几次，我很苦恼。．');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (305, 30, 3, 'YES_NO', 'REQUIRED', '有时我真想骂人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (306, 31, 3, 'YES_NO', 'REQUIRED', '每隔几个晚上我就做噩梦。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (307, 32, 3, 'YES_NO', 'REQUIRED', '我发现我很难把注意力集中到一件工作上。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (308, 33, 3, 'YES_NO', 'REQUIRED', '我曾经有过很特别、很奇怪的体验。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (309, 34, 3, 'YES_NO', 'REQUIRED', '我时常咳嗽。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (310, 35, 3, 'YES_NO', 'REQUIRED', '假如不是有人和我作对，我一定会有更大的成就。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (311, 36, 3, 'YES_NO', 'REQUIRED', '我很少担心自己的健康。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (312, 37, 3, 'YES_NO', 'REQUIRED', '我从来没有因为我的性方面的行为出过事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (313, 38, 3, 'YES_NO', 'REQUIRED', '小的时候，有一段时间我干过小偷小摸的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (314, 39, 3, 'YES_NO', 'REQUIRED', '有时我真想摔东西。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (315, 40, 3, 'YES_NO', 'REQUIRED', '有很多时候我宁愿坐着空想，而不愿做任何事情。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (316, 41, 3, 'YES_NO', 'REQUIRED', '我曾一连几天，几个星期，几个月什么也不想干，因为总是提不起精神。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (317, 42, 3, 'YES_NO', 'REQUIRED', '我家里人对我已选择的工作（或将要选择的职业）不满意。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (318, 43, 3, 'YES_NO', 'REQUIRED', '我睡得不安，容易被惊醒。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (319, 44, 3, 'YES_NO', 'REQUIRED', '我觉得我的头到处都疼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (320, 45, 3, 'YES_NO', 'REQUIRED', '有时我也说假话。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (321, 46, 3, 'YES_NO', 'REQUIRED', '我的判断力比以往任何时候都好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (322, 47, 3, 'YES_NO', 'REQUIRED', '每星期至少有一二次，我突然觉得无缘无故地全身发热。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (323, 48, 3, 'YES_NO', 'REQUIRED', '当我与人相处的时候听到别人谈论稀奇古怪的事，我就心烦。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (324, 49, 3, 'YES_NO', 'REQUIRED', '最好是所有的法律全都不要。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (325, 50, 3, 'YES_NO', 'REQUIRED', '有时我觉得我的灵魂离开了我的身体。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (326, 51, 3, 'YES_NO', 'REQUIRED', '我的身体和我大多数朋友一样的健康。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (327, 52, 3, 'YES_NO', 'REQUIRED', '遇到同学或不常见朋友，除非他们先向我打招呼，不然我就装作没看见。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (328, 53, 3, 'YES_NO', 'REQUIRED', '一位牧师（和尚、道士、神父、阿訇等教士），能用祈祷和把手放在病人的头上来治病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (329, 54, 3, 'YES_NO', 'REQUIRED', '认识我的人差不多都喜欢我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (330, 55, 3, 'YES_NO', 'REQUIRED', '我从来没有因为胸部痛或心痛而感到苦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (331, 56, 3, 'YES_NO', 'REQUIRED', '我小时候，曾经因为胡闹而受过学校的处分。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (332, 57, 3, 'YES_NO', 'REQUIRED', '我和别人一见面就熟了（自来熟）。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (333, 58, 3, 'YES_NO', 'REQUIRED', '一切事情都由老天爷安排好了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (334, 59, 3, 'YES_NO', 'REQUIRED', '我时常听从某些人的指挥，其实他们还不如我高明。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (335, 60, 3, 'YES_NO', 'REQUIRED', '我不是每天都看报纸上的每一篇社论。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (336, 61, 3, 'YES_NO', 'REQUIRED', '我从未有过正常的生活。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (337, 62, 3, 'YES_NO', 'REQUIRED', '我身体某些部分常有像火烧、刺痛、虫爬、麻木的感觉。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (338, 63, 3, 'YES_NO', 'REQUIRED', '我的大便正常，不难控制。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (339, 64, 3, 'YES_NO', 'REQUIRED', '有时我会不停地做一件事情，直到别人不耐烦为止。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (340, 65, 3, 'YES_NO', 'REQUIRED', '我爱我的父亲。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (341, 66, 3, 'YES_NO', 'REQUIRED', '我能在我周围看到其他人所看不到的东西、动物和人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (342, 67, 3, 'YES_NO', 'REQUIRED', '我希望我能像别人那样快乐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (343, 68, 3, 'YES_NO', 'REQUIRED', '我从未感到脖子（颈）后面疼痛。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (344, 69, 3, 'YES_NO', 'REQUIRED', '和我性别相同的人对我有强烈的吸引力。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (345, 70, 3, 'YES_NO', 'REQUIRED', '我过去经常喜欢玩丢手帕的游戏。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (346, 71, 3, 'YES_NO', 'REQUIRED', '我觉得许多人喜欢夸大看书的不幸，以便得到别人的同情和帮助。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (347, 72, 3, 'YES_NO', 'REQUIRED', '我为经常感到心口（胃）不舒服而烦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (348, 73, 3, 'YES_NO', 'REQUIRED', '我是个重要人物。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (349, 74, 3, 'YES_NO', 'REQUIRED', '男性：我总希望我是女的；女性：我从不因为我是女的遗憾。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (350, 75, 3, 'YES_NO', 'REQUIRED', '我有时发怒。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (351, 76, 3, 'YES_NO', 'REQUIRED', '我时常感到悲观失望。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (352, 77, 3, 'YES_NO', 'REQUIRED', '我看爱情小说。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (353, 78, 3, 'YES_NO', 'REQUIRED', '我喜欢诗。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (354, 79, 3, 'YES_NO', 'REQUIRED', '我的感情不容易受伤害。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (355, 80, 3, 'YES_NO', 'REQUIRED', '我有时捉弄动物。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (356, 81, 3, 'YES_NO', 'REQUIRED', '我想我会喜欢干森林管理员那一类的工作。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (357, 82, 3, 'YES_NO', 'REQUIRED', '和人争辩的时候，我常争不过别人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (358, 83, 3, 'YES_NO', 'REQUIRED', '任何人只要他有能力，而且愿意努力工作是能成功的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (359, 84, 3, 'YES_NO', 'REQUIRED', '近来，我觉得很容易放弃对某些事务的希望。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (360, 85, 3, 'YES_NO', 'REQUIRED', '有时我被别人的东西，如鞋、手套等强烈吸引，虽然这些东西对我毫无用处，但我总想摸摸它或把它偷来。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (361, 86, 3, 'YES_NO', 'REQUIRED', '我确实缺少自信心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (362, 87, 3, 'YES_NO', 'REQUIRED', '我愿意做一名花匠。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (363, 88, 3, 'YES_NO', 'REQUIRED', '我总觉得人生是有价值的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (364, 89, 3, 'YES_NO', 'REQUIRED', '要使大多数人相信事实的真相，是要经过一番辩论的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (365, 90, 3, 'YES_NO', 'REQUIRED', '有时我将今天应该做的事，拖到明天去做。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (366, 91, 3, 'YES_NO', 'REQUIRED', '我不在乎别人拿我开玩笑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (367, 92, 3, 'YES_NO', 'REQUIRED', '我想当个护士。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (368, 93, 3, 'YES_NO', 'REQUIRED', '我觉得大多数人为了向上爬而不惜说谎。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (369, 94, 3, 'YES_NO', 'REQUIRED', '许多事情，我做过以后就后悔了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (370, 95, 3, 'YES_NO', 'REQUIRED', '我几乎每星期都去教堂（或常去寺庙）。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (371, 96, 3, 'YES_NO', 'REQUIRED', '我几乎没有和家里人吵过嘴。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (372, 97, 3, 'YES_NO', 'REQUIRED', '有时我有一种强烈的冲动，去做一些惊人或有害的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (373, 98, 3, 'YES_NO', 'REQUIRED', '我相信善有善报，恶有恶报。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (374, 99, 3, 'YES_NO', 'REQUIRED', '我喜欢热闹的聚会。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (375, 100, 3, 'YES_NO', 'REQUIRED', '我碰到一些千头万绪的问题，使我感到犹豫不决。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (376, 101, 3, 'YES_NO', 'REQUIRED', '我认为女的在性生活方面，应该和男的有同等的自由。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (377, 102, 3, 'YES_NO', 'REQUIRED', '我认为最难的是控制我自己。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (378, 103, 3, 'YES_NO', 'REQUIRED', '我很少有肌肉抽筋或颤抖的毛病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (379, 104, 3, 'YES_NO', 'REQUIRED', '我似乎对什么事情都不在乎。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (380, 105, 3, 'YES_NO', 'REQUIRED', '我身体不舒服的时候，有时发脾气。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (381, 106, 3, 'YES_NO', 'REQUIRED', '我总觉得我自己好像做错了什么事或犯了什么罪。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (382, 107, 3, 'YES_NO', 'REQUIRED', '我经常是快乐的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (383, 108, 3, 'YES_NO', 'REQUIRED', '我时常觉得头胀栓塞似的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (384, 109, 3, 'YES_NO', 'REQUIRED', '有些人太霸道，即使我明知他们是对的，也要和他们对着干。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (385, 110, 3, 'YES_NO', 'REQUIRED', '有人想害我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (386, 111, 3, 'YES_NO', 'REQUIRED', '我从来没有为寻求刺激而去做危险的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (387, 112, 3, 'YES_NO', 'REQUIRED', '我时常认为必须坚持那些我认为正确的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (388, 113, 3, 'YES_NO', 'REQUIRED', '我相信法制。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (389, 114, 3, 'YES_NO', 'REQUIRED', '我常觉得头上好像有一根绷得紧紧的带子。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (390, 115, 3, 'YES_NO', 'REQUIRED', '我相信人死后会有“来世”。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (391, 116, 3, 'YES_NO', 'REQUIRED', '我更喜欢我下了赌注的比赛和游戏。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (392, 117, 3, 'YES_NO', 'REQUIRED', '大部分人之所以是诚实的，主要是因为怕被人识破。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (393, 118, 3, 'YES_NO', 'REQUIRED', '我在上学的时候，有时因胡闹而被领导叫去。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (394, 119, 3, 'YES_NO', 'REQUIRED', '我说话总是那样不快也不慢，不含糊也不嘶哑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (395, 120, 3, 'YES_NO', 'REQUIRED', '我在外边和朋友们一起吃饭的时候，比在家规矩得多。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (396, 121, 3, 'YES_NO', 'REQUIRED', '我相信有人暗算我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (397, 122, 3, 'YES_NO', 'REQUIRED', '我似乎和我周围的人一样精明能干。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (398, 123, 3, 'YES_NO', 'REQUIRED', '我相信有人在跟踪我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (399, 124, 3, 'YES_NO', 'REQUIRED', '大多数人不惜用不正当的手段谋取利益，也不愿失掉机会。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (400, 125, 3, 'YES_NO', 'REQUIRED', '我的胃有很多毛病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (401, 126, 3, 'YES_NO', 'REQUIRED', '我喜欢戏剧。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (402, 127, 3, 'YES_NO', 'REQUIRED', '我知道我的烦恼是谁造成的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (403, 128, 3, 'YES_NO', 'REQUIRED', '看到血的时候，我既不害怕，也不难受。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (404, 129, 3, 'YES_NO', 'REQUIRED', '我自己常弄不清为什么这样爱生气和发牢骚。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (405, 130, 3, 'YES_NO', 'REQUIRED', '我从来没有吐过血，或咳过血。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (406, 131, 3, 'YES_NO', 'REQUIRED', '我不为得病而担心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (407, 132, 3, 'YES_NO', 'REQUIRED', '我喜欢栽花或采集花草。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (408, 133, 3, 'YES_NO', 'REQUIRED', '我从来没有放纵自己发生过任何不正常的性行为。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (409, 134, 3, 'YES_NO', 'REQUIRED', '有时我的思想跑得太快都来不及表达出来。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (410, 135, 3, 'YES_NO', 'REQUIRED', '假如我能不买票白看电影，而且不会被人发觉，我可能会去做的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (411, 136, 3, 'YES_NO', 'REQUIRED', '如果别人待我好，我常常怀疑他们别有用心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (412, 137, 3, 'YES_NO', 'REQUIRED', '我相信我的家庭生活，和我所认识的许多人一样，幸福快乐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (413, 138, 3, 'YES_NO', 'REQUIRED', '批评和责骂都使我非常伤心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (414, 139, 3, 'YES_NO', 'REQUIRED', '有时我仿佛觉得我必须伤害自己或别人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (415, 140, 3, 'YES_NO', 'REQUIRED', '我喜欢做饭烧菜。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (416, 141, 3, 'YES_NO', 'REQUIRED', '我的行为多半受周围人的喜欢所支配。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (417, 142, 3, 'YES_NO', 'REQUIRED', '有时我觉得我真是毫无用处。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (418, 143, 3, 'YES_NO', 'REQUIRED', '小时候我曾加入过一个团伙，有福共享，有祸同当。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (419, 144, 3, 'YES_NO', 'REQUIRED', '我喜欢当兵。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (420, 145, 3, 'YES_NO', 'REQUIRED', '有时我想借故和别人打架。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (421, 146, 3, 'YES_NO', 'REQUIRED', '我喜欢到处乱逛，如果不行，我就不高兴。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (422, 147, 3, 'YES_NO', 'REQUIRED', '由于我经常不能当机立断，因而失去许多良机。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (423, 148, 3, 'YES_NO', 'REQUIRED', '当我正在做一件重要事情的时候，如果有人向我请教或打扰我，我会不耐烦的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (424, 149, 3, 'YES_NO', 'REQUIRED', '我以前写过日记。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (425, 150, 3, 'YES_NO', 'REQUIRED', '做游戏的时候，我只愿赢而不愿输。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (426, 151, 3, 'YES_NO', 'REQUIRED', '有人一直想毒死我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (427, 152, 3, 'YES_NO', 'REQUIRED', '大多数晚上我睡觉时，不受什么思想干扰。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (428, 153, 3, 'YES_NO', 'REQUIRED', '近几年来大部分时间，我的身体都很好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (429, 154, 3, 'YES_NO', 'REQUIRED', '我从来没有过抽风的毛病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (430, 155, 3, 'YES_NO', 'REQUIRED', '现在我的体重既没有增加也没有减轻。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (431, 156, 3, 'YES_NO', 'REQUIRED', '有一段时间，我自己做过的事情全不记得了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (432, 157, 3, 'YES_NO', 'REQUIRED', '我觉得我时常无缘无故地受到惩罚。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (433, 158, 3, 'YES_NO', 'REQUIRED', '我容易哭。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (434, 159, 3, 'YES_NO', 'REQUIRED', '我不能象从前那样理解我所读的东西了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (435, 160, 3, 'YES_NO', 'REQUIRED', '在我一生中，我从来没有感觉到像现在这么好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (436, 161, 3, 'YES_NO', 'REQUIRED', '有时候我觉得我的头顶一碰就疼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (437, 162, 3, 'YES_NO', 'REQUIRED', '我痛恨别人以不正当的手段捉弄我，使我不得不认输。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (438, 163, 3, 'YES_NO', 'REQUIRED', '我不容易疲倦。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (439, 164, 3, 'YES_NO', 'REQUIRED', '我喜欢研究和阅读与我目前工作有关的东西。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (440, 165, 3, 'YES_NO', 'REQUIRED', '我喜欢结识一些重要人物，这样会使我感到自己也很重要。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (441, 166, 3, 'YES_NO', 'REQUIRED', '我很害怕从高处往下看。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (442, 167, 3, 'YES_NO', 'REQUIRED', '即使我家里有人犯法，我也不会紧张。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (443, 168, 3, 'YES_NO', 'REQUIRED', '我的脑子有点毛病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (444, 169, 3, 'YES_NO', 'REQUIRED', '我不怕管钱。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (445, 170, 3, 'YES_NO', 'REQUIRED', '我不在乎别人对我有什么看法。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (446, 171, 3, 'YES_NO', 'REQUIRED', '在聚会当中，尽管有人出风头，如果让我也这样做，我会感到很不舒服。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (447, 172, 3, 'YES_NO', 'REQUIRED', '我时常需要努力使自己不显出怕羞的样子。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (448, 173, 3, 'YES_NO', 'REQUIRED', '我过去喜欢上学。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (449, 174, 3, 'YES_NO', 'REQUIRED', '我从来没有昏倒过。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (450, 175, 3, 'YES_NO', 'REQUIRED', '我很少头昏眼花。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (451, 176, 3, 'YES_NO', 'REQUIRED', '我不大怕蛇。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (452, 177, 3, 'YES_NO', 'REQUIRED', '我母亲是个好人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (453, 178, 3, 'YES_NO', 'REQUIRED', '我的记忆力似乎不错。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (454, 179, 3, 'YES_NO', 'REQUIRED', '有关性方面的问题，使我烦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (455, 180, 3, 'YES_NO', 'REQUIRED', '我觉得我遇到生人的时候就不知道说什么好了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (456, 181, 3, 'YES_NO', 'REQUIRED', '无聊的时候，我就会惹事寻求开心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (457, 182, 3, 'YES_NO', 'REQUIRED', '我怕自己会发疯。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (458, 183, 3, 'YES_NO', 'REQUIRED', '我反对把钱给乞丐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (459, 184, 3, 'YES_NO', 'REQUIRED', '我时常听到说话的声音，而不知道它是从那里来的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (460, 185, 3, 'YES_NO', 'REQUIRED', '我的听觉显然和大多数人一样好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (461, 186, 3, 'YES_NO', 'REQUIRED', '当我要做一件事的时候，我常发觉我的手在抖。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (462, 187, 3, 'YES_NO', 'REQUIRED', '我的双手并没有变得笨拙不灵。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (463, 188, 3, 'YES_NO', 'REQUIRED', '我能阅读很长的时间，而眼睛不觉得累。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (464, 189, 3, 'YES_NO', 'REQUIRED', '许多时候，我觉得浑身无力。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (465, 190, 3, 'YES_NO', 'REQUIRED', '我很少头痛。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (466, 191, 3, 'YES_NO', 'REQUIRED', '有时，当我难为情的时候，会出很多汗，这使我非常苦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (467, 192, 3, 'YES_NO', 'REQUIRED', '我走路时保持平稳并不困难。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (468, 193, 3, 'YES_NO', 'REQUIRED', '我没哮喘这一类病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (469, 194, 3, 'YES_NO', 'REQUIRED', '我曾经有过几次突然不能控制自己的行动或言语，但当时我的头脑还很清醒。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (470, 195, 3, 'YES_NO', 'REQUIRED', '我所认识的人里不是各个我都喜欢。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (471, 196, 3, 'YES_NO', 'REQUIRED', '我喜欢到我从来没有到过的地方去游览。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (472, 197, 3, 'YES_NO', 'REQUIRED', '有人一直想抢我的东西。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (473, 198, 3, 'YES_NO', 'REQUIRED', '我很少空想。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (474, 199, 3, 'YES_NO', 'REQUIRED', '我们应该把有关性方面的主要知识告诉孩子。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (475, 200, 3, 'YES_NO', 'REQUIRED', '有人想窃取我的思想和计划。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (476, 201, 3, 'YES_NO', 'REQUIRED', '但愿我不像现在这样的害羞。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (477, 202, 3, 'YES_NO', 'REQUIRED', '我相信我是一个被谴责的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (478, 203, 3, 'YES_NO', 'REQUIRED', '假若我是一个新闻记者，我将喜欢报道戏剧界的新闻。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (479, 204, 3, 'YES_NO', 'REQUIRED', '我喜欢做一个新闻记者。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (480, 205, 3, 'YES_NO', 'REQUIRED', '有时我控制不住想要偷点东西。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (481, 206, 3, 'YES_NO', 'REQUIRED', '我很信神，程度超过多数人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (482, 207, 3, 'YES_NO', 'REQUIRED', '我喜欢许多不同种类的游戏和娱乐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (483, 208, 3, 'YES_NO', 'REQUIRED', '我喜欢和异性说笑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (484, 209, 3, 'YES_NO', 'REQUIRED', '我相信我的罪恶是不可饶恕的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (485, 210, 3, 'YES_NO', 'REQUIRED', '每一种东西吃起来味道都是不一样的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (486, 211, 3, 'YES_NO', 'REQUIRED', '我白天睡觉，晚上却睡不着。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (487, 212, 3, 'YES_NO', 'REQUIRED', '我家里的人把我当做小孩子，而不把我当做大人看待。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (488, 213, 3, 'YES_NO', 'REQUIRED', '走路时，我很小心地跨过人行道上的接缝。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (489, 214, 3, 'YES_NO', 'REQUIRED', '我从来没有为皮肤上长点东西而烦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (490, 215, 3, 'YES_NO', 'REQUIRED', '我曾经饮酒过度。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (491, 216, 3, 'YES_NO', 'REQUIRED', '和别人的家庭比较，我的家庭缺乏爱和温暖。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (492, 217, 3, 'YES_NO', 'REQUIRED', '我时常感到自己在为某些事而担心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (493, 218, 3, 'YES_NO', 'REQUIRED', '当看到动物受折磨的时候，我并不觉得特别难受。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (494, 219, 3, 'YES_NO', 'REQUIRED', '我想我会喜欢建筑承包的工作。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (495, 220, 3, 'YES_NO', 'REQUIRED', '我爱我母亲。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (496, 221, 3, 'YES_NO', 'REQUIRED', '我喜欢科学。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (497, 222, 3, 'YES_NO', 'REQUIRED', '即使我以后不能报答，我也愿向朋友求助。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (498, 223, 3, 'YES_NO', 'REQUIRED', '我很喜欢打猎。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (499, 224, 3, 'YES_NO', 'REQUIRED', '我父母经常反对那些和我交往的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (500, 225, 3, 'YES_NO', 'REQUIRED', '有时我也会说说人家的闲话。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (501, 226, 3, 'YES_NO', 'REQUIRED', '我家里有些人的习惯，使我非常讨厌。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (502, 227, 3, 'YES_NO', 'REQUIRED', '人家告诉我，我在睡觉中起来走路（梦游）。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (503, 228, 3, 'YES_NO', 'REQUIRED', '有时我觉得我非常容易做出决定。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (504, 229, 3, 'YES_NO', 'REQUIRED', '我喜欢同时参加几个团体。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (505, 230, 3, 'YES_NO', 'REQUIRED', '我从来没有感到心慌气短。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (506, 231, 3, 'YES_NO', 'REQUIRED', '我喜欢谈论两性方面的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (507, 232, 3, 'YES_NO', 'REQUIRED', '我曾经立志要过一种以责任为重的生活，我一直照此谨慎从事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (508, 233, 3, 'YES_NO', 'REQUIRED', '我有时阻止别人做某些事，并不是因为那种事有多大影响，而是在道义上我应该干预他。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (509, 234, 3, 'YES_NO', 'REQUIRED', '我很容易生气，但很快就平静下来。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (510, 235, 3, 'YES_NO', 'REQUIRED', '我已独立自主，不受家庭的约束。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (511, 236, 3, 'YES_NO', 'REQUIRED', '我有很多心事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (512, 237, 3, 'YES_NO', 'REQUIRED', '我的亲属几乎全都同情我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (513, 238, 3, 'YES_NO', 'REQUIRED', '有时我十分烦躁，坐立不安。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (514, 239, 3, 'YES_NO', 'REQUIRED', '我曾经失恋过。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (515, 240, 3, 'YES_NO', 'REQUIRED', '我从来不为我的外貌而发愁。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (516, 241, 3, 'YES_NO', 'REQUIRED', '我常梦到一些不可告人的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (517, 242, 3, 'YES_NO', 'REQUIRED', '我相信我并不比别人更为神经过敏。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (518, 243, 3, 'YES_NO', 'REQUIRED', '我几乎没有什么地方疼痛。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (519, 244, 3, 'YES_NO', 'REQUIRED', '我的做事方法容易被人误解。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (520, 245, 3, 'YES_NO', 'REQUIRED', '我的父母和家里人对我过于挑剔。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (521, 246, 3, 'YES_NO', 'REQUIRED', '我脖子（颈）上时常出现红斑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (522, 247, 3, 'YES_NO', 'REQUIRED', '我有理由嫉妒家里的某些人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (523, 248, 3, 'YES_NO', 'REQUIRED', '我有时无缘无故地，甚至在不顺利的时候也会觉得非常快乐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (524, 249, 3, 'YES_NO', 'REQUIRED', '我相信阴间有魔鬼和地狱。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (525, 250, 3, 'YES_NO', 'REQUIRED', '有人想把世界上所能得到的东西都夺到手，我绝不责怪他。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (526, 251, 3, 'YES_NO', 'REQUIRED', '我曾经发呆（发愣）停止活动，不知道周围发生了什么事情。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (527, 252, 3, 'YES_NO', 'REQUIRED', '谁也不关心谁的遭遇。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (528, 253, 3, 'YES_NO', 'REQUIRED', '有些人所做的事，虽然我认为是错的，但我仍然能够友好地对待他们。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (529, 254, 3, 'YES_NO', 'REQUIRED', '我喜欢和一些能互相开玩笑的人在一起。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (530, 255, 3, 'YES_NO', 'REQUIRED', '在选举的时候，有时我会选出我不熟悉的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (531, 256, 3, 'YES_NO', 'REQUIRED', '报纸上只有漫画最有趣。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (532, 257, 3, 'YES_NO', 'REQUIRED', '凡是我所做的事，我都指望能够成功。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (533, 258, 3, 'YES_NO', 'REQUIRED', '我相信有神。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (534, 259, 3, 'YES_NO', 'REQUIRED', '做什么事情，我都感到难以开头。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (535, 260, 3, 'YES_NO', 'REQUIRED', '在学校里，我是个笨学生。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (536, 261, 3, 'YES_NO', 'REQUIRED', '如果我是个画家，我喜欢画花。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (537, 262, 3, 'YES_NO', 'REQUIRED', '我虽然相貌不好看，也不因此而苦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (538, 263, 3, 'YES_NO', 'REQUIRED', '即使在冷天我也很容易出汗。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (539, 264, 3, 'YES_NO', 'REQUIRED', '我十分自信。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (540, 265, 3, 'YES_NO', 'REQUIRED', '对任何人都不信任，是比较安全的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (541, 266, 3, 'YES_NO', 'REQUIRED', '每星期至少有一两次我十分兴奋。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (542, 267, 3, 'YES_NO', 'REQUIRED', '人多的时候，我不知道说些什么话好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (543, 268, 3, 'YES_NO', 'REQUIRED', '在我心情不好的时候，总会有一些事使我高兴起来。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (544, 269, 3, 'YES_NO', 'REQUIRED', '我能很容易使人怕我，有时故意这样做来寻开心。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (545, 270, 3, 'YES_NO', 'REQUIRED', '我离家外出的时候，从来不担心家里门窗是否关好锁好了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (546, 271, 3, 'YES_NO', 'REQUIRED', '我不责怪一个到处找没趣的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (547, 272, 3, 'YES_NO', 'REQUIRED', '我有时精力充沛。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (548, 273, 3, 'YES_NO', 'REQUIRED', '我的身体上有一两处麻木了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (549, 274, 3, 'YES_NO', 'REQUIRED', '我的视力和往年一样好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (550, 275, 3, 'YES_NO', 'REQUIRED', '有人控制着我的思想。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (551, 276, 3, 'YES_NO', 'REQUIRED', '我喜欢小孩子。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (552, 277, 3, 'YES_NO', 'REQUIRED', '有时我非常欣赏骗子的机智，我甚至希望他能侥幸混过去。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (553, 278, 3, 'YES_NO', 'REQUIRED', '我时常觉得有些陌生人用挑剔的眼光盯着我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (554, 279, 3, 'YES_NO', 'REQUIRED', '我每天喝特别多水。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (555, 280, 3, 'YES_NO', 'REQUIRED', '大多数人交朋友是因为朋友对他们有用。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (556, 281, 3, 'YES_NO', 'REQUIRED', '我很少注意我的耳鸣。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (557, 282, 3, 'YES_NO', 'REQUIRED', '通常我爱家里的人偶尔也恨他们。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (558, 283, 3, 'YES_NO', 'REQUIRED', '假使我是一个新闻记者，我将很愿意报道体育新闻。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (559, 284, 3, 'YES_NO', 'REQUIRED', '我确信别人正在议论我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (560, 285, 3, 'YES_NO', 'REQUIRED', '偶尔我听了下流的笑话也会发笑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (561, 286, 3, 'YES_NO', 'REQUIRED', '我独自一个人的时候，感到更快乐。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (562, 287, 3, 'YES_NO', 'REQUIRED', '我害怕的事比我的朋友们少得多。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (563, 288, 3, 'YES_NO', 'REQUIRED', '恶心呕吐的毛病使我苦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (564, 289, 3, 'YES_NO', 'REQUIRED', '当一个罪犯可以通过能言善辩的律师开脱罪责时，我对法律感到厌恶。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (565, 290, 3, 'YES_NO', 'REQUIRED', '我总是在很紧张的情况下工作的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (566, 291, 3, 'YES_NO', 'REQUIRED', '在我这一生中，至少有一两次我觉得有人用催眠术指使我做了一些事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (567, 292, 3, 'YES_NO', 'REQUIRED', '我不愿意同人讲话，除非他先开口。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (568, 293, 3, 'YES_NO', 'REQUIRED', '有人一直想要影响我的思想。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (569, 294, 3, 'YES_NO', 'REQUIRED', '我从来没有犯过法。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (570, 295, 3, 'YES_NO', 'REQUIRED', '我喜欢看《红楼梦》这一类的小说。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (571, 296, 3, 'YES_NO', 'REQUIRED', '有些时候，我会无缘无故地觉得非常愉快。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (572, 297, 3, 'YES_NO', 'REQUIRED', '我喜欢我不再受那种有关性方面的念头所困扰。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (573, 298, 3, 'YES_NO', 'REQUIRED', '假若有几个人闯了祸，他们最好选编一套假话，而且不改口。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (574, 299, 3, 'YES_NO', 'REQUIRED', '我认为我比大多数人更重感情。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (575, 300, 3, 'YES_NO', 'REQUIRED', '在我的一生当中，从来没有喜欢过洋娃娃。 ');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (576, 301, 3, 'YES_NO', 'REQUIRED', '许多时候，生活对我来说是一件吃力的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (577, 302, 3, 'YES_NO', 'REQUIRED', '我从来没有因为我的性方面的行为出过事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (578, 303, 3, 'YES_NO', 'REQUIRED', '对于某些事情我很敏感，以致使我不能提起。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (579, 304, 3, 'YES_NO', 'REQUIRED', '在学校里，要我在班上发言，是非常困难的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (580, 305, 3, 'YES_NO', 'REQUIRED', '即使和人们在一起，我还是经常感到孤单。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (581, 306, 3, 'YES_NO', 'REQUIRED', '应得的同情，我全得到了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (582, 307, 3, 'YES_NO', 'REQUIRED', '我拒绝玩那些我玩不好的游戏。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (583, 308, 3, 'YES_NO', 'REQUIRED', '有时我非常想离开家。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (584, 309, 3, 'YES_NO', 'REQUIRED', '我交朋友差不多和别人一样的容易。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (585, 310, 3, 'YES_NO', 'REQUIRED', '我的性生活是满意的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (586, 311, 3, 'YES_NO', 'REQUIRED', '我小的时候，有一段时间我干过小偷小摸的事。 ');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (587, 312, 3, 'YES_NO', 'REQUIRED', '我不喜欢有人在我身旁。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (588, 313, 3, 'YES_NO', 'REQUIRED', '有人不将自己的贵重物品保管好因而引起别人偷窃，这种人和小偷一样应受责备。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (589, 314, 3, 'YES_NO', 'REQUIRED', '偶尔我会想到一些坏得说不出口的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (590, 315, 3, 'YES_NO', 'REQUIRED', '我深信生活对我是残酷的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (591, 316, 3, 'YES_NO', 'REQUIRED', '我想差不多每个人，都会为了避免麻烦说点假话。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (592, 317, 3, 'YES_NO', 'REQUIRED', '我比大多数人更敏感。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (593, 318, 3, 'YES_NO', 'REQUIRED', '我的日常生活中，充满着使我感兴趣的事情。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (594, 319, 3, 'YES_NO', 'REQUIRED', '大多数人都是内心不愿意挺身而出去帮助别人的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (595, 320, 3, 'YES_NO', 'REQUIRED', '我的梦有好些是关于性方面的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (596, 321, 3, 'YES_NO', 'REQUIRED', '我很容易感到不知所措。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (597, 322, 3, 'YES_NO', 'REQUIRED', '我为金钱和事业忧虑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (598, 323, 3, 'YES_NO', 'REQUIRED', '我曾经有过很特别、很奇怪的体验。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (599, 324, 3, 'YES_NO', 'REQUIRED', '我从来没有爱上过任何人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (600, 325, 3, 'YES_NO', 'REQUIRED', '我家里有些人所做的事，使我吃惊。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (601, 326, 3, 'YES_NO', 'REQUIRED', '有时我会哭一阵，笑一阵，连自己也不能控制。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (602, 327, 3, 'YES_NO', 'REQUIRED', '我的母亲或父亲时常要我服从他，甚至我认为是不合理的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (603, 328, 3, 'YES_NO', 'REQUIRED', '我发现我很难把注意力集中到一件工作上。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (604, 329, 3, 'YES_NO', 'REQUIRED', '我几乎从不做梦。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (605, 330, 3, 'YES_NO', 'REQUIRED', '我从来没有瘫痪过，或是感到肌肉非常软弱无力。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (606, 331, 3, 'YES_NO', 'REQUIRED', '假如不是别人和我作对，我一定会有更大的成就。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (607, 332, 3, 'YES_NO', 'REQUIRED', '即使我没有感冒，我有时也会发不出声音或声音改变。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (608, 333, 3, 'YES_NO', 'REQUIRED', '似乎没有人能了解我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (609, 334, 3, 'YES_NO', 'REQUIRED', '有时我会闻到奇怪的气味。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (610, 335, 3, 'YES_NO', 'REQUIRED', '我不能专心于一件事情上。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (611, 336, 3, 'YES_NO', 'REQUIRED', '我很容易对人感到不耐烦。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (612, 337, 3, 'YES_NO', 'REQUIRED', '我几乎整天都在为某件事或某个人而焦虑。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (613, 338, 3, 'YES_NO', 'REQUIRED', '我所操心的事，远远超过了我所应该操心的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (614, 339, 3, 'YES_NO', 'REQUIRED', '大部分时间，我觉得我还是死了的好。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (615, 340, 3, 'YES_NO', 'REQUIRED', '有时我会兴奋得难以入睡。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (616, 341, 3, 'YES_NO', 'REQUIRED', '有时我的听觉太灵敏了，反而使我感到烦恼。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (617, 342, 3, 'YES_NO', 'REQUIRED', '听人对我所说的话，我立刻就忘记了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (618, 343, 3, 'YES_NO', 'REQUIRED', '哪怕是琐碎小事，我也再三考虑才去做。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (619, 344, 3, 'YES_NO', 'REQUIRED', '有时为了避免和某些人相遇，我会绕道而行。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (620, 345, 3, 'YES_NO', 'REQUIRED', '我常常觉得好像一切都不是真的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (621, 346, 3, 'YES_NO', 'REQUIRED', '我有一个习惯，喜欢数一些不重要的东西，像路上的电线杆等等。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (622, 347, 3, 'YES_NO', 'REQUIRED', '我没有真正想伤害我的仇人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (623, 348, 3, 'YES_NO', 'REQUIRED', '我提防那些对我过分亲近的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (624, 349, 3, 'YES_NO', 'REQUIRED', '我有一些奇怪和特别的念头。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (625, 350, 3, 'YES_NO', 'REQUIRED', '在我独处的时候，我听到奇怪的声音。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (626, 351, 3, 'YES_NO', 'REQUIRED', '当我必须短期离家出门的时候，我会感到心神不安。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (627, 352, 3, 'YES_NO', 'REQUIRED', '我怕一些东西或人，虽然我明知他们是不会伤害我的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (628, 353, 3, 'YES_NO', 'REQUIRED', '如果屋子里已经有人聚在一起谈话，这时要我一个人进去，我一点也不怕。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (629, 354, 3, 'YES_NO', 'REQUIRED', '我害怕使用刀子或任何尖利的东西。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (630, 355, 3, 'YES_NO', 'REQUIRED', '有时我喜欢折磨我所爱的人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (631, 356, 3, 'YES_NO', 'REQUIRED', '我似乎比别人更难于集中注意力。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (632, 357, 3, 'YES_NO', 'REQUIRED', '有好几次我放弃正在做的事，因为我感觉自己的能力太差了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (633, 358, 3, 'YES_NO', 'REQUIRED', '我脑子里常常出现一些坏的可怕的字眼，却又无法摆脱它们。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (634, 359, 3, 'YES_NO', 'REQUIRED', '有时一些无关紧要的念头缠着我，使我好多天都感到不安。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (635, 360, 3, 'YES_NO', 'REQUIRED', '几乎每天都有使我害怕的事发生。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (636, 361, 3, 'YES_NO', 'REQUIRED', '我总是将事情看得严重些。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (637, 362, 3, 'YES_NO', 'REQUIRED', '我比大多数人更敏感。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (638, 363, 3, 'YES_NO', 'REQUIRED', '有时我喜欢受到我心爱的人的折磨。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (639, 364, 3, 'YES_NO', 'REQUIRED', '有人用侮辱性和下流的话议论我。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (640, 365, 3, 'YES_NO', 'REQUIRED', '我呆在屋里总感到不安。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (641, 366, 3, 'YES_NO', 'REQUIRED', '即使和人们在一起，我仍经常感到孤单。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (642, 367, 3, 'YES_NO', 'REQUIRED', '我并不是特别害羞拘谨。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (643, 368, 3, 'YES_NO', 'REQUIRED', '有时我的头脑似乎比平时迟钝。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (644, 369, 3, 'YES_NO', 'REQUIRED', '在社交场合，我多半是一个人坐着，或者只跟另一个人坐在一起，而不到人群里去。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (645, 370, 3, 'YES_NO', 'REQUIRED', '人们常使我失望。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (646, 371, 3, 'YES_NO', 'REQUIRED', '我很喜欢参加舞会。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (647, 372, 3, 'YES_NO', 'REQUIRED', '有时我常感到困难重重，无法克服。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (648, 373, 3, 'YES_NO', 'REQUIRED', '我常想：“我要能再成为一个孩子就好了。”');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (649, 374, 3, 'YES_NO', 'REQUIRED', '如果给我机会，我一定能做些对世界大有益处的事。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (650, 375, 3, 'YES_NO', 'REQUIRED', '我时常遇见一些所谓的专家，他们并不比我高明。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (651, 376, 3, 'YES_NO', 'REQUIRED', '当我听说我所熟悉的人成功了，我就觉得自己失败了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (652, 377, 3, 'YES_NO', 'REQUIRED', '如果有机会，我一定能成为一个人民的好领袖。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (653, 378, 3, 'YES_NO', 'REQUIRED', '下流的故事使我感到不好意思。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (654, 379, 3, 'YES_NO', 'REQUIRED', '一般来说人们要求别人尊重他们的权利比较多，而他们却很少尊重别人的权利。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (655, 380, 3, 'YES_NO', 'REQUIRED', '我总想把好的故事记住，讲给别人听。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (656, 381, 3, 'YES_NO', 'REQUIRED', '我喜欢搞输赢不大的赌博。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (657, 382, 3, 'YES_NO', 'REQUIRED', '为了可以和人们在一起，我喜欢社交活动。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (658, 383, 3, 'YES_NO', 'REQUIRED', '我喜欢人多热闹的场合。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (659, 384, 3, 'YES_NO', 'REQUIRED', '当我和一群活泼的朋友在一起的时候，我的烦恼就消失了。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (660, 385, 3, 'YES_NO', 'REQUIRED', '当人们说我班级人的闲话时，我从来不参与。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (661, 386, 3, 'YES_NO', 'REQUIRED', '只要我开始做一件事，就很难放下，哪怕是暂时的。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (662, 387, 3, 'YES_NO', 'REQUIRED', '我的小便不困难，也不难控制。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (663, 388, 3, 'YES_NO', 'REQUIRED', '我常发现别人妒忌我的好主意，因为他们没能先想到。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (664, 389, 3, 'YES_NO', 'REQUIRED', '只要有可能，我就避开人群。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (665, 390, 3, 'YES_NO', 'REQUIRED', '我不怕见生人。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (666, 391, 3, 'YES_NO', 'REQUIRED', '记得我曾经为了不想做某件事而装过病。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (667, 392, 3, 'YES_NO', 'REQUIRED', '在火车和公共汽车上，我常跟陌生人交谈。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (668, 393, 3, 'YES_NO', 'REQUIRED', '当事情不顺利的时候，我就想立即放弃。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (669, 394, 3, 'YES_NO', 'REQUIRED', '我不愿意让人家知道我对于事物的态度。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (670, 395, 3, 'YES_NO', 'REQUIRED', '有些时间，我感到劲头十足，以至一连好几天都不需要睡觉。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (671, 396, 3, 'YES_NO', 'REQUIRED', '在人群中，如果叫我带头发言，或对我所熟悉的事情发表意见，我并不感到不好意思。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (672, 397, 3, 'YES_NO', 'REQUIRED', '我喜欢聚会和社交活动。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (673, 398, 3, 'YES_NO', 'REQUIRED', '面对困难或危险的时候，我总退缩不前。');
insert into psychtestquestions(id, sub_id, test_id, type, require, description) values (674, 399, 3, 'YES_NO', 'REQUIRED', '我原来想做的事，假若别人认为不值得做，我很容易放弃。');






-- 爱德华个人偏好测验（EPPS）
-- 指导语：对于每道题的Ａ、Ｂ应当根据你当前的喜欢、倾向与感觉来选择，而不是你认为应该喜欢什么或怎样感觉，而且只能选择其一，假如二个你都有，请选择强度最大，最能反映你特征的一个答案，
-- 假如二个都没有正确描述你的感觉，那你应当选你认为比较正确的。
-- 题目内容（共225题）： 

insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(675, 1, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(562, 675, 'A', '当我的朋友有麻烦时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, identity, description) values(563, 675, 'B', '对我所承担的一切事情，我都喜欢尽我最大的努力去做');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(676, 2, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(564, 676, 'A', '我喜欢探求伟人对我所感兴趣的各种问题有什么看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(565, 676, 'B', '我喜欢完成具有重大意义的事情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(677, 3, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(566, 677, 'A', '我喜欢我写的所有的东西都很精确、清楚、有条有理');
insert into psychtestquestionoptions(id, question_id, identity, description) values(567, 677, 'B', '我喜欢在某些职业、专业或专门项目上自己是公认的权威');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(678, 4, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(568, 678, 'A', '我喜欢在宴会上讲些趣事与笑话');
insert into psychtestquestionoptions(id, question_id, identity, description) values(569, 678, 'B', '我喜欢写本伟大的小说或剧本');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(679, 5, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(570, 679, 'A', '我喜欢我能随我的意志来去自如');
insert into psychtestquestionoptions(id, question_id, identity, description) values(571, 679, 'B', '我喜欢能够自豪地说我将一件难题成功地处理了');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(680, 6, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(572, 680, 'A', '我喜欢解答其他人觉得很困难的谜语与问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(573, 680, 'B', '我喜欢遵从指示去做人家期待我做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(681, 7, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(574, 681, 'A', '我喜欢在日常生活中体验到新奇与改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values(575, 681, 'B', '当我认为我的上级做得对时，我喜欢对他表示我的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(682, 8, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(576, 682, 'A', '对我所承担的任何工作，我喜欢对其细节作好计划与组织');
insert into psychtestquestionoptions(id, question_id, identity, description) values(577, 682, 'B', '我喜欢遵从指示做我所该做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(683, 9, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(578, 683, 'A', '在公共场合中，我喜欢人们注意和评价我的外表');
insert into psychtestquestionoptions(id, question_id, identity, description) values(579, 683, 'B', '我喜欢读伟人的故事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(684, 10, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(580, 684, 'A', '我喜欢回避要我按照例行方法办事的场合');
insert into psychtestquestionoptions(id, question_id, identity, description) values(581, 684, 'B', '我喜欢读伟人的故事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(685, 11, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(582, 685, 'A', '我喜欢在某些职业、专业或专门项目上自己是个公认的权威');
insert into psychtestquestionoptions(id, question_id, identity, description) values(583, 685, 'B', '我喜欢在工作开始之前对工作做好组织和计划');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(686, 12, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(584, 686, 'A', '我喜欢探求伟人对我所感兴趣的各种问题的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(585, 686, 'B', '假如我必须旅行时，我喜欢把事情事先安排好');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(687, 13, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(586, 687, 'A', '我喜欢将我开了头的工作或任务完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(587, 687, 'B', '我喜欢保持我的书桌或工作间的清洁与整齐');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(688, 14, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(588, 688, 'A', '我喜欢告诉别人我所经历的冒险与奇特的事情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(589, 688, 'B', '我喜欢饮食有规律，并且有固定时间吃东西');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(689, 15, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(590, 689, 'A', '我喜欢独立决定我所要做的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(591, 689, 'B', '我喜欢保持我的书桌或工作间的清洁与整齐');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(690, 16, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(592, 690, 'A', '我喜欢比其他人做得更好');
insert into psychtestquestionoptions(id, question_id, identity, description) values(593, 690, 'B', '我喜欢在宴会上讲些趣闻与笑话');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(691, 17, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(594, 691, 'A', '我喜欢遵从习俗，并避免做我所尊敬的人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(595, 691, 'B', '我喜欢谈我的成就');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(692, 18, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(596, 692, 'A', '我喜欢我的生活安排好，过得顺利，而不用对我的计划作太多改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values(597, 692, 'B', '我喜欢告诉别人我所经历的冒险与奇特的事情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(693, 19, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(598, 693, 'A', '我喜欢阅读以性为主的书与剧本');
insert into psychtestquestionoptions(id, question_id, identity, description) values(599, 693, 'B', '我喜欢在团体中成为众目所瞩的对象');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(694, 20, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(600, 694, 'A', '我喜欢批判权威人士');
insert into psychtestquestionoptions(id, question_id, identity, description) values(601, 694, 'B', '我喜欢用别人不懂其意义的字眼');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(695, 21, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(602, 695, 'A', '我喜欢完成其他人认为需要技巧和努力的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(603, 695, 'B', '我喜欢能随我的意志来去自如');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(696, 22, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(604, 696, 'A', '我喜欢称赞我所崇拜的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(605, 696, 'B', '我喜欢很自如地做我想做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(697, 23, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(606, 697, 'A', '我喜欢将我的信、帐单和其他文件整齐地排列着并以某种系统存档');
insert into psychtestquestionoptions(id, question_id, identity, description) values(607, 697, 'B', '我希望独立决定我要做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(698, 24, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(608, 698, 'A', '我喜欢提出明知没有人能回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(609, 698, 'B', '我喜欢批判权威人士');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(699, 25, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(610, 699, 'A', '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, identity, description) values(611, 699, 'B', '我喜欢回避责任与义务');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(700, 26, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(612, 700, 'A', '我喜欢将所承担的事办成功');
insert into psychtestquestionoptions(id, question_id, identity, description) values(613, 700, 'B', '我喜欢结交新朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(701, 27, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(614, 701, 'A', '我喜欢遵照指示去做我所该做的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(615, 701, 'B', '我喜欢与朋友有深厚的友谊');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(702, 28, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(616, 702, 'A', '我喜欢我写的所有东西都很精确、清楚、有条有理');
insert into psychtestquestionoptions(id, question_id, identity, description) values(617, 702, 'B', '我喜欢广交朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(703, 29, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(618, 703, 'A', '我喜欢在宴会中说趣闻与笑话');
insert into psychtestquestionoptions(id, question_id, identity, description) values(619, 703, 'B', '我喜欢写信给我的朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(704, 30, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(620, 704, 'A', '我喜欢能随我的意志来去自如');
insert into psychtestquestionoptions(id, question_id, identity, description) values(621, 704, 'B', '我喜欢与朋友分享一切');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(705, 31, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(622, 705, 'A', '我喜欢解答别人认为困难的谜语与问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(623, 705, 'B', '我喜欢就一个人为什么那样做去判断他，而不从他实际上做什么去判断他');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(706, 32, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(624, 706, 'A', '我喜欢接受我所崇拜的人领导');
insert into psychtestquestionoptions(id, question_id, identity, description) values(625, 706, 'B', '我喜欢了解我的朋友们对他们所面对的各种问题怎样感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(707, 33, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(626, 707, 'A', '我喜欢饮食有规律，并且在固定时间吃东西');
insert into psychtestquestionoptions(id, question_id, identity, description) values(627, 707, 'B', '我喜欢研究与分析别人的行为');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(708, 34, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(628, 708, 'A', '我喜欢说别人认为机智与聪明的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(629, 708, 'B', '我喜欢将自己放在别人的立场上，看自己若处在相同的情境会有什么感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(709, 35, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(630, 709, 'A', '我喜欢照我的意思做我想做的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(631, 709, 'B', '我喜欢观察其他人在某个场合的感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(710, 36, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(632, 710, 'A', '我喜欢完成别人认为需要技巧和努力的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(633, 710, 'B', '我喜欢在我失败时朋友们能鼓励我');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(711, 37, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(634, 711, 'A', '作计划时，我喜欢从其见解为我所尊重的人那里获得些建议');
insert into psychtestquestionoptions(id, question_id, identity, description) values(635, 711, 'B', '我喜欢我的朋友对我仁慈');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(712, 38, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(636, 712, 'A', '我喜欢我的朋友的生活安排得好，过得顺利，而不用我的计划作太多的改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values(637, 712, 'B', '当我生病时，我喜欢我的朋友感到不安');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(713, 39, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(638, 713, 'A', '我喜欢在团体中成为众目所瞩的对象');
insert into psychtestquestionoptions(id, question_id, identity, description) values(639, 713, 'B', '当我受伤或生病时，我喜欢我的朋友为此小题大作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(714, 40, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(640, 714, 'A', '我喜欢回避要我按照例行方式办事的场合');
insert into psychtestquestionoptions(id, question_id, identity, description) values(641, 714, 'B', '当我沮丧时，我喜欢我的朋友们同情我并使我愉快');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(715, 41, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(642, 715, 'A', '我想写一本伟大的小说或剧本');
insert into psychtestquestionoptions(id, question_id, identity, description) values(643, 715, 'B', '当作为群众团体的一个成员时，我喜欢被指定或选为领导者');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(716, 42, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(644, 716, 'A', '在团体中，我喜欢接受别人的领导来决定团体该作什么');
insert into psychtestquestionoptions(id, question_id, identity, description) values(645, 716, 'B', '只要可能，我喜欢监督与指导别人的行动');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(717, 43, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(646, 717, 'A', '我喜欢将我的信、帐单和其他文件整齐地排列着并以某种系统存档');
insert into psychtestquestionoptions(id, question_id, identity, description) values(647, 717, 'B', '我喜欢成为我所属的机构与团体的领导之一');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(718, 44, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(648, 718, 'A', '我喜欢问些明知别人回答不出来的问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(649, 718, 'B', '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(719, 45, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(650, 719, 'A', '我喜欢逃避责任与义务');
insert into psychtestquestionoptions(id, question_id, identity, description) values(651, 719, 'B', '我喜欢被人们叫去做和事佬');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(720, 46, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(652, 720, 'A', '我喜欢在某种职业、专业或专门项目上成为公认的权威');
insert into psychtestquestionoptions(id, question_id, identity, description) values(653, 720, 'B', '每当我做错了事，我感到有罪恶感');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(721, 47, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(654, 721, 'A', '我喜欢读伟人的故事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(655, 721, 'B', '我觉得我必须承认我所做的一些错事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(722, 48, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(656, 722, 'A', '对我所承担的任何工作，我喜欢对其细节作好计划与组织');
insert into psychtestquestionoptions(id, question_id, identity, description) values(657, 722, 'B', '当事情不顺时，我感到我比任何人更该受到责备');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(723, 49, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(658, 723, 'A', '我喜欢用些别人常常不明白其意义的字眼');
insert into psychtestquestionoptions(id, question_id, identity, description) values(659, 723, 'B', '我觉得样样不如人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(724, 50, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(660, 724, 'A', '我喜欢批评权威人士');
insert into psychtestquestionoptions(id, question_id, identity, description) values(661, 724, 'B', '在我认为是我上司的人面前，我感到胆怯');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(725, 51, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(662, 725, 'A', '对我所承担的一切事情，我喜欢尽力而为');
insert into psychtestquestionoptions(id, question_id, identity, description) values(663, 725, 'B', '我喜欢帮助比我不幸的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(726, 52, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(664, 726, 'A', '我喜欢探求伟人们对我所感兴趣的各种问题有什么看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(665, 726, 'B', '我喜欢对朋友们慷慨');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(727, 53, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(666, 727, 'A', '在处理难题时，我喜欢在开始之前作计划');
insert into psychtestquestionoptions(id, question_id, identity, description) values(667, 727, 'B', '我喜欢为我的朋友做点小事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(728, 54, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(668, 728, 'A', '我喜欢对别人谈我所经历的冒险与奇特的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(669, 728, 'B', '我喜欢我的朋友信任我，并对我倾诉他们的麻烦');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(729, 55, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(670, 729, 'A', '我喜欢发表我对事情的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(671, 729, 'B', '我喜欢原谅有时可能伤害了我的朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(730, 56, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(672, 730, 'A', '我喜欢自己能比其他人做得更好');
insert into psychtestquestionoptions(id, question_id, identity, description) values(673, 730, 'B', '我喜欢在新奇的餐厅里吃饭');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(731, 57, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(674, 731, 'A', '我喜欢遵从习俗避免做我所尊敬的人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(675, 731, 'B', '我喜欢追求时髦');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(732, 58, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(676, 732, 'A', '在开始工作之前，我喜欢对它做好组织与计划');
insert into psychtestquestionoptions(id, question_id, identity, description) values(677, 732, 'B', '我喜欢旅行和到处观光');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(733, 59, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(678, 733, 'A', '在公共场合，我喜欢人们注意和评价我的外表');
insert into psychtestquestionoptions(id, question_id, identity, description) values(679, 733, 'B', '我喜欢搬家，住在不同的地方');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(734, 60, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(680, 734, 'A', '我喜欢独立决定我所要做的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(681, 734, 'B', '我喜欢做些新鲜且有变化的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(735, 61, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(682, 735, 'A', '我喜欢我能自豪地说我解决了一个难题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(683, 735, 'B', '对我所承担的事，我喜欢认真去做');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(736, 62, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(684, 736, 'A', '当我认为我的上司做得对时，我喜欢对他们表示我的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(685, 736, 'B', '我喜欢在接受其他事之前完成手头的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(737, 63, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(686, 737, 'A', '假如我必须旅行时，我喜欢事先计划好');
insert into psychtestquestionoptions(id, question_id, identity, description) values(687, 737, 'B', '我喜欢继续解我的难题或问题，直到解决为止');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(738, 64, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(688, 738, 'A', '我有时喜欢做些事，只为了想看别人对此事的反应');
insert into psychtestquestionoptions(id, question_id, identity, description) values(689, 738, 'B', '我喜欢固定在某一职业或问题上，甚至看来它好象没有什么希望');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(739, 65, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(690, 739, 'A', '我喜欢做别人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(691, 739, 'B', '我喜欢不受干扰地长时间工作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(740, 66, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(692, 740, 'A', '我喜欢完成具有重大意义的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(693, 740, 'B', '我不在乎与迷人的异性表示亲近');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(741, 67, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(694, 741, 'A', '我喜欢称赞我所崇拜的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(695, 741, 'B', '我喜欢被异性认为身材吸引人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(742, 68, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(696, 742, 'A', '我喜欢保持我的书桌与工作间的清洁与整齐');
insert into psychtestquestionoptions(id, question_id, identity, description) values(697, 742, 'B', '我喜欢与异性谈情说爱');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(743, 69, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(698, 743, 'A', '我喜欢谈我的成就');
insert into psychtestquestionoptions(id, question_id, identity, description) values(699, 743, 'B', '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(744, 70, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(700, 744, 'A', '我喜欢依我的方式做事而不在乎别人的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(701, 744, 'B', '我喜欢看以性为主的书或剧本');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(745, 71, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(702, 745, 'A', '我喜欢写本伟大的小说或剧本');
insert into psychtestquestionoptions(id, question_id, identity, description) values(703, 745, 'B', '我喜欢考虑与我看法相反的观点');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(746, 72, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(704, 746, 'A', '在团体中我喜欢接受别人的领导来决定团体该做什么');
insert into psychtestquestionoptions(id, question_id, identity, description) values(705, 746, 'B', '假如某人罪有应得的话我想公开的进行批评');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(747, 73, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(706, 747, 'A', '我喜欢我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values(707, 747, 'B', '当我动怒时，我想摔东西');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(748, 74, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(708, 748, 'A', '我喜欢问些没有人能回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(709, 748, 'B', '我喜欢对别人说我对他们的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(749, 75, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(710, 749, 'A', '我喜欢回避责任与义务');
insert into psychtestquestionoptions(id, question_id, identity, description) values(711, 749, 'B', '我想取笑那些我认为他们行为愚蠢的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(750, 76, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(712, 750, 'A', '我喜欢对我的朋友忠实');
insert into psychtestquestionoptions(id, question_id, identity, description) values(713, 750, 'B', '对所有我承担的事，我喜欢尽力做好');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(751, 77, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(714, 751, 'A', '我喜欢观察别人在某些情况下的感觉');
insert into psychtestquestionoptions(id, question_id, identity, description) values(715, 751, 'B', '我喜欢我能自豪地说我成功地解决了一件难题');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(752, 78, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(716, 752, 'A', '当我失败时，我喜欢我的朋友鼓励我');
insert into psychtestquestionoptions(id, question_id, identity, description) values(717, 752, 'B', '我喜欢将所承担的事做得很成功');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(753, 79, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(718, 753, 'A', '我喜欢成为所属机构与团体的领导之一');
insert into psychtestquestionoptions(id, question_id, identity, description) values(719, 753, 'B', '我喜欢能比别人做得更好');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(754, 80, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(720, 754, 'A', '我喜欢当发生差错时，我觉得我比别人更该受到责备');
insert into psychtestquestionoptions(id, question_id, identity, description) values(721, 754, 'B', '我喜欢解答别人认为困难的谜语和问题');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(755, 81, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(722, 755, 'A', '我喜欢为我的朋友做事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(723, 755, 'B', '作计划时，我喜欢从其见解为我所尊敬的人那里得到些建议');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(756, 82, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(724, 756, 'A', '我喜欢将自己放在别人的处境上，去想象在同样的情况下也会有什么感觉');
insert into psychtestquestionoptions(id, question_id, identity, description) values(725, 756, 'B', '当我认为上司做得对时，我喜欢对他们表示我的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(757, 83, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(726, 757, 'A', '当我有问题时，我喜欢我的朋友能同情与了解');
insert into psychtestquestionoptions(id, question_id, identity, description) values(727, 757, 'B', '我喜欢接受我所尊敬的人领导');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(758, 84, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(728, 758, 'A', '在群众团体中，我喜欢被指定或选为领导者');
insert into psychtestquestionoptions(id, question_id, identity, description) values(729, 758, 'B', '在团体中，我喜欢接受别人的领导来决定团体该怎么做');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(759, 85, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(730, 759, 'A', '假如我作错了事，我觉得应该受处罚');
insert into psychtestquestionoptions(id, question_id, identity, description) values(731, 759, 'B', '我喜欢遵从习俗，避免做我所尊敬的人认为不合常规的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(760, 86, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(732, 760, 'A', '我喜欢与朋友分享一切');
insert into psychtestquestionoptions(id, question_id, identity, description) values(733, 760, 'B', '在开始做困难的事情之前，我喜欢先做计划');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(761, 87, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(734, 761, 'A', '我喜欢了解我的朋友在面临各种问题时的感觉');
insert into psychtestquestionoptions(id, question_id, identity, description) values(735, 761, 'B', '假如我必须旅行时，我喜欢事先将事情安排好');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(762, 88, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(736, 762, 'A', '我喜欢我的朋友对我仁慈');
insert into psychtestquestionoptions(id, question_id, identity, description) values(737, 762, 'B', '在开始之前，我喜欢将工作组织与计划好');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(763, 89, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(738, 763, 'A', '我喜欢被别人看作领导');
insert into psychtestquestionoptions(id, question_id, identity, description) values(739, 763, 'B', '我喜欢将我的信件、帐单与其他文件整齐地排列着并依某种系统存档');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(764, 90, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(740, 764, 'A', '我感到我所受的痛苦与折磨对我而言是好处多于坏处');
insert into psychtestquestionoptions(id, question_id, identity, description) values(741, 764, 'B', '我喜欢将我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(765, 91, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(742, 765, 'A', '我喜欢与我的朋友有深厚的交情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(743, 765, 'B', '我喜欢说些别人认为机智与聪明的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(766, 92, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(744, 766, 'A', '我喜欢观察我的朋友们的性格并尝试找出使他们成为这样的原因');
insert into psychtestquestionoptions(id, question_id, identity, description) values(745, 766, 'B', '我有时喜欢做些事，只为了想看别人对它的反应');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(767, 93, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(746, 767, 'A', '当我受伤或生病时，我喜欢我的朋友们小题大作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(747, 767, 'B', '我喜欢谈我的成就');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(768, 94, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(748, 768, 'A', '我喜欢告诉别人该怎么做他们的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(749, 768, 'B', '我喜欢成为团体中众目所瞩的对象');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(769, 95, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(750, 769, 'A', '在所认定的强者面前我感到胆怯');
insert into psychtestquestionoptions(id, question_id, identity, description) values(751, 769, 'B', '我喜欢用些别人不懂其意义的字眼');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(770, 96, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(752, 770, 'A', '我比较喜欢与朋友共事而不喜欢独自工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(753, 770, 'B', '我喜欢表达我对事情的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(771, 97, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(754, 771, 'A', '我喜欢研究与分析他人的行为');
insert into psychtestquestionoptions(id, question_id, identity, description) values(755, 771, 'B', '我喜欢做些别人认为不合常规的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(772, 98, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(756, 772, 'A', '当我生病时，我喜欢朋友们为我感伤');
insert into psychtestquestionoptions(id, question_id, identity, description) values(757, 772, 'B', '我喜欢避免需要依常规做事的场合');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(773, 99, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(758, 773, 'A', '只要可能，我喜欢监督与指导别人的行为');
insert into psychtestquestionoptions(id, question_id, identity, description) values(759, 773, 'B', '我喜欢依我的方式做事而不在乎别人的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(774, 100, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(760, 774, 'A', '我觉得我处处不如人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(761, 774, 'B', '我喜欢回避责任与义务');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(775, 101, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(762, 775, 'A', '我喜欢将我所承担的事办成功');
insert into psychtestquestionoptions(id, question_id, identity, description) values(763, 775, 'B', '我喜欢结交新朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(776, 102, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(764, 776, 'A', '我喜欢分析我自己的动机与感情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(765, 776, 'B', '我喜欢广交朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(777, 103, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(766, 777, 'A', '当我有困难时，我喜欢我的朋友帮助我');
insert into psychtestquestionoptions(id, question_id, identity, description) values(767, 777, 'B', '我喜欢为我的朋友做事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(778, 104, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(768, 778, 'A', '当我的观点被冲击时，我喜欢为之辩护');
insert into psychtestquestionoptions(id, question_id, identity, description) values(769, 778, 'B', '我喜欢写信给我的朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(779, 105, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(770, 779, 'A', '每当我做错事时，我感到内疚');
insert into psychtestquestionoptions(id, question_id, identity, description) values(771, 779, 'B', '我喜欢与朋友有深交');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(780, 106, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(772, 780, 'A', '我喜欢与朋友分享一切');
insert into psychtestquestionoptions(id, question_id, identity, description) values(773, 780, 'B', '我喜欢分析我自己的动机与情感');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(781, 107, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(774, 781, 'A', '我喜欢接受我所尊敬的人的领导');
insert into psychtestquestionoptions(id, question_id, identity, description) values(775, 781, 'B', '我喜欢了解我的朋友在面临各种问题时的感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(782, 108, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(776, 782, 'A', '我喜欢我的朋友们高兴地为我办些小事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(777, 782, 'B', '我喜欢从人们为什么那样做而不从他实际做什么来判断人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(783, 109, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(778, 783, 'A', '大家在一起时，我喜欢决定我们该做什么');
insert into psychtestquestionoptions(id, question_id, identity, description) values(779, 783, 'B', '我喜欢预测我的朋友们在各种情况下的反应');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(784, 110, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(780, 784, 'A', '当我退让或避免了冲突时，我觉得比争取达到目标时还好些');
insert into psychtestquestionoptions(id, question_id, identity, description) values(781, 784, 'B', '我喜欢分析他人的感情与动机');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(785, 111, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(782, 785, 'A', '我喜欢结交新朋友');
insert into psychtestquestionoptions(id, question_id, identity, description) values(783, 785, 'B', '当我有麻烦时，我喜欢我的朋友帮助我');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(786, 112, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(784, 786, 'A', '我喜欢从人们为什么那样做而不从他实际做什么来判断人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(785, 786, 'B', '我喜欢我的朋友们对我有深情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(787, 113, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(786, 787, 'A', '我喜欢将我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');
insert into psychtestquestionoptions(id, question_id, identity, description) values(787, 787, 'B', '当我生病时，我喜欢朋友们为我感伤');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(788, 114, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(788, 788, 'A', '我喜欢被人叫做和事佬');
insert into psychtestquestionoptions(id, question_id, identity, description) values(789, 788, 'B', '我喜欢我的朋友高兴地为我办点小事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(789, 115, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(790, 789, 'A', '我觉得我必须承认自己做错了的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(791, 789, 'B', '当我沮丧时，我喜欢我的朋友们同情我，并使我愉快');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(790, 116, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(792, 790, 'A', '我喜欢与朋友们共事而不喜欢独自进行工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(793, 790, 'B', '当我的观点被攻击时，我喜欢为之辩护');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(791, 117, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(794, 791, 'A', '我喜欢观察我的朋友们的性格，试着找出究竟是什么缘故使他们成为现在这样');
insert into psychtestquestionoptions(id, question_id, identity, description) values(795, 791, 'B', '我喜欢能说服与影响其他人去做他们的工作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(792, 118, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(796, 792, 'A', '当我沮丧时，我喜欢我的朋友们同情我，并使我愉快');
insert into psychtestquestionoptions(id, question_id, identity, description) values(797, 792, 'B', '在团体中，我喜欢决定我们该做什么');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(793, 119, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(798, 793, 'A', '我喜欢问明知没有人回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, identity, description) values(799, 793, 'B', '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(794, 120, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(800, 794, 'A', '在我所认定的强者面前，我感到胆怯');
insert into psychtestquestionoptions(id, question_id, identity, description) values(801, 794, 'B', '只要我能够的话，我喜欢监督与指导别人的行动');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(795, 121, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(802, 795, 'A', '我喜欢加入一个成员之间彼此温暖与友善的团体');
insert into psychtestquestionoptions(id, question_id, identity, description) values(803, 795, 'B', '我知道自己做错了些事时会感到内疚');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(796, 122, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(804, 796, 'A', '我喜欢分析别人的感情与动机');
insert into psychtestquestionoptions(id, question_id, identity, description) values(805, 796, 'B', '由于自己无能力处理各种情况使我感到沮丧');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(797, 123, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(806, 797, 'A', '当我生病时，我喜欢朋友们为我感伤');
insert into psychtestquestionoptions(id, question_id, identity, description) values(807, 797, 'B', '当我退让或避免争执时，我感到比争取达到目的时还好些');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(798, 124, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(808, 798, 'A', '我喜欢我能够说服与影响他人做我想做的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(809, 798, 'B', '由于自己无能力处理各种情况使我感到沮丧');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(799, 125, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(810, 799, 'A', '我喜欢批评权威人士');
insert into psychtestquestionoptions(id, question_id, identity, description) values(811, 799, 'B', '在我认为是上司的人面前，我感到胆怯');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(800, 126, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(812, 800, 'A', '我喜欢加入在成员之间彼此具有温暖与友爱的感情的团体');
insert into psychtestquestionoptions(id, question_id, identity, description) values(813, 800, 'B', '当我的朋友有麻烦时，我喜欢帮助他们');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(801, 127, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(814, 801, 'A', '我喜欢分析我的动机与情感');
insert into psychtestquestionoptions(id, question_id, identity, description) values(815, 801, 'B', '当我的朋友受伤时，我喜欢同情他们');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(802, 128, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(816, 802, 'A', '当我有麻烦时，我喜欢我的朋友帮助我');
insert into psychtestquestionoptions(id, question_id, identity, description) values(817, 802, 'B', '我喜欢待人以仁慈与同情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(803, 129, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(818, 803, 'A', '我喜欢成为我所属机构与团体的领导之一');
insert into psychtestquestionoptions(id, question_id, identity, description) values(819, 803, 'B', '当我的朋友受伤或生病时，我喜欢同情他们');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(804, 130, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(820, 804, 'A', '我觉得所受的痛苦与不幸是好处多于坏处');
insert into psychtestquestionoptions(id, question_id, identity, description) values(821, 804, 'B', '我喜欢对我的朋友表示自己的深情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(805, 131, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(822, 805, 'A', '我喜欢与朋友共事而不喜欢独立工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(823, 805, 'B', '我喜欢试验与尝试新东西');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(806, 132, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(824, 806, 'A', '我喜欢思索我的朋友们的性格，探讨为什么他们象现在这样');
insert into psychtestquestionoptions(id, question_id, identity, description) values(825, 806, 'B', '我喜欢尝试新职业，而不喜欢一直做同样的老事情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(807, 133, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(826, 807, 'A', '当我有问题时，我喜欢我的朋友们能同情与了解');
insert into psychtestquestionoptions(id, question_id, identity, description) values(827, 807, 'B', '我喜欢见些原来不熟悉的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(808, 134, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(828, 808, 'A', '当我的观点被攻击时，我喜欢为之辩护');
insert into psychtestquestionoptions(id, question_id, identity, description) values(829, 808, 'B', '我喜欢在日常生活中经历新奇与变迁');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(809, 135, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(830, 809, 'A', '当我退让避免了争执时，我感到比照自己的方式做还好些');
insert into psychtestquestionoptions(id, question_id, identity, description) values(831, 809, 'B', '我喜欢搬家住到不同的地方');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(810, 136, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(832, 810, 'A', '我喜欢为我的朋友办事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(833, 810, 'B', '当我有功课要做时，我喜欢及时做并一直工作至完成为止');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(811, 137, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(834, 811, 'A', '我喜欢分析别人的感情与动机');
insert into psychtestquestionoptions(id, question_id, identity, description) values(835, 811, 'B', '当我工作时，我喜欢避开干扰');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(812, 138, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(836, 812, 'A', '我喜欢我的朋友们高兴地为我办点小事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(837, 812, 'B', '我喜欢熬夜将工作完成');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(813, 139, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(838, 813, 'A', '我喜欢被人当作领导');
insert into psychtestquestionoptions(id, question_id, identity, description) values(839, 813, 'B', '我喜欢长时间地工作而不受别人干扰');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(814, 140, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(840, 814, 'A', '假如我做错了事的话，我觉得我应当受责备');
insert into psychtestquestionoptions(id, question_id, identity, description) values(841, 814, 'B', '我喜欢坚持我的职业与方向，甚至看起来好象没什么进展时，我也不在乎');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(815, 141, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(842, 815, 'A', '我喜欢对我的朋友忠实');
insert into psychtestquestionoptions(id, question_id, identity, description) values(843, 815, 'B', '我喜欢与迷人的异性约会');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(816, 142, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(844, 816, 'A', '我喜欢预测我的朋友在各种情况下的行动');
insert into psychtestquestionoptions(id, question_id, identity, description) values(845, 816, 'B', '我喜欢参与有关性与性行为的讨论');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(817, 143, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(846, 817, 'A', '我喜欢我的朋友对我有深情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(847, 817, 'B', '我喜欢变得性兴奋');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(818, 144, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(848, 818, 'A', '在一群人中，我喜欢由我决定该做什么');
insert into psychtestquestionoptions(id, question_id, identity, description) values(849, 818, 'B', '我喜欢参与有异性的社交场合');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(819, 145, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(850, 819, 'A', '我为自己无力处理各种情况感到内疚');
insert into psychtestquestionoptions(id, question_id, identity, description) values(851, 819, 'B', '我喜欢看以性为主的书与剧本');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(820, 146, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(852, 820, 'A', '我喜欢写信给我的朋友');
insert into psychtestquestionoptions(id, question_id, identity, description) values(853, 820, 'B', '我喜欢看报上有关谋杀与其他暴力方面的新闻');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(821, 147, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(854, 821, 'A', '我喜欢预测我的朋友们在各种情况下将怎么做');
insert into psychtestquestionoptions(id, question_id, identity, description) values(855, 821, 'B', '我喜欢攻击与我观点相反的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(822, 148, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(856, 822, 'A', '当我受伤或生病时，我喜欢我的朋友们为我小题大作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(857, 822, 'B', '当事情不顺时，我想责怪别人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(823, 149, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(858, 823, 'A', '我喜欢告诉别人如何做他们的工作');
insert into psychtestquestionoptions(id, question_id, identity, description) values(859, 823, 'B', '当有人侮辱我时，我想报复');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(824, 150, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(860, 824, 'A', '我喜欢我处处不如人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(861, 824, 'B', '当我不赞同他们的看法时，我喜欢说服他们');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(825, 151, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(862, 825, 'A', '当我的朋友有麻烦时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, identity, description) values(863, 825, 'B', '对我所承担的一切事情，我喜欢认真去做');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(826, 152, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(864, 826, 'A', '我喜欢旅行，到各处看看');
insert into psychtestquestionoptions(id, question_id, identity, description) values(865, 826, 'B', '我喜欢完成别人认为需要技巧与努力的任务');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(827, 153, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(866, 827, 'A', '对我所承担的一切事情，我喜欢认真去做');
insert into psychtestquestionoptions(id, question_id, identity, description) values(867, 827, 'B', '我喜欢完成某些具有重大意义的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(828, 154, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(868, 828, 'A', '我喜欢与迷人的异性约会');
insert into psychtestquestionoptions(id, question_id, identity, description) values(869, 828, 'B', '对我所承担的事我希望能够成功');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(829, 155, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(870, 829, 'A', '我喜欢看报纸上有关谋杀与其他形式的暴力新闻');
insert into psychtestquestionoptions(id, question_id, identity, description) values(871, 829, 'B', '我想写本伟大的小说或剧本');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(830, 156, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(872, 830, 'A', '我喜欢对我的朋友做点小事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(873, 830, 'B', '做计划时，我喜欢我所尊敬的人给我提出些建议');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(831, 157, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(874, 831, 'A', '我喜欢在日常生活经历新奇与变异');
insert into psychtestquestionoptions(id, question_id, identity, description) values(875, 831, 'B', '当我认为我的上司做得对时，我喜欢对他们表示我的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(832, 158, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(876, 832, 'A', '我喜欢熬夜将工作完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(877, 832, 'B', '我喜欢称赞我所仰慕的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(833, 159, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(878, 833, 'A', '我喜欢变得性兴奋');
insert into psychtestquestionoptions(id, question_id, identity, description) values(879, 833, 'B', '我喜欢接受我所仰慕的人领导');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(834, 160, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(880, 834, 'A', '当有人欺负我时，我想报复');
insert into psychtestquestionoptions(id, question_id, identity, description) values(881, 834, 'B', '在团体中，我喜欢接受别人的领导来决定团体该做什么');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(835, 161, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(882, 835, 'A', '我喜欢对我的朋友慷慨');
insert into psychtestquestionoptions(id, question_id, identity, description) values(883, 835, 'B', '在做困难的事之前，我喜欢先作个计划');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(836, 162, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(884, 836, 'A', '我喜欢交新朋友');
insert into psychtestquestionoptions(id, question_id, identity, description) values(885, 836, 'B', '我希望我的一切作品都是严密、整齐而有条理的');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(837, 163, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(886, 837, 'A', '我喜欢将我开了头的事情或工作完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(887, 837, 'B', '我喜欢使我的书桌与工作间保持清洁与整齐');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(838, 164, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(888, 838, 'A', '我喜欢被异性认为身材迷人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(889, 838, 'B', '对我所承担的任何事，我喜欢仔细无遗地进行计划与组织');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(839, 165, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(890, 839, 'A', '我喜欢告诉别人我对他们的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(891, 839, 'B', '我喜欢饮食有规律，并在固定的时间吃东西');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(840, 166, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(892, 840, 'A', '我喜欢对我的朋友表示深情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(893, 840, 'B', '我喜欢说些别人认为机智与聪明的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(841, 167, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(894, 841, 'A', '我喜欢尝试新工作而不喜欢一直做同样的老事情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(895, 841, 'B', '我有时想做一些事情的目的只为了想看别人对它的反应');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(842, 168, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(896, 842, 'A', '我喜欢坚持自己的工作与方向，即便看来好象已进入了无底深渊。我也不在乎');
insert into psychtestquestionoptions(id, question_id, identity, description) values(897, 842, 'B', '在工作场合中我喜欢别人注意我和评价我的外表');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(843, 169, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(898, 843, 'A', '我喜欢看以性为主题的书与剧本');
insert into psychtestquestionoptions(id, question_id, identity, description) values(899, 843, 'B', '在团体中，我喜欢成为人所注目的对象');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(844, 170, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(900, 844, 'A', '当事情不顺时，我想责怪别人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(901, 844, 'B', '我喜欢问些明知没有人能回答的问题');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(845, 171, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(902, 845, 'A', '当我的朋友受伤或生病时，我喜欢对他们表示同情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(903, 845, 'B', '我喜欢发表我对事情的看法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(846, 172, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(904, 846, 'A', '我喜欢在新奇的餐厅吃饭');
insert into psychtestquestionoptions(id, question_id, identity, description) values(905, 846, 'B', '我喜欢做些别人认为不合常规的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(847, 173, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(906, 847, 'A', '在承担其他事之前，我喜欢每次只做一件事并将它完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(907, 847, 'B', '我喜欢能自如地做我想做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(848, 174, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(908, 848, 'A', '我喜欢参与有关性与性行为的讨论');
insert into psychtestquestionoptions(id, question_id, identity, description) values(909, 848, 'B', '我喜欢照我自己的方式来做而不管别人有什么想法');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(849, 175, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(910, 849, 'A', '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, identity, description) values(911, 849, 'B', '我喜欢回避责任与义务');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(850, 176, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(912, 850, 'A', '当我的朋友有困难时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, identity, description) values(913, 850, 'B', '我喜欢对我的朋友们忠诚');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(851, 177, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(914, 851, 'A', '我喜欢做些新鲜的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(915, 851, 'B', '我喜欢交新朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(852, 178, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(916, 852, 'A', '当我有工作要做时，我喜欢立即开始并持续到工作完成为止');
insert into psychtestquestionoptions(id, question_id, identity, description) values(917, 852, 'B', '我喜欢参与那些成员之间具有温暖与友善情感的团体');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(853, 179, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(918, 853, 'A', '我喜欢与迷人的异性约会');
insert into psychtestquestionoptions(id, question_id, identity, description) values(919, 853, 'B', '我喜欢广交朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(854, 180, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(920, 854, 'A', '我喜欢攻击与我观点相反的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(921, 854, 'B', '我喜欢给朋友写信');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(855, 181, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(922, 855, 'A', '我喜欢我的朋友们慷慨');
insert into psychtestquestionoptions(id, question_id, identity, description) values(923, 855, 'B', '我喜欢观察别人在某一情况下的感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(856, 182, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(924, 856, 'A', '我喜欢在新奇的餐厅吃饭');
insert into psychtestquestionoptions(id, question_id, identity, description) values(925, 856, 'B', '我喜欢将自己放在别人的立场上，来想象在同样的情况下我会有什么感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(857, 183, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(926, 857, 'A', '我喜欢熬夜将工作完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(927, 857, 'B', '我喜欢了解我的朋友们在面临各种问题时的感觉');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(858, 184, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(928, 858, 'A', '我喜欢变得性兴奋');
insert into psychtestquestionoptions(id, question_id, identity, description) values(929, 858, 'B', '我喜欢研究分析别人的行为');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(859, 185, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(930, 859, 'A', '我喜欢取笑那些我觉得是做了蠢事的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(931, 859, 'B', '我喜欢预测我的朋友们在各种情况下会怎么做');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(860, 186, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(932, 860, 'A', '对有时伤害我的朋友，我喜欢原谅他们');
insert into psychtestquestionoptions(id, question_id, identity, description) values(933, 860, 'B', '当我失败时，我喜欢我的朋友们鼓励我');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(861, 187, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(934, 861, 'A', '我喜欢试验与尝试新的事情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(935, 861, 'B', '当我有问题时，我喜欢我的朋友们能同情与了解');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(862, 188, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(936, 862, 'A', '我喜欢持续地解谜语与问题，直到解决为止');
insert into psychtestquestionoptions(id, question_id, identity, description) values(937, 862, 'B', '我喜欢我的朋友对我仁慈');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(863, 189, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(938, 863, 'A', '我喜欢被异性认为身材迷人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(939, 863, 'B', '我喜欢我的朋友们对我有深情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(864, 190, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(940, 864, 'A', '假如某人是罪有应得，我会公开批评他');
insert into psychtestquestionoptions(id, question_id, identity, description) values(941, 864, 'B', '当我受伤或生病时，我喜欢我的朋友们小题大作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(865, 191, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(942, 865, 'A', '我喜欢对我的朋友们有深情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(943, 865, 'B', '我喜欢被人当作领导');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(866, 192, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(944, 866, 'A', '我喜欢尝试新的工作，而不喜欢一直做同样的老事情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(945, 866, 'B', '在群众团体中，我喜欢被指定或被选为领导');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(867, 193, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(946, 867, 'A', '对我起了头的一切事情，我都喜欢将它完成');
insert into psychtestquestionoptions(id, question_id, identity, description) values(947, 867, 'B', '我喜欢我能够说服与影响别人做我所要做的事');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(868, 194, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(948, 868, 'A', '我喜欢参与有关性行为的讨论');
insert into psychtestquestionoptions(id, question_id, identity, description) values(949, 868, 'B', '我愿意被人们叫做和事佬');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(869, 195, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(950, 869, 'A', '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, identity, description) values(951, 869, 'B', '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(870, 196, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(952, 870, 'A', '我喜欢对我的朋友们表示深情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(953, 870, 'B', '当事情有差错时，我觉得我比任何人都该受到责备');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(871, 197, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(954, 871, 'A', '我喜欢搬家，住在不同的地方');
insert into psychtestquestionoptions(id, question_id, identity, description) values(955, 871, 'B', '当我做错事时，我觉得我比任何人都更该受到责备');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(872, 198, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(956, 872, 'A', '我喜欢坚持自己的工作与方向，即便看来好象已使我陷入无底深渊时，我也不在乎');
insert into psychtestquestionoptions(id, question_id, identity, description) values(957, 872, 'B', '我觉得我所受的痛苦与不幸是好处多于坏处');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(873, 199, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(958, 873, 'A', '我喜欢看性为主的书与剧本');
insert into psychtestquestionoptions(id, question_id, identity, description) values(959, 873, 'B', '我觉得我必须承认有些事我做错了');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(874, 200, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(960, 874, 'A', '当事情不顺时，我想责怪别人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(961, 874, 'B', '我觉得我处处不如人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(875, 201, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(962, 875, 'A', '对我所承担的一切事情，我喜欢尽力而为');
insert into psychtestquestionoptions(id, question_id, identity, description) values(963, 875, 'B', '我喜欢帮助比我更不幸的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(876, 202, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(964, 876, 'A', '我喜欢做新的和各不相同的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(965, 876, 'B', '我喜欢待人仁慈和同情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(877, 203, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(966, 877, 'A', '当我有功课要做时，我喜欢及时开始并一直做到完成为止');
insert into psychtestquestionoptions(id, question_id, identity, description) values(967, 877, 'B', '我喜欢帮助比我不幸的人');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(878, 204, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(968, 878, 'A', '我喜欢参与有异性的社交场合');
insert into psychtestquestionoptions(id, question_id, identity, description) values(969, 878, 'B', '我喜欢原谅有时可能伤害了我的朋友');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(879, 205, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(970, 879, 'A', '我喜欢攻击与我观点相反的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(971, 879, 'B', '我喜欢我的朋友们信任我并告诉他们的问题');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(880, 206, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(972, 880, 'A', '我喜欢待人仁慈和同情');
insert into psychtestquestionoptions(id, question_id, identity, description) values(973, 880, 'B', '我喜欢旅行，到各处看看');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(881, 207, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(974, 881, 'A', '我喜欢遵照习俗，避免做人家认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(975, 881, 'B', '我喜欢追求新潮流与时髦');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(882, 208, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(976, 882, 'A', '对我所承担的一切事情，我喜欢认真去做');
insert into psychtestquestionoptions(id, question_id, identity, description) values(977, 882, 'B', '我喜欢在日常生活中经历新奇与变异');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(883, 209, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(978, 883, 'A', '我不在乎与迷人的异性表示亲近');
insert into psychtestquestionoptions(id, question_id, identity, description) values(979, 883, 'B', '我喜欢试验与尝试新的事情');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(884, 210, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(980, 884, 'A', '当我不赞同他人的意见时，我想指责别人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(981, 884, 'B', '我喜欢追求新潮流与时髦');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(885, 211, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(982, 885, 'A', '我喜欢帮助比我不幸的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(983, 885, 'B', '我喜欢将我开了头的任何事情或工作完成 ');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(886, 212, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(984, 886, 'A', '我喜欢搬家，住在不同的地方');
insert into psychtestquestionoptions(id, question_id, identity, description) values(985, 886, 'B', '我喜欢长时间地工作而不受干扰');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(887, 213, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(986, 887, 'A', '假如我必须旅行的话，我喜欢先将事情安排好');
insert into psychtestquestionoptions(id, question_id, identity, description) values(987, 887, 'B', '我喜欢持续地解谜底直到解出为止');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(888, 214, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(988, 888, 'A', '我喜欢与异性谈恋爱');
insert into psychtestquestionoptions(id, question_id, identity, description) values(989, 888, 'B', '在承担别的事之前，我喜欢将现在的工作或任务完成');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(889, 215, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(990, 889, 'A', '我喜欢对别人说我对他们的看法');
insert into psychtestquestionoptions(id, question_id, identity, description) values(991, 889, 'B', '当我工作时，我喜欢避免干扰');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(890, 216, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(992, 890, 'A', '我喜欢为我的朋友们办点小事');
insert into psychtestquestionoptions(id, question_id, identity, description) values(993, 890, 'B', '我喜欢参与有异性的社交场合');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(891, 217, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(994, 891, 'A', '我喜欢见到不熟悉的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(995, 891, 'B', '我不在乎与迷人的异性表示亲近');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(892, 218, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(996, 892, 'A', '我喜欢持续解谜底直到解出为止');
insert into psychtestquestionoptions(id, question_id, identity, description) values(997, 892, 'B', '我喜欢与异性谈恋爱');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(893, 219, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(998, 893, 'A', '我喜欢谈论我的成就');
insert into psychtestquestionoptions(id, question_id, identity, description) values(999, 893, 'B', '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(894, 220, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1000, 894, 'A', '我想取笑那些我认为做了蠢事的人');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1001, 894, 'B', '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(895, 221, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1002, 895, 'A', '我喜欢我的朋友们信任并告诉我他们的麻烦');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1003, 895, 'B', '我喜欢看报上有关谋杀与其他形式暴力的新闻');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(896, 222, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1004, 896, 'A', '我喜欢追求新潮流与时髦');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1005, 896, 'B', '假如某人罪有应得，我会公开批评他');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(897, 223, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1006, 897, 'A', '当我工作时，我喜欢避免干扰');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1007, 897, 'B', '当我不赞同别人的看法，我想责怪他们');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(898, 224, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1008, 898, 'A', '我喜欢听或说与性为主的笑话');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1009, 898, 'B', '当有人侮辱我时，我想报复');


insert into psychtestquestions(id, sub_id, test_id, type, require, description) values(899, 225, 4, 'SINGLE_CHOICE', 'REQUIRED', '');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1010, 899, 'A', '我喜欢回避责任与义务');
insert into psychtestquestionoptions(id, question_id, identity, description) values(1011, 899, 'B', '当有人做了我认为很蠢的事情时，我想取笑他们');















insert into psychtestfactors(id, factor, name) values (1, 'A', '乐群性');
insert into psychtestfactors(id, factor, name) values (2, 'B', '聪慧性');
insert into psychtestfactors(id, factor, name) values (3, 'C', '稳定性');
insert into psychtestfactors(id, factor, name) values (4, 'E', '恃强性');
insert into psychtestfactors(id, factor, name) values (5, 'F', '兴奋性');
insert into psychtestfactors(id, factor, name) values (6, 'G', '有恒性');
insert into psychtestfactors(id, factor, name) values (7, 'H', '敢为性');
insert into psychtestfactors(id, factor, name) values (8, 'I', '敏感性');
insert into psychtestfactors(id, factor, name) values (9, 'L', '怀疑性');
insert into psychtestfactors(id, factor, name) values (10, 'M', '幻想性');
insert into psychtestfactors(id, factor, name) values (11, 'N', '世故性');
insert into psychtestfactors(id, factor, name) values (12, 'O', '忧虑性');
insert into psychtestfactors(id, factor, name) values (13, 'Q1', '实验性');
insert into psychtestfactors(id, factor, name) values (14, 'Q2', '独立性');
insert into psychtestfactors(id, factor, name) values (15, 'Q3', '自律性');
insert into psychtestfactors(id, factor, name) values (16, 'Q4', '紧张性');
