insert into psychtestsuites(id, title, description) values (1, '人格类', '人格类');

insert into psychtests(id, title, description, object, duration, cost, approach) values (1, '16PF', '人格评定以及心理健康评定', '12岁以上', '30', '120', 'MACHINE');
insert into psychtests(id, title, description, object, duration, cost, approach) values (2, '艾森克量表', '人格评定以及心理健康评定', '3岁以上', '10', '100', 'MACHINE');
insert into psychtests(id, title, description, object, duration, cost, approach) values (3, '明尼苏达', '人格评定及精神疾病评定', '12岁以上', '60', '300', 'MACHINE');
insert into psychtests(id, title, description, object, duration, cost, approach) values (4, '爱德华个人偏好量表', '了解性格特点以及内在各项需求评定认知', '12岁以上', '40', '100', 'MACHINE');
insert into psychtests(id, title, description, object, duration, cost, approach) values (5, 'TAT测试', '人格评定以及需求评定', '12岁以上', '10', '100', 'MANUAL');

insert into suite_test(suite_id, test_id) values (1, 1);
insert into suite_test(suite_id, test_id) values (1, 2);
insert into suite_test(suite_id, test_id) values (1, 3);
insert into suite_test(suite_id, test_id) values (1, 4);
insert into suite_test(suite_id, test_id) values (1, 5);


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




-- 卡特尔十六种人格因素测试(16PF)

-- 指导语
--     卡特尔十六种人格因素测验包括一些有关个人兴趣与态度的问题。每个人都有自己的看法，对问题的回答自然不同。无所谓正确或错误。请来试者尽量表达自己的意见。
--     本测验共有187道题， 每道题有三种选择，请将你的选择用鼠标点击,并按回车键确认。作答时，请注意下列四点：
--     １．请不要费时斟酌。应当顺其自然地依你个人的反应选答。一般地说来，问题都略嫌简短而不能包含所有有关的因素或条件。通常每分钟可作五六题，全部问题应在半小时内完成。
--     ２．除非在万不得已的情形下，尽量避免如“介乎Ａ与Ｃ之间”或“不甚确定”这样的中性答案。
--     ３．请不要遗漏，务必对每一个问题作答。 有些问题似乎不符合于你，有些问题又似乎涉及隐私，但本测验的目的，在于研究比较青年或成人的兴趣和态度，希望来试者真实作答。
--     ４．作答时，请坦白表达自己的兴趣与态度，不必顾虑到主试者或其他人的意见与立场。


insert into psychtestquestions(id, test_id, type, description) values (1, 1, 'SINGLE_CHOICE', '我很明了本测验的说明');
insert into psychtestquestionoptions(id, question_id, description) values (1, 1, '是的');
insert into psychtestquestionoptions(id, question_id, description) values (2, 1, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (3, 1, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (2, 1, 'SINGLE_CHOICE', '我对本测验每个问题都会按自己的真实情况作答');
insert into psychtestquestionoptions(id, question_id, description) values (4, 2, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (5, 2, '不一定');
insert into psychtestquestionoptions(id, question_id, description) values (6, 2, '不同意.');


insert into psychtestquestions(id, test_id, type, description) values (3, 1, 'SINGLE_CHOICE', '有度假机会时,我宁愿');
insert into psychtestquestionoptions(id, question_id, description) values (7, 3, '去一个繁华的都市.');
insert into psychtestquestionoptions(id, question_id, description) values (8, 3, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (9, 3, '闲居清静而偏僻的郊区.');


insert into psychtestquestions(id, test_id, type, description) values (4, 1, 'SINGLE_CHOICE', '我有足够的能力应付困难');
insert into psychtestquestionoptions(id, question_id, description) values (10, 4, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (11, 4, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (12, 4, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (5, 1, 'SINGLE_CHOICE', '即使是关在铁笼内的猛兽,我见了也会惴惴不安');
insert into psychtestquestionoptions(id, question_id, description) values (13, 5, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (14, 5, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (15, 5, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (6, 1, 'SINGLE_CHOICE', '我总避免批评别人的言行');
insert into psychtestquestionoptions(id, question_id, description) values (16, 6, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (17, 6, '有时如此.');
insert into psychtestquestionoptions(id, question_id, description) values (18, 6, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (7, 1, 'SINGLE_CHOICE', '我的思想似乎:');
insert into psychtestquestionoptions(id, question_id, description) values (19, 7, '走在了时代前面.');
insert into psychtestquestionoptions(id, question_id, description) values (20, 7, '不太一定.');
insert into psychtestquestionoptions(id, question_id, description) values (21, 7, '正符合时代.');


insert into psychtestquestions(id, test_id, type, description) values (8, 1, 'SINGLE_CHOICE', '我不擅长说笑话讲趣事');
insert into psychtestquestionoptions(id, question_id, description) values (22, 8, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (23, 8, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (24, 8, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (9, 1, 'SINGLE_CHOICE', '当我看到亲友邻居争执时,我总是');
insert into psychtestquestionoptions(id, question_id, description) values (25, 9, '任其自己解决.');
insert into psychtestquestionoptions(id, question_id, description) values (26, 9, '置之不理.');
insert into psychtestquestionoptions(id, question_id, description) values (27, 9, '予以劝解.');


insert into psychtestquestions(id, test_id, type, description) values (10, 1, 'SINGLE_CHOICE', '在社交场合中,我');
insert into psychtestquestionoptions(id, question_id, description) values (28, 10, '谈吐自然.');
insert into psychtestquestionoptions(id, question_id, description) values (29, 10, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (30, 10, '  退避三舍,保持沉默.');


insert into psychtestquestions(id, test_id, type, description) values (11, 1, 'SINGLE_CHOICE', '我愿做一名');
insert into psychtestquestionoptions(id, question_id, description) values (31, 11, '建筑工程师.');
insert into psychtestquestionoptions(id, question_id, description) values (32, 11, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (33, 11, '社会科学的教员.');


insert into psychtestquestions(id, test_id, type, description) values (12, 1, 'SINGLE_CHOICE', '阅读时,我宁愿选读');
insert into psychtestquestionoptions(id, question_id, description) values (34, 12, '著名的宗教教义.');
insert into psychtestquestionoptions(id, question_id, description) values (35, 12, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (36, 12, '国家政治组织的理论.');


insert into psychtestquestions(id, test_id, type, description) values (13, 1, 'SINGLE_CHOICE', '我相信许多人都有些心理不正常，但他们都不愿意这样承认');
insert into psychtestquestionoptions(id, question_id, description) values (37, 13, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (38, 13, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (39, 13, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (14, 1, 'SINGLE_CHOICE', '我所希望的结婚对象应擅长交际而无须有文艺才能');
insert into psychtestquestionoptions(id, question_id, description) values (40, 14, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (41, 14, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (42, 14, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (15, 1, 'SINGLE_CHOICE', '对于头脑简单和不讲理的人,我仍然能待之以礼');
insert into psychtestquestionoptions(id, question_id, description) values (43, 15, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (44, 15, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (45, 15, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (16, 1, 'SINGLE_CHOICE', '受人侍奉时我常感到不安');
insert into psychtestquestionoptions(id, question_id, description) values (46, 16, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (47, 16, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (48, 16, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (17, 1, 'SINGLE_CHOICE', '从事体力或脑力劳动后，我比平常人需要更多的休息才能恢复工作效率');
insert into psychtestquestionoptions(id, question_id, description) values (49, 17, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (50, 17, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (51, 17, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (18, 1, 'SINGLE_CHOICE', '半夜醒来,我会为种种忧虑而不能再入眠');
insert into psychtestquestionoptions(id, question_id, description) values (52, 18, '常常如此.');
insert into psychtestquestionoptions(id, question_id, description) values (53, 18, '有时如此.');
insert into psychtestquestionoptions(id, question_id, description) values (54, 18, '极少如此.');


insert into psychtestquestions(id, test_id, type, description) values (19, 1, 'SINGLE_CHOICE', '事情进行不顺利时,我常会急得掉眼泪');
insert into psychtestquestionoptions(id, question_id, description) values (55, 19, '从不如此.');
insert into psychtestquestionoptions(id, question_id, description) values (56, 19, '有时如此.');
insert into psychtestquestionoptions(id, question_id, description) values (57, 19, '时常如此.');


insert into psychtestquestions(id, test_id, type, description) values (20, 1, 'SINGLE_CHOICE', '我认为只要双方同意就可以离婚，不应当受传统礼教的束缚');
insert into psychtestquestionoptions(id, question_id, description) values (58, 20, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (59, 20, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (60, 20, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (21, 1, 'SINGLE_CHOICE', '我对于人或物的兴趣都很容易改变');
insert into psychtestquestionoptions(id, question_id, description) values (61, 21, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (62, 21, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (63, 21, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (22, 1, 'SINGLE_CHOICE', '筹划事务时,我宁愿:');
insert into psychtestquestionoptions(id, question_id, description) values (64, 22, '和别人合作.');
insert into psychtestquestionoptions(id, question_id, description) values (65, 22, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (66, 22, '自己单独进行.');


insert into psychtestquestions(id, test_id, type, description) values (23, 1, 'SINGLE_CHOICE', '我常会无端地自言自语:');
insert into psychtestquestionoptions(id, question_id, description) values (67, 23, '常常如此.');
insert into psychtestquestionoptions(id, question_id, description) values (68, 23, '偶然如此.');
insert into psychtestquestionoptions(id, question_id, description) values (69, 23, '从不如此.');


insert into psychtestquestions(id, test_id, type, description) values (24, 1, 'SINGLE_CHOICE', '无论工作,饮食或出游,我总');
insert into psychtestquestionoptions(id, question_id, description) values (70, 24, '很匆忙,不能尽兴.');
insert into psychtestquestionoptions(id, question_id, description) values (71, 24, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (72, 24, '很从容不迫.');


insert into psychtestquestions(id, test_id, type, description) values (25, 1, 'SINGLE_CHOICE', '有时我会怀疑别人是否对我的言谈真正有兴趣');
insert into psychtestquestionoptions(id, question_id, description) values (73, 25, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (74, 25, '介乎A与C之间');
insert into psychtestquestionoptions(id, question_id, description) values (75, 25, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (26, 1, 'SINGLE_CHOICE', '在工厂中,我宁愿负责');
insert into psychtestquestionoptions(id, question_id, description) values (76, 26, '机械组.');
insert into psychtestquestionoptions(id, question_id, description) values (77, 26, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (78, 26, '人事组.');


insert into psychtestquestions(id, test_id, type, description) values (27, 1, 'SINGLE_CHOICE', '在阅读时,我宁愿选读');
insert into psychtestquestionoptions(id, question_id, description) values (79, 27, '太空旅行.');
insert into psychtestquestionoptions(id, question_id, description) values (80, 27, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (81, 27, '家庭教育.');


insert into psychtestquestions(id, test_id, type, description) values (28, 1, 'SINGLE_CHOICE', '下列三个字中哪个字与其它两个字属于不同类别');
insert into psychtestquestionoptions(id, question_id, description) values (82, 28, '狗.');
insert into psychtestquestionoptions(id, question_id, description) values (83, 28, '石.');
insert into psychtestquestionoptions(id, question_id, description) values (84, 28, '牛.');


insert into psychtestquestions(id, test_id, type, description) values (29, 1, 'SINGLE_CHOICE', '如果我能重新做人,我要');
insert into psychtestquestionoptions(id, question_id, description) values (85, 29, '把生活安排得和以前不同.');
insert into psychtestquestionoptions(id, question_id, description) values (86, 29, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (87, 29, '生活得和以前相仿.');


insert into psychtestquestions(id, test_id, type, description) values (30, 1, 'SINGLE_CHOICE', '在我的一生中,我总能达到我所预期的目标');
insert into psychtestquestionoptions(id, question_id, description) values (88, 30, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (89, 30, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (90, 30, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (31, 1, 'SINGLE_CHOICE', '当我说谎时,我总觉得内心不安,不敢正视对方');
insert into psychtestquestionoptions(id, question_id, description) values (91, 31, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (92, 31, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (93, 31, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (32, 1, 'SINGLE_CHOICE', '假使我手持一支装有子弹的手枪，我必须取出子弹后才能心安');
insert into psychtestquestionoptions(id, question_id, description) values (94, 32, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (95, 32, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (96, 32, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (33, 1, 'SINGLE_CHOICE', '朋友们大都认为我是一个说话有风趣的人');
insert into psychtestquestionoptions(id, question_id, description) values (97, 33, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (98, 33, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (99, 33, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (34, 1, 'SINGLE_CHOICE', '如果人们知道我的内心世界,他们都会感到惊讶');
insert into psychtestquestionoptions(id, question_id, description) values (100, 34, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (101, 34, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (102, 34, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (35, 1, 'SINGLE_CHOICE', '在社交场合中,如果我突然成为众所注意的中心,我会感到局促不安');
insert into psychtestquestionoptions(id, question_id, description) values (103, 35, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (104, 35, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (105, 35, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (36, 1, 'SINGLE_CHOICE', '我总喜欢参加规模庞大的聚会,舞会或公共集会');
insert into psychtestquestionoptions(id, question_id, description) values (106, 36, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (107, 36, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (108, 36, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (37, 1, 'SINGLE_CHOICE', '在下列工作中,我喜欢的是');
insert into psychtestquestionoptions(id, question_id, description) values (109, 37, '音乐.');
insert into psychtestquestionoptions(id, question_id, description) values (110, 37, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (111, 37, '手工.');


insert into psychtestquestions(id, test_id, type, description) values (38, 1, 'SINGLE_CHOICE', '我常常怀疑那些出乎意料的,对我过于友善的人的诚实动机');
insert into psychtestquestionoptions(id, question_id, description) values (112, 38, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (113, 38, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (114, 38, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (39, 1, 'SINGLE_CHOICE', '我宁愿自己的生活象');
insert into psychtestquestionoptions(id, question_id, description) values (115, 39, '一个艺人或博物学家.');
insert into psychtestquestionoptions(id, question_id, description) values (116, 39, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (117, 39, '会计师或保险公司的经纪人.');


insert into psychtestquestions(id, test_id, type, description) values (40, 1, 'SINGLE_CHOICE', '目前世界所需要的是');
insert into psychtestquestionoptions(id, question_id, description) values (118, 40, '多产生一些富有改善世界计划的理想家.');
insert into psychtestquestionoptions(id, question_id, description) values (119, 40, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (120, 40, '脚踏实地的可靠公民.');


insert into psychtestquestions(id, test_id, type, description) values (41, 1, 'SINGLE_CHOICE', '有时候我觉得我需要做剧烈的体力活动');
insert into psychtestquestionoptions(id, question_id, description) values (121, 41, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (122, 41, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (123, 41, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (42, 1, 'SINGLE_CHOICE', '我愿意与有礼貌有教养的人来往，而不愿和粗鲁野蛮的人为伍');
insert into psychtestquestionoptions(id, question_id, description) values (124, 42, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (125, 42, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (126, 42, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (43, 1, 'SINGLE_CHOICE', '在处理一些必须凭借智慧的事务中,我的父母的确');
insert into psychtestquestionoptions(id, question_id, description) values (127, 43, '较一般人差.');
insert into psychtestquestionoptions(id, question_id, description) values (128, 43, '普通.');
insert into psychtestquestionoptions(id, question_id, description) values (129, 43, '超人一等.');


insert into psychtestquestions(id, test_id, type, description) values (44, 1, 'SINGLE_CHOICE', '当上司(或教师)召见我时,我');
insert into psychtestquestionoptions(id, question_id, description) values (130, 44, '总觉得可以趁机会提出建议.');
insert into psychtestquestionoptions(id, question_id, description) values (131, 44, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (132, 44, '总怀疑自己做错了什么事.');


insert into psychtestquestions(id, test_id, type, description) values (45, 1, 'SINGLE_CHOICE', '假使薪俸优厚,我愿意专任照料精神病人的职务');
insert into psychtestquestionoptions(id, question_id, description) values (133, 45, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (134, 45, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (135, 45, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (46, 1, 'SINGLE_CHOICE', '看报时,我喜欢读');
insert into psychtestquestionoptions(id, question_id, description) values (136, 46, '当前世界基本社会问题的辩论.');
insert into psychtestquestionoptions(id, question_id, description) values (137, 46, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (138, 46, '地方新闻的报道.');


insert into psychtestquestions(id, test_id, type, description) values (47, 1, 'SINGLE_CHOICE', '我曾担任过');
insert into psychtestquestionoptions(id, question_id, description) values (139, 47, '一般职务.');
insert into psychtestquestionoptions(id, question_id, description) values (140, 47, '多种职务.');
insert into psychtestquestionoptions(id, question_id, description) values (141, 47, '非常多的职务.');


insert into psychtestquestions(id, test_id, type, description) values (48, 1, 'SINGLE_CHOICE', '逛街时,我宁愿观看一个画家写生,而不愿听人家的辩论');
insert into psychtestquestionoptions(id, question_id, description) values (142, 48, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (143, 48, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (144, 48, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (49, 1, 'SINGLE_CHOICE', '我的神经脆弱,稍有刺激的声音就会使我战栗');
insert into psychtestquestionoptions(id, question_id, description) values (145, 49, '时常如此.');
insert into psychtestquestionoptions(id, question_id, description) values (146, 49, '有时如此.');
insert into psychtestquestionoptions(id, question_id, description) values (147, 49, '从未如此.');


insert into psychtestquestions(id, test_id, type, description) values (50, 1, 'SINGLE_CHOICE', '我在清晨起身时,就常常感到疲乏不堪');
insert into psychtestquestionoptions(id, question_id, description) values (148, 50, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (149, 50, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (150, 50, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (51, 1, 'SINGLE_CHOICE', '我宁愿是一个');
insert into psychtestquestionoptions(id, question_id, description) values (151, 51, '管森林的工作人员.');
insert into psychtestquestionoptions(id, question_id, description) values (152, 51, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (153, 51, '中小学教员.');


insert into psychtestquestions(id, test_id, type, description) values (52, 1, 'SINGLE_CHOICE', '每逢年节或亲友生日,我');
insert into psychtestquestionoptions(id, question_id, description) values (154, 52, '喜欢互相赠送礼物.');
insert into psychtestquestionoptions(id, question_id, description) values (155, 52, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (156, 52, '觉得交换礼物是麻烦多事.');


insert into psychtestquestions(id, test_id, type, description) values (53, 1, 'SINGLE_CHOICE', '下列数字中,哪个数字与其他两个数字属于不同类别');
insert into psychtestquestionoptions(id, question_id, description) values (157, 53, '  5.');
insert into psychtestquestionoptions(id, question_id, description) values (158, 53, '  2.');
insert into psychtestquestionoptions(id, question_id, description) values (159, 53, '  7.');


insert into psychtestquestions(id, test_id, type, description) values (54, 1, 'SINGLE_CHOICE', '[猫]与[鱼]就如同[牛]与');
insert into psychtestquestionoptions(id, question_id, description) values (160, 54, '牛乳.');
insert into psychtestquestionoptions(id, question_id, description) values (161, 54, '牧草.');
insert into psychtestquestionoptions(id, question_id, description) values (162, 54, '盐.');


insert into psychtestquestions(id, test_id, type, description) values (55, 1, 'SINGLE_CHOICE', '在做人处事的各个方面,我的父母很值得敬佩');
insert into psychtestquestionoptions(id, question_id, description) values (163, 55, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (164, 55, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (165, 55, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (56, 1, 'SINGLE_CHOICE', '我觉得我有一些别人所不及的优良品质');
insert into psychtestquestionoptions(id, question_id, description) values (166, 56, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (167, 56, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (168, 56, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (57, 1, 'SINGLE_CHOICE', '只要有利于大家,尽管别人认为卑贱的工作,我也乐而为之,不以为耻');
insert into psychtestquestionoptions(id, question_id, description) values (169, 57, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (170, 57, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (171, 57, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (58, 1, 'SINGLE_CHOICE', '我喜欢看电影或参加其他娱乐活动');
insert into psychtestquestionoptions(id, question_id, description) values (172, 58, '每周一次以上(比一般人多).');
insert into psychtestquestionoptions(id, question_id, description) values (173, 58, '每周一次(与通常人相似).');
insert into psychtestquestionoptions(id, question_id, description) values (174, 58, '偶然一次(比通常人少).');


insert into psychtestquestions(id, test_id, type, description) values (59, 1, 'SINGLE_CHOICE', '我喜欢从事需要精确技术的工作');
insert into psychtestquestionoptions(id, question_id, description) values (175, 59, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (176, 59, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (177, 59, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (60, 1, 'SINGLE_CHOICE', '在有思想,有地位的长者面前,我总较为缄默');
insert into psychtestquestionoptions(id, question_id, description) values (178, 60, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (179, 60, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (180, 60, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (61, 1, 'SINGLE_CHOICE', '就我来说,在大众前演讲或表演是一件不容易的事');
insert into psychtestquestionoptions(id, question_id, description) values (181, 61, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (182, 61, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (183, 61, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (62, 1, 'SINGLE_CHOICE', '我宁愿');
insert into psychtestquestionoptions(id, question_id, description) values (184, 62, '指挥几个人工作.');
insert into psychtestquestionoptions(id, question_id, description) values (185, 62, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (186, 62, '和团体共同工作.');


insert into psychtestquestions(id, test_id, type, description) values (63, 1, 'SINGLE_CHOICE', '纵使我做了一桩贻笑大方的事，我也仍然能够将它淡然忘却');
insert into psychtestquestionoptions(id, question_id, description) values (187, 63, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (188, 63, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (189, 63, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (64, 1, 'SINGLE_CHOICE', '没有人会幸灾乐祸地希望我遭遇困难');
insert into psychtestquestionoptions(id, question_id, description) values (190, 64, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (191, 64, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (192, 64, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (65, 1, 'SINGLE_CHOICE', '堂堂男子汉应该');
insert into psychtestquestionoptions(id, question_id, description) values (193, 65, '考虑人生的意义.');
insert into psychtestquestionoptions(id, question_id, description) values (194, 65, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (195, 65, '谋家庭的温饱.');


insert into psychtestquestions(id, test_id, type, description) values (66, 1, 'SINGLE_CHOICE', '我喜欢解决别人已弄得一塌糊涂的问题');
insert into psychtestquestionoptions(id, question_id, description) values (196, 66, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (197, 66, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (198, 66, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (67, 1, 'SINGLE_CHOICE', '我十分高兴的时候总有[好景不长]之感');
insert into psychtestquestionoptions(id, question_id, description) values (199, 67, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (200, 67, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (201, 67, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (68, 1, 'SINGLE_CHOICE', '在一般困难处境下,我总能保持乐观');
insert into psychtestquestionoptions(id, question_id, description) values (202, 68, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (203, 68, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (204, 68, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (69, 1, 'SINGLE_CHOICE', '迁居是一桩极不愉快的事');
insert into psychtestquestionoptions(id, question_id, description) values (205, 69, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (206, 69, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (207, 69, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (70, 1, 'SINGLE_CHOICE', '在我年轻的时候,如果我和父母的意见不同,我经常');
insert into psychtestquestionoptions(id, question_id, description) values (208, 70, '坚持自己的意见.');
insert into psychtestquestionoptions(id, question_id, description) values (209, 70, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (210, 70, '接受他们的意见.');


insert into psychtestquestions(id, test_id, type, description) values (71, 1, 'SINGLE_CHOICE', '我希望我的爱人能够使家庭');
insert into psychtestquestionoptions(id, question_id, description) values (211, 71, '有其本身的欢乐与活动.');
insert into psychtestquestionoptions(id, question_id, description) values (212, 71, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (213, 71, '成为邻里社交活动的一部分.');


insert into psychtestquestions(id, test_id, type, description) values (72, 1, 'SINGLE_CHOICE', '我解决问题多数依靠');
insert into psychtestquestionoptions(id, question_id, description) values (214, 72, '个人独立思考.');
insert into psychtestquestionoptions(id, question_id, description) values (215, 72, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (216, 72, '与人互相讨论.');


insert into psychtestquestions(id, test_id, type, description) values (73, 1, 'SINGLE_CHOICE', '需要[当机立断]时,我总');
insert into psychtestquestionoptions(id, question_id, description) values (217, 73, '镇静地运用理智.');
insert into psychtestquestionoptions(id, question_id, description) values (218, 73, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (219, 73, '常常紧张兴奋,不能冷静思考.');


insert into psychtestquestions(id, test_id, type, description) values (74, 1, 'SINGLE_CHOICE', '最近,在一两桩事情上,我觉得自己是无辜受累');
insert into psychtestquestionoptions(id, question_id, description) values (220, 74, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (221, 74, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (222, 74, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (75, 1, 'SINGLE_CHOICE', '我善于控制我的表情');
insert into psychtestquestionoptions(id, question_id, description) values (223, 75, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (224, 75, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (225, 75, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (76, 1, 'SINGLE_CHOICE', '如果薪俸相等,我宁愿做');
insert into psychtestquestionoptions(id, question_id, description) values (226, 76, '一个化学研究师.');
insert into psychtestquestionoptions(id, question_id, description) values (227, 76, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (228, 76, '旅行社经理.');


insert into psychtestquestions(id, test_id, type, description) values (77, 1, 'SINGLE_CHOICE', '[惊讶]与[新奇]犹如[惧怕]与');
insert into psychtestquestionoptions(id, question_id, description) values (229, 77, '勇敢.');
insert into psychtestquestionoptions(id, question_id, description) values (230, 77, '焦虑.');
insert into psychtestquestionoptions(id, question_id, description) values (231, 77, '恐怖.');


insert into psychtestquestions(id, test_id, type, description) values (78, 1, 'SINGLE_CHOICE', '下列三个分数中,哪一个与其他两个属不同类别:');
insert into psychtestquestionoptions(id, question_id, description) values (232, 78, '  3/7.');
insert into psychtestquestionoptions(id, question_id, description) values (233, 78, '  3/9.');
insert into psychtestquestionoptions(id, question_id, description) values (234, 78, '  3/11.');


insert into psychtestquestions(id, test_id, type, description) values (79, 1, 'SINGLE_CHOICE', '不知什么缘故,有些人故意回避或冷淡我');
insert into psychtestquestionoptions(id, question_id, description) values (235, 79, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (236, 79, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (237, 79, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (80, 1, 'SINGLE_CHOICE', '我虽善意待人,却得不到好报');
insert into psychtestquestionoptions(id, question_id, description) values (238, 80, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (239, 80, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (240, 80, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (81, 1, 'SINGLE_CHOICE', '我不喜欢那些夜郎自大,目空一切的人');
insert into psychtestquestionoptions(id, question_id, description) values (241, 81, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (242, 81, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (243, 81, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (82, 1, 'SINGLE_CHOICE', '和一般人相比,我的朋友的确太少');
insert into psychtestquestionoptions(id, question_id, description) values (244, 82, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (245, 82, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (246, 82, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (83, 1, 'SINGLE_CHOICE', '出于万不得已时,我才参加社交集会,否则我总设法回避');
insert into psychtestquestionoptions(id, question_id, description) values (247, 83, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (248, 83, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (249, 83, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (84, 1, 'SINGLE_CHOICE', '在服务机关中,对上级的逢迎得当,比工作上的表现更为重要');
insert into psychtestquestionoptions(id, question_id, description) values (250, 84, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (251, 84, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (252, 84, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (85, 1, 'SINGLE_CHOICE', '参加竞赛时,我看重的是竞赛活动,而不计较其成败');
insert into psychtestquestionoptions(id, question_id, description) values (253, 85, '总是如此.');
insert into psychtestquestionoptions(id, question_id, description) values (254, 85, '一般如此.');
insert into psychtestquestionoptions(id, question_id, description) values (255, 85, '偶然如此.');


insert into psychtestquestions(id, test_id, type, description) values (86, 1, 'SINGLE_CHOICE', '我宁愿我所就的职业有');
insert into psychtestquestionoptions(id, question_id, description) values (256, 86, '固定可靠的薪水.');
insert into psychtestquestionoptions(id, question_id, description) values (257, 86, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (258, 86, '薪资高低能随我工作的表现而随时调整.');


insert into psychtestquestions(id, test_id, type, description) values (87, 1, 'SINGLE_CHOICE', '我宁愿阅读');
insert into psychtestquestionoptions(id, question_id, description) values (259, 87, '军事与政治的事实记载.');
insert into psychtestquestionoptions(id, question_id, description) values (260, 87, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (261, 87, '一部富有情感与幻想的作品.');


insert into psychtestquestions(id, test_id, type, description) values (88, 1, 'SINGLE_CHOICE', '有许多人不敢欺骗或犯罪,主要原因是怕受到惩罚');
insert into psychtestquestionoptions(id, question_id, description) values (262, 88, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (263, 88, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (264, 88, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (89, 1, 'SINGLE_CHOICE', '我的父母(或保护人)从未很严格地要我事事顺从');
insert into psychtestquestionoptions(id, question_id, description) values (265, 89, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (266, 89, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (267, 89, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (90, 1, 'SINGLE_CHOICE', '[百折不挠][再接再励]的精神似乎完全被现代人忽视了');
insert into psychtestquestionoptions(id, question_id, description) values (268, 90, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (269, 90, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (270, 90, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (91, 1, 'SINGLE_CHOICE', '如果有人对我发怒,我总:');
insert into psychtestquestionoptions(id, question_id, description) values (271, 91, '设法使他镇静下来.');
insert into psychtestquestionoptions(id, question_id, description) values (272, 91, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (273, 91, '也会恼怒起来.');


insert into psychtestquestions(id, test_id, type, description) values (92, 1, 'SINGLE_CHOICE', '我希望大家都提倡');
insert into psychtestquestionoptions(id, question_id, description) values (274, 92, '多吃水果以避免杀生.');
insert into psychtestquestionoptions(id, question_id, description) values (275, 92, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (276, 92, '发展农业捕灭对农产品有害的动物.');


insert into psychtestquestions(id, test_id, type, description) values (93, 1, 'SINGLE_CHOICE', '无论在极高的屋顶上或极深的隧道中，我很少觉得胆怯不安');
insert into psychtestquestionoptions(id, question_id, description) values (277, 93, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (278, 93, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (279, 93, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (94, 1, 'SINGLE_CHOICE', '我只要没有过错,不管人家怎样归咎于我,我总能心安理得');
insert into psychtestquestionoptions(id, question_id, description) values (280, 94, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (281, 94, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (282, 94, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (95, 1, 'SINGLE_CHOICE', '凡是无法运用理智来解决的问题，有时就不得不靠权力来处理');
insert into psychtestquestionoptions(id, question_id, description) values (283, 95, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (284, 95, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (285, 95, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (96, 1, 'SINGLE_CHOICE', '我十六、七岁时与异性朋友的交往');
insert into psychtestquestionoptions(id, question_id, description) values (286, 96, '极多.');
insert into psychtestquestionoptions(id, question_id, description) values (287, 96, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (288, 96, '不很多.');


insert into psychtestquestions(id, test_id, type, description) values (97, 1, 'SINGLE_CHOICE', '我在交际场或所参加的组织中是一个活跃分子');
insert into psychtestquestionoptions(id, question_id, description) values (289, 97, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (290, 97, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (291, 97, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (98, 1, 'SINGLE_CHOICE', '在人声噪杂中,我仍能不受妨碍,专心工作');
insert into psychtestquestionoptions(id, question_id, description) values (292, 98, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (293, 98, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (294, 98, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (99, 1, 'SINGLE_CHOICE', '在某环境下,我常因困惑引起幻想而将工作搁置下来');
insert into psychtestquestionoptions(id, question_id, description) values (295, 99, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (296, 99, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (297, 99, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (100, 1, 'SINGLE_CHOICE', '我很少用难堪的话去中伤别人的感情');
insert into psychtestquestionoptions(id, question_id, description) values (298, 100, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (299, 100, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (300, 100, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (101, 1, 'SINGLE_CHOICE', '我更愿意做一名');
insert into psychtestquestionoptions(id, question_id, description) values (301, 101, '商店经理.');
insert into psychtestquestionoptions(id, question_id, description) values (302, 101, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (303, 101, '建筑师.');


insert into psychtestquestions(id, test_id, type, description) values (102, 1, 'SINGLE_CHOICE', '[理不胜辞]的意思是');
insert into psychtestquestionoptions(id, question_id, description) values (304, 102, '理不如辞.');
insert into psychtestquestionoptions(id, question_id, description) values (305, 102, '理多而辞寡.');
insert into psychtestquestionoptions(id, question_id, description) values (306, 102, '辞藻丰富而理由不足.');


insert into psychtestquestions(id, test_id, type, description) values (103, 1, 'SINGLE_CHOICE', '[锄头]与[挖掘]犹如[刀子]与');
insert into psychtestquestionoptions(id, question_id, description) values (307, 103, '雕刻.');
insert into psychtestquestionoptions(id, question_id, description) values (308, 103, '切剖.');
insert into psychtestquestionoptions(id, question_id, description) values (309, 103, '铲除.');


insert into psychtestquestions(id, test_id, type, description) values (104, 1, 'SINGLE_CHOICE', '我常横过街道,以回避我不愿招乎的人');
insert into psychtestquestionoptions(id, question_id, description) values (310, 104, '很少如此.');
insert into psychtestquestionoptions(id, question_id, description) values (311, 104, '偶然如此.');
insert into psychtestquestionoptions(id, question_id, description) values (312, 104, '有时如此.');


insert into psychtestquestions(id, test_id, type, description) values (105, 1, 'SINGLE_CHOICE', '在我倾听音乐时,如果人家高谈阔论');
insert into psychtestquestionoptions(id, question_id, description) values (313, 105, '我仍然能够专心听,不受影响.');
insert into psychtestquestionoptions(id, question_id, description) values (314, 105, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (315, 105, '我会不能专心欣赏而感到恼恐.');


insert into psychtestquestions(id, test_id, type, description) values (106, 1, 'SINGLE_CHOICE', '在课堂上,如果我的意见与教师不同,我常');
insert into psychtestquestionoptions(id, question_id, description) values (316, 106, '保持缄默.');
insert into psychtestquestionoptions(id, question_id, description) values (317, 106, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (318, 106, '当场表明立场.');


insert into psychtestquestions(id, test_id, type, description) values (107, 1, 'SINGLE_CHOICE', '我和异性友伴交谈时, 竭力避免涉及有关 [性] 的话题');
insert into psychtestquestionoptions(id, question_id, description) values (319, 107, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (320, 107, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (321, 107, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (108, 1, 'SINGLE_CHOICE', '我待人接物的确不太成功');
insert into psychtestquestionoptions(id, question_id, description) values (322, 108, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (323, 108, '不尽然.');
insert into psychtestquestionoptions(id, question_id, description) values (324, 108, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (109, 1, 'SINGLE_CHOICE', '每当考虑困难问题时,我总是');
insert into psychtestquestionoptions(id, question_id, description) values (325, 109, '一切都未雨稠缪.');
insert into psychtestquestionoptions(id, question_id, description) values (326, 109, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (327, 109, '相信到时候会自然解决.');


insert into psychtestquestions(id, test_id, type, description) values (110, 1, 'SINGLE_CHOICE', '我所结交的朋友中,男女各占一半');
insert into psychtestquestionoptions(id, question_id, description) values (328, 110, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (329, 110, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (330, 110, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (111, 1, 'SINGLE_CHOICE', '我宁可');
insert into psychtestquestionoptions(id, question_id, description) values (331, 111, '结识很多的人.');
insert into psychtestquestionoptions(id, question_id, description) values (332, 111, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (333, 111, '维持几个深交的朋友.');


insert into psychtestquestions(id, test_id, type, description) values (112, 1, 'SINGLE_CHOICE', '我宁为哲学家,而不做机械工程师');
insert into psychtestquestionoptions(id, question_id, description) values (334, 112, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (335, 112, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (336, 112, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (113, 1, 'SINGLE_CHOICE', '如果我发现某人自私不义，我总不计一切指责他的弱点');
insert into psychtestquestionoptions(id, question_id, description) values (337, 113, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (338, 113, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (339, 113, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (114, 1, 'SINGLE_CHOICE', '我善用心机去影响同伴,使他们能协助实现我的目标');
insert into psychtestquestionoptions(id, question_id, description) values (340, 114, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (341, 114, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (342, 114, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (115, 1, 'SINGLE_CHOICE', '我喜欢做戏剧,音乐,歌剧等新闻采访工作');
insert into psychtestquestionoptions(id, question_id, description) values (343, 115, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (344, 115, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (345, 115, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (116, 1, 'SINGLE_CHOICE', '当人们颂扬我时,我总觉得不好意思');
insert into psychtestquestionoptions(id, question_id, description) values (346, 116, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (347, 116, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (348, 116, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (117, 1, 'SINGLE_CHOICE', '我以为现代最需要解决的问题是');
insert into psychtestquestionoptions(id, question_id, description) values (349, 117, '政治纠纷.');
insert into psychtestquestionoptions(id, question_id, description) values (350, 117, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (351, 117, '道德标准的有无.');


insert into psychtestquestions(id, test_id, type, description) values (118, 1, 'SINGLE_CHOICE', '我有时会无故地产生一种面临横祸的恐惧');
insert into psychtestquestionoptions(id, question_id, description) values (352, 118, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (353, 118, '有时如此.');
insert into psychtestquestionoptions(id, question_id, description) values (354, 118, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (119, 1, 'SINGLE_CHOICE', '我在童年时,害怕黑暗的次数');
insert into psychtestquestionoptions(id, question_id, description) values (355, 119, '极多.');
insert into psychtestquestionoptions(id, question_id, description) values (356, 119, '不太多.');
insert into psychtestquestionoptions(id, question_id, description) values (357, 119, '没有.');


insert into psychtestquestions(id, test_id, type, description) values (120, 1, 'SINGLE_CHOICE', '黄昏闲暇,我喜欢');
insert into psychtestquestionoptions(id, question_id, description) values (358, 120, '看一部历史探险影片.');
insert into psychtestquestionoptions(id, question_id, description) values (359, 120, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (360, 120, '念一本科学幻想小说.');


insert into psychtestquestions(id, test_id, type, description) values (121, 1, 'SINGLE_CHOICE', '当人们批评我古怪时,我觉得');
insert into psychtestquestionoptions(id, question_id, description) values (361, 121, '非常气恼.');
insert into psychtestquestionoptions(id, question_id, description) values (362, 121, '有些动气.');
insert into psychtestquestionoptions(id, question_id, description) values (363, 121, '无所谓.');


insert into psychtestquestions(id, test_id, type, description) values (122, 1, 'SINGLE_CHOICE', '在一个陌生的城市找住址时,我经常');
insert into psychtestquestionoptions(id, question_id, description) values (364, 122, '就人问路.');
insert into psychtestquestionoptions(id, question_id, description) values (365, 122, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (366, 122, '参考市区地图.');


insert into psychtestquestions(id, test_id, type, description) values (123, 1, 'SINGLE_CHOICE', '朋友们声明要在家休息时,我仍设法怂恿他们外出');
insert into psychtestquestionoptions(id, question_id, description) values (367, 123, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (368, 123, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (369, 123, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (124, 1, 'SINGLE_CHOICE', '在就寝时,我');
insert into psychtestquestionoptions(id, question_id, description) values (370, 124, '不易入睡.');
insert into psychtestquestionoptions(id, question_id, description) values (371, 124, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (372, 124, '极容易入睡.');


insert into psychtestquestions(id, test_id, type, description) values (125, 1, 'SINGLE_CHOICE', '有人烦扰我时,我');
insert into psychtestquestionoptions(id, question_id, description) values (373, 125, '能不露生色.');
insert into psychtestquestionoptions(id, question_id, description) values (374, 125, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (375, 125, '要说给别人听,以泄气愤.');


insert into psychtestquestions(id, test_id, type, description) values (126, 1, 'SINGLE_CHOICE', '如果薪俸相等,我宁愿做一个');
insert into psychtestquestionoptions(id, question_id, description) values (376, 126, '律师.');
insert into psychtestquestionoptions(id, question_id, description) values (377, 126, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (378, 126, '飞行员或航海员.');


insert into psychtestquestions(id, test_id, type, description) values (127, 1, 'SINGLE_CHOICE', '时间永恒是比喻');
insert into psychtestquestionoptions(id, question_id, description) values (379, 127, '时间过得很慢.');
insert into psychtestquestionoptions(id, question_id, description) values (380, 127, '忘了时间.');
insert into psychtestquestionoptions(id, question_id, description) values (381, 127, '光阴一去不复返.');


insert into psychtestquestions(id, test_id, type, description) values (128, 1, 'SINGLE_CHOICE', '下列三项记号中,哪一项应紧接:XOOOOXXOOOXXX');
insert into psychtestquestionoptions(id, question_id, description) values (382, 128, ' XOX0.');
insert into psychtestquestionoptions(id, question_id, description) values (383, 128, ' OOX.');
insert into psychtestquestionoptions(id, question_id, description) values (384, 128, ' OXX.');


insert into psychtestquestions(id, test_id, type, description) values (129, 1, 'SINGLE_CHOICE', '在陌生的地方,我仍能清楚地辩别东西南北的方向');
insert into psychtestquestionoptions(id, question_id, description) values (385, 129, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (386, 129, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (387, 129, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (130, 1, 'SINGLE_CHOICE', '我的确比一般人幸运,因为我能从事自己热爱的工作');
insert into psychtestquestionoptions(id, question_id, description) values (388, 130, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (389, 130, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (390, 130, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (131, 1, 'SINGLE_CHOICE', '如果我急于想借用别人的东西而物主恰又不在，我认为不告而取亦无大碍');
insert into psychtestquestionoptions(id, question_id, description) values (391, 131, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (392, 131, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (393, 131, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (132, 1, 'SINGLE_CHOICE', '我喜欢向友人追述一些已往有趣的社交经验');
insert into psychtestquestionoptions(id, question_id, description) values (394, 132, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (395, 132, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (396, 132, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (133, 1, 'SINGLE_CHOICE', '我更愿意做一名');
insert into psychtestquestionoptions(id, question_id, description) values (397, 133, '演员.');
insert into psychtestquestionoptions(id, question_id, description) values (398, 133, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (399, 133, '建筑师.');


insert into psychtestquestions(id, test_id, type, description) values (134, 1, 'SINGLE_CHOICE', '工作学习之余,我总要安排计划,不使时间浪费');
insert into psychtestquestionoptions(id, question_id, description) values (400, 134, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (401, 134, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (402, 134, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (135, 1, 'SINGLE_CHOICE', '与人交际时,我常会无端地产生一种自卑感:');
insert into psychtestquestionoptions(id, question_id, description) values (403, 135, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (404, 135, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (405, 135, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (136, 1, 'SINGLE_CHOICE', '主动与陌生人交谈:');
insert into psychtestquestionoptions(id, question_id, description) values (406, 136, '是一桩难事.');
insert into psychtestquestionoptions(id, question_id, description) values (407, 136, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (408, 136, '毫无困难.');


insert into psychtestquestions(id, test_id, type, description) values (137, 1, 'SINGLE_CHOICE', '我喜欢的音乐,多数是:');
insert into psychtestquestionoptions(id, question_id, description) values (409, 137, '轻快活泼.');
insert into psychtestquestionoptions(id, question_id, description) values (410, 137, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (411, 137, '富于情感.');


insert into psychtestquestions(id, test_id, type, description) values (138, 1, 'SINGLE_CHOICE', '我爱做[白日梦]即[完全沉浸于幻想之中]');
insert into psychtestquestionoptions(id, question_id, description) values (412, 138, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (413, 138, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (414, 138, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (139, 1, 'SINGLE_CHOICE', '未来二十年的世界局势定将好');
insert into psychtestquestionoptions(id, question_id, description) values (415, 139, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (416, 139, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (417, 139, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (140, 1, 'SINGLE_CHOICE', '童年时,我喜欢阅读');
insert into psychtestquestionoptions(id, question_id, description) values (418, 140, '战争故事.');
insert into psychtestquestionoptions(id, question_id, description) values (419, 140, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (420, 140, '神仙幻想故事.');


insert into psychtestquestions(id, test_id, type, description) values (141, 1, 'SINGLE_CHOICE', '我素来对机械、汽车、飞机等有兴趣');
insert into psychtestquestionoptions(id, question_id, description) values (421, 141, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (422, 141, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (423, 141, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (142, 1, 'SINGLE_CHOICE', '我愿意做一个缓刑释放罪犯的管理监视人');
insert into psychtestquestionoptions(id, question_id, description) values (424, 142, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (425, 142, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (426, 142, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (143, 1, 'SINGLE_CHOICE', '人们认为我只不过是一个能苦干,稍有成就的人而已');
insert into psychtestquestionoptions(id, question_id, description) values (427, 143, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (428, 143, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (429, 143, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (144, 1, 'SINGLE_CHOICE', '在逆境中,我总能保持精神振奋');
insert into psychtestquestionoptions(id, question_id, description) values (430, 144, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (431, 144, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (432, 144, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (145, 1, 'SINGLE_CHOICE', '我以为人工节育是解决世界经济与和平问题的要诀');
insert into psychtestquestionoptions(id, question_id, description) values (433, 145, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (434, 145, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (435, 145, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (146, 1, 'SINGLE_CHOICE', '在工作中我喜欢独自筹划，不愿受别人的干涉');
insert into psychtestquestionoptions(id, question_id, description) values (436, 146, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (437, 146, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (438, 146, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (147, 1, 'SINGLE_CHOICE', '我相信[上司不可能没有过错,但他仍有权做当权者]');
insert into psychtestquestionoptions(id, question_id, description) values (439, 147, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (440, 147, '不一定');
insert into psychtestquestionoptions(id, question_id, description) values (441, 147, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (148, 1, 'SINGLE_CHOICE', '我总设法使自己不粗心大意,忽略细节');
insert into psychtestquestionoptions(id, question_id, description) values (442, 148, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (443, 148, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (444, 148, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (149, 1, 'SINGLE_CHOICE', '与人争辩或险遭事故后，我常发抖，精疲力竭，不能安心工作');
insert into psychtestquestionoptions(id, question_id, description) values (445, 149, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (446, 149, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (447, 149, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (150, 1, 'SINGLE_CHOICE', '没有医生处方,我从不乱用药:');
insert into psychtestquestionoptions(id, question_id, description) values (448, 150, '是的');
insert into psychtestquestionoptions(id, question_id, description) values (449, 150, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (450, 150, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (151, 1, 'SINGLE_CHOICE', '为了培养个人的兴趣,我愿意参加');
insert into psychtestquestionoptions(id, question_id, description) values (451, 151, '摄影组.');
insert into psychtestquestionoptions(id, question_id, description) values (452, 151, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (453, 151, '辩论会.');


insert into psychtestquestions(id, test_id, type, description) values (152, 1, 'SINGLE_CHOICE', '星火,燎原对等于姑息');
insert into psychtestquestionoptions(id, question_id, description) values (454, 152, '同情.');
insert into psychtestquestionoptions(id, question_id, description) values (455, 152, '养奸.');
insert into psychtestquestionoptions(id, question_id, description) values (456, 152, '纵容.');


insert into psychtestquestions(id, test_id, type, description) values (153, 1, 'SINGLE_CHOICE', '[钟表]与[时间]犹如[载缝]与');
insert into psychtestquestionoptions(id, question_id, description) values (457, 153, '西装.');
insert into psychtestquestionoptions(id, question_id, description) values (458, 153, '剪刀.');
insert into psychtestquestionoptions(id, question_id, description) values (459, 153, '布料.');


insert into psychtestquestions(id, test_id, type, description) values (154, 1, 'SINGLE_CHOICE', '生动的梦境常常滋扰我的睡眠');
insert into psychtestquestionoptions(id, question_id, description) values (460, 154, '时常如此.');
insert into psychtestquestionoptions(id, question_id, description) values (461, 154, '偶然如此.');
insert into psychtestquestionoptions(id, question_id, description) values (462, 154, '从未如此.');


insert into psychtestquestions(id, test_id, type, description) values (155, 1, 'SINGLE_CHOICE', '我过去曾撕毁一些禁止人们自由的布告');
insert into psychtestquestionoptions(id, question_id, description) values (463, 155, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (464, 155, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (465, 155, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (156, 1, 'SINGLE_CHOICE', '在一个陌生的城市中,我会');
insert into psychtestquestionoptions(id, question_id, description) values (466, 156, '到处闲游.');
insert into psychtestquestionoptions(id, question_id, description) values (467, 156, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (468, 156, '避免去较不安全的地方.');


insert into psychtestquestions(id, test_id, type, description) values (157, 1, 'SINGLE_CHOICE', '我宁愿服饰素洁大方,而不愿争奇斗艳惹人注目');
insert into psychtestquestionoptions(id, question_id, description) values (469, 157, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (470, 157, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (471, 157, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (158, 1, 'SINGLE_CHOICE', '黄昏时,安静的娱乐远胜过热闹的宴会');
insert into psychtestquestionoptions(id, question_id, description) values (472, 158, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (473, 158, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (474, 158, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (159, 1, 'SINGLE_CHOICE', '我常常明知故犯,不愿意接受好心的建议');
insert into psychtestquestionoptions(id, question_id, description) values (475, 159, '偶然如此.');
insert into psychtestquestionoptions(id, question_id, description) values (476, 159, '罕有如此.');
insert into psychtestquestionoptions(id, question_id, description) values (477, 159, '从不如此.');


insert into psychtestquestions(id, test_id, type, description) values (160, 1, 'SINGLE_CHOICE', '我总把[是非][善恶]作为判断或取舍的原则');
insert into psychtestquestionoptions(id, question_id, description) values (478, 160, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (479, 160, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (480, 160, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (161, 1, 'SINGLE_CHOICE', '我工作时不喜欢有许多人在旁参观');
insert into psychtestquestionoptions(id, question_id, description) values (481, 161, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (482, 161, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (483, 161, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (162, 1, 'SINGLE_CHOICE', '故意去为难一般有教养的人, 如医生, 教师等人的尊严, 是一件有趣的事:');
insert into psychtestquestionoptions(id, question_id, description) values (484, 162, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (485, 162, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (486, 162, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (163, 1, 'SINGLE_CHOICE', '在各种课程中,我较喜欢:');
insert into psychtestquestionoptions(id, question_id, description) values (487, 163, '语文.');
insert into psychtestquestionoptions(id, question_id, description) values (488, 163, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (489, 163, '数学.');


insert into psychtestquestions(id, test_id, type, description) values (164, 1, 'SINGLE_CHOICE', '那些自以为是、道貌岸然的人最使我生气');
insert into psychtestquestionoptions(id, question_id, description) values (490, 164, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (491, 164, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (492, 164, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (165, 1, 'SINGLE_CHOICE', '与平常循规蹈矩的人交谈');
insert into psychtestquestionoptions(id, question_id, description) values (493, 165, '颇有兴趣.亦有所得.');
insert into psychtestquestionoptions(id, question_id, description) values (494, 165, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (495, 165, '他们思想的肤浅使我厌烦.');


insert into psychtestquestions(id, test_id, type, description) values (166, 1, 'SINGLE_CHOICE', '我喜欢');
insert into psychtestquestionoptions(id, question_id, description) values (496, 166, '有几个有时对我很苛求而富有感情的朋友.');
insert into psychtestquestionoptions(id, question_id, description) values (497, 166, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (498, 166, '不受别人的牵涉.');


insert into psychtestquestions(id, test_id, type, description) values (167, 1, 'SINGLE_CHOICE', '如果做民意投票时,我宁愿投票赞同');
insert into psychtestquestionoptions(id, question_id, description) values (499, 167, '切实根绝有生理缺陷者的生育.');
insert into psychtestquestionoptions(id, question_id, description) values (500, 167, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (501, 167, '对杀人犯判处死刑.');


insert into psychtestquestions(id, test_id, type, description) values (168, 1, 'SINGLE_CHOICE', '我有时会无端地感到沮丧痛苦');
insert into psychtestquestionoptions(id, question_id, description) values (502, 168, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (503, 168, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (504, 168, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (169, 1, 'SINGLE_CHOICE', '当我与立场相反的人辩论时,我主张');
insert into psychtestquestionoptions(id, question_id, description) values (505, 169, '尽量找出基本观点的差异.');
insert into psychtestquestionoptions(id, question_id, description) values (506, 169, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (507, 169, '彼此让步以解决矛盾.');


insert into psychtestquestions(id, test_id, type, description) values (170, 1, 'SINGLE_CHOICE', '我一向重感情而不重理智,因此我的观点常动摇不定');
insert into psychtestquestionoptions(id, question_id, description) values (508, 170, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (509, 170, '不敢如此.');
insert into psychtestquestionoptions(id, question_id, description) values (510, 170, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (171, 1, 'SINGLE_CHOICE', '我的学习效率多有赖于:');
insert into psychtestquestionoptions(id, question_id, description) values (511, 171, '阅读好书.');
insert into psychtestquestionoptions(id, question_id, description) values (512, 171, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (513, 171, '参加团体讨论.');


insert into psychtestquestions(id, test_id, type, description) values (172, 1, 'SINGLE_CHOICE', '我宁选一个薪俸高的工作,不在乎有无保障;而不愿任薪俸低的固定工作');
insert into psychtestquestionoptions(id, question_id, description) values (514, 172, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (515, 172, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (516, 172, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (173, 1, 'SINGLE_CHOICE', '在参加辩论以前,我总先把握住自己的立场');
insert into psychtestquestionoptions(id, question_id, description) values (517, 173, '经常如此.');
insert into psychtestquestionoptions(id, question_id, description) values (518, 173, '一般如此.');
insert into psychtestquestionoptions(id, question_id, description) values (519, 173, '必要时才如此.');


insert into psychtestquestions(id, test_id, type, description) values (174, 1, 'SINGLE_CHOICE', '我常被一些无所谓的琐事所烦扰:');
insert into psychtestquestionoptions(id, question_id, description) values (520, 174, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (521, 174, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (522, 174, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (175, 1, 'SINGLE_CHOICE', '我宁愿住在嘈杂的城市,而不愿住在安静的乡村');
insert into psychtestquestionoptions(id, question_id, description) values (523, 175, '是的..');
insert into psychtestquestionoptions(id, question_id, description) values (524, 175, '不太确定.');
insert into psychtestquestionoptions(id, question_id, description) values (525, 175, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (176, 1, 'SINGLE_CHOICE', '我宁愿');
insert into psychtestquestionoptions(id, question_id, description) values (526, 176, '负责领导儿童游戏.');
insert into psychtestquestionoptions(id, question_id, description) values (527, 176, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (528, 176, '协助钟表修理.');


insert into psychtestquestions(id, test_id, type, description) values (177, 1, 'SINGLE_CHOICE', '一人(  )事,众人受累.我对这句话的反应是');
insert into psychtestquestionoptions(id, question_id, description) values (529, 177, '愤.');
insert into psychtestquestionoptions(id, question_id, description) values (530, 177, '偾.');
insert into psychtestquestionoptions(id, question_id, description) values (531, 177, '喷');


insert into psychtestquestions(id, test_id, type, description) values (178, 1, 'SINGLE_CHOICE', '望子成龙的家长往往(  )苗助长');
insert into psychtestquestionoptions(id, question_id, description) values (532, 178, '揠.');
insert into psychtestquestionoptions(id, question_id, description) values (533, 178, '堰.');
insert into psychtestquestionoptions(id, question_id, description) values (534, 178, '偃.');


insert into psychtestquestions(id, test_id, type, description) values (179, 1, 'SINGLE_CHOICE', '气侯的转变并不影响我的情绪:');
insert into psychtestquestionoptions(id, question_id, description) values (535, 179, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (536, 179, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (537, 179, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (180, 1, 'SINGLE_CHOICE', '因为我对于一切问题都有些见解，大家都公认我富于思想:');
insert into psychtestquestionoptions(id, question_id, description) values (538, 180, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (539, 180, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (540, 180, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (181, 1, 'SINGLE_CHOICE', '我讲话的声音:');
insert into psychtestquestionoptions(id, question_id, description) values (541, 181, '宏亮.');
insert into psychtestquestionoptions(id, question_id, description) values (542, 181, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (543, 181, '低沉.');


insert into psychtestquestions(id, test_id, type, description) values (182, 1, 'SINGLE_CHOICE', '人们公认我是一个活跃热情的人');
insert into psychtestquestionoptions(id, question_id, description) values (544, 182, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (545, 182, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (546, 182, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (183, 1, 'SINGLE_CHOICE', '我喜欢有旅行和变动机会的工作，而不计较工作本身之是否有保障');
insert into psychtestquestionoptions(id, question_id, description) values (547, 183, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (548, 183, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (549, 183, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (184, 1, 'SINGLE_CHOICE', '我治事严格,凡事都务求正确尽善尽美');
insert into psychtestquestionoptions(id, question_id, description) values (550, 184, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (551, 184, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (552, 184, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (185, 1, 'SINGLE_CHOICE', '在取回或归还东西时，我总仔细检查是否东西还保持原状');
insert into psychtestquestionoptions(id, question_id, description) values (553, 185, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (554, 185, '介乎A与C之间.');
insert into psychtestquestionoptions(id, question_id, description) values (555, 185, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (186, 1, 'SINGLE_CHOICE', '我通常精力充沛,忙碌多事');
insert into psychtestquestionoptions(id, question_id, description) values (556, 186, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (557, 186, '不一定.');
insert into psychtestquestionoptions(id, question_id, description) values (558, 186, '不是的.');


insert into psychtestquestions(id, test_id, type, description) values (187, 1, 'SINGLE_CHOICE', '我确信我没有遗漏或不经心回答上面任何问题');
insert into psychtestquestionoptions(id, question_id, description) values (559, 187, '是的.');
insert into psychtestquestionoptions(id, question_id, description) values (560, 187, '不确定.');
insert into psychtestquestionoptions(id, question_id, description) values (561, 187, '不是的.');






-- SCL—90  自 评 表
-- 以下表格中列出了有些人可能会有的问题，请仔细地阅读每一条，然后根据最近一星期以内下述情况影响您的实际感觉，在5个方格中选择一个，
-- 1没有——指您在最近一周内无此症状；
-- 2很轻——指最近一周有1~2天有此症状；
-- 3中等——指最近一周有3~4天有此症状；
-- 4偏重——指在最近一周有5~6天有此症状；
-- 5严重——指最近一周7天都出现此症状。请在符合的选项框中划一个“√”。
-- 答案无对错之分，请不要有顾虑，回答时请注意：回答每一道题都要根据自己的实际情况；
-- 回答时不必费时去考虑，看懂后就回答。

insert into psychtestquestions(id, test_id, type, description) values(188, 2, 'SINGLE_CHOICE', '头痛');
insert into psychtestquestionoptions(id, question_id, description) values(562, 188, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(563, 188, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(564, 188, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(565, 188, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(566, 188, '严重');


insert into psychtestquestions(id, test_id, type, description) values(189, 2, 'SINGLE_CHOICE', '神经过敏，心中不踏实');
insert into psychtestquestionoptions(id, question_id, description) values(567, 189, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(568, 189, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(569, 189, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(570, 189, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(571, 189, '严重');


insert into psychtestquestions(id, test_id, type, description) values(190, 2, 'SINGLE_CHOICE', '头脑中有不必要的想法或字句盘旋');
insert into psychtestquestionoptions(id, question_id, description) values(572, 190, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(573, 190, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(574, 190, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(575, 190, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(576, 190, '严重');


insert into psychtestquestions(id, test_id, type, description) values(191, 2, 'SINGLE_CHOICE', '头昏或昏倒');
insert into psychtestquestionoptions(id, question_id, description) values(577, 191, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(578, 191, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(579, 191, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(580, 191, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(581, 191, '严重');


insert into psychtestquestions(id, test_id, type, description) values(192, 2, 'SINGLE_CHOICE', '对偶异性的兴趣减退');
insert into psychtestquestionoptions(id, question_id, description) values(582, 192, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(583, 192, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(584, 192, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(585, 192, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(586, 192, '严重');


insert into psychtestquestions(id, test_id, type, description) values(193, 2, 'SINGLE_CHOICE', '对旁人责备求全');
insert into psychtestquestionoptions(id, question_id, description) values(587, 193, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(588, 193, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(589, 193, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(590, 193, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(591, 193, '严重');


insert into psychtestquestions(id, test_id, type, description) values(194, 2, 'SINGLE_CHOICE', '感到别人能控制您的思想');
insert into psychtestquestionoptions(id, question_id, description) values(592, 194, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(593, 194, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(594, 194, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(595, 194, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(596, 194, '严重');


insert into psychtestquestions(id, test_id, type, description) values(195, 2, 'SINGLE_CHOICE', '责怪别人制造麻烦');
insert into psychtestquestionoptions(id, question_id, description) values(597, 195, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(598, 195, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(599, 195, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(600, 195, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(601, 195, '严重');


insert into psychtestquestions(id, test_id, type, description) values(196, 2, 'SINGLE_CHOICE', '忘记性大');
insert into psychtestquestionoptions(id, question_id, description) values(602, 196, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(603, 196, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(604, 196, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(605, 196, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(606, 196, '严重');


insert into psychtestquestions(id, test_id, type, description) values(197, 2, 'SINGLE_CHOICE', '担心自己的衣饰整齐及仪态的端庄');
insert into psychtestquestionoptions(id, question_id, description) values(607, 197, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(608, 197, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(609, 197, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(610, 197, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(611, 197, '严重');


insert into psychtestquestions(id, test_id, type, description) values(198, 2, 'SINGLE_CHOICE', '容易烦恼和激动');
insert into psychtestquestionoptions(id, question_id, description) values(612, 198, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(613, 198, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(614, 198, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(615, 198, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(616, 198, '严重');


insert into psychtestquestions(id, test_id, type, description) values(199, 2, 'SINGLE_CHOICE', '胸痛');
insert into psychtestquestionoptions(id, question_id, description) values(617, 199, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(618, 199, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(619, 199, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(620, 199, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(621, 199, '严重');


insert into psychtestquestions(id, test_id, type, description) values(200, 2, 'SINGLE_CHOICE', '害怕空旷的场所或街道');
insert into psychtestquestionoptions(id, question_id, description) values(622, 200, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(623, 200, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(624, 200, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(625, 200, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(626, 200, '严重');


insert into psychtestquestions(id, test_id, type, description) values(201, 2, 'SINGLE_CHOICE', '感到自己的精力下降，活动减慢');
insert into psychtestquestionoptions(id, question_id, description) values(627, 201, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(628, 201, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(629, 201, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(630, 201, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(631, 201, '严重');


insert into psychtestquestions(id, test_id, type, description) values(202, 2, 'SINGLE_CHOICE', '想结束自己的生命');
insert into psychtestquestionoptions(id, question_id, description) values(632, 202, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(633, 202, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(634, 202, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(635, 202, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(636, 202, '严重');


insert into psychtestquestions(id, test_id, type, description) values(203, 2, 'SINGLE_CHOICE', '听到旁人听不到的声音');
insert into psychtestquestionoptions(id, question_id, description) values(637, 203, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(638, 203, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(639, 203, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(640, 203, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(641, 203, '严重');


insert into psychtestquestions(id, test_id, type, description) values(204, 2, 'SINGLE_CHOICE', '发抖');
insert into psychtestquestionoptions(id, question_id, description) values(642, 204, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(643, 204, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(644, 204, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(645, 204, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(646, 204, '严重');


insert into psychtestquestions(id, test_id, type, description) values(205, 2, 'SINGLE_CHOICE', '感到大多数人都不可信任');
insert into psychtestquestionoptions(id, question_id, description) values(647, 205, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(648, 205, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(649, 205, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(650, 205, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(651, 205, '严重');


insert into psychtestquestions(id, test_id, type, description) values(206, 2, 'SINGLE_CHOICE', '胃口不好');
insert into psychtestquestionoptions(id, question_id, description) values(652, 206, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(653, 206, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(654, 206, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(655, 206, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(656, 206, '严重');


insert into psychtestquestions(id, test_id, type, description) values(207, 2, 'SINGLE_CHOICE', '容易哭泣');
insert into psychtestquestionoptions(id, question_id, description) values(657, 207, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(658, 207, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(659, 207, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(660, 207, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(661, 207, '严重');


insert into psychtestquestions(id, test_id, type, description) values(208, 2, 'SINGLE_CHOICE', '同异性相处时感害羞不自在');
insert into psychtestquestionoptions(id, question_id, description) values(662, 208, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(663, 208, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(664, 208, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(665, 208, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(666, 208, '严重');


insert into psychtestquestions(id, test_id, type, description) values(209, 2, 'SINGLE_CHOICE', '感到受骗、中了圈套或有人想抓住您');
insert into psychtestquestionoptions(id, question_id, description) values(667, 209, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(668, 209, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(669, 209, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(670, 209, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(671, 209, '严重');


insert into psychtestquestions(id, test_id, type, description) values(210, 2, 'SINGLE_CHOICE', '无缘无故地感到害怕');
insert into psychtestquestionoptions(id, question_id, description) values(672, 210, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(673, 210, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(674, 210, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(675, 210, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(676, 210, '严重');


insert into psychtestquestions(id, test_id, type, description) values(211, 2, 'SINGLE_CHOICE', '自己不能控制地大发脾气');
insert into psychtestquestionoptions(id, question_id, description) values(677, 211, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(678, 211, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(679, 211, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(680, 211, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(681, 211, '严重');


insert into psychtestquestions(id, test_id, type, description) values(212, 2, 'SINGLE_CHOICE', '怕单独出门');
insert into psychtestquestionoptions(id, question_id, description) values(682, 212, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(683, 212, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(684, 212, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(685, 212, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(686, 212, '严重');


insert into psychtestquestions(id, test_id, type, description) values(213, 2, 'SINGLE_CHOICE', '经常责怪自己');
insert into psychtestquestionoptions(id, question_id, description) values(687, 213, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(688, 213, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(689, 213, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(690, 213, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(691, 213, '严重');


insert into psychtestquestions(id, test_id, type, description) values(214, 2, 'SINGLE_CHOICE', '腰痛');
insert into psychtestquestionoptions(id, question_id, description) values(692, 214, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(693, 214, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(694, 214, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(695, 214, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(696, 214, '严重');


insert into psychtestquestions(id, test_id, type, description) values(215, 2, 'SINGLE_CHOICE', '感到难以完成任务');
insert into psychtestquestionoptions(id, question_id, description) values(697, 215, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(698, 215, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(699, 215, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(700, 215, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(701, 215, '严重');


insert into psychtestquestions(id, test_id, type, description) values(216, 2, 'SINGLE_CHOICE', '感到孤独');
insert into psychtestquestionoptions(id, question_id, description) values(702, 216, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(703, 216, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(704, 216, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(705, 216, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(706, 216, '严重');


insert into psychtestquestions(id, test_id, type, description) values(217, 2, 'SINGLE_CHOICE', '感到苦闷');
insert into psychtestquestionoptions(id, question_id, description) values(707, 217, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(708, 217, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(709, 217, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(710, 217, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(711, 217, '严重');


insert into psychtestquestions(id, test_id, type, description) values(218, 2, 'SINGLE_CHOICE', '过分担忧');
insert into psychtestquestionoptions(id, question_id, description) values(712, 218, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(713, 218, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(714, 218, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(715, 218, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(716, 218, '严重');


insert into psychtestquestions(id, test_id, type, description) values(219, 2, 'SINGLE_CHOICE', '对事物不感兴趣');
insert into psychtestquestionoptions(id, question_id, description) values(717, 219, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(718, 219, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(719, 219, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(720, 219, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(721, 219, '严重');


insert into psychtestquestions(id, test_id, type, description) values(220, 2, 'SINGLE_CHOICE', '感到害怕');
insert into psychtestquestionoptions(id, question_id, description) values(722, 220, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(723, 220, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(724, 220, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(725, 220, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(726, 220, '严重');


insert into psychtestquestions(id, test_id, type, description) values(221, 2, 'SINGLE_CHOICE', '您的感情容易受到伤害');
insert into psychtestquestionoptions(id, question_id, description) values(727, 221, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(728, 221, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(729, 221, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(730, 221, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(731, 221, '严重');


insert into psychtestquestions(id, test_id, type, description) values(222, 2, 'SINGLE_CHOICE', '旁人能知道您的私下想法');
insert into psychtestquestionoptions(id, question_id, description) values(732, 222, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(733, 222, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(734, 222, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(735, 222, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(736, 222, '严重');


insert into psychtestquestions(id, test_id, type, description) values(223, 2, 'SINGLE_CHOICE', '感到别人不理解您不同情您');
insert into psychtestquestionoptions(id, question_id, description) values(737, 223, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(738, 223, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(739, 223, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(740, 223, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(741, 223, '严重');


insert into psychtestquestions(id, test_id, type, description) values(224, 2, 'SINGLE_CHOICE', '感到人们对您不友好，不喜欢您');
insert into psychtestquestionoptions(id, question_id, description) values(742, 224, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(743, 224, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(744, 224, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(745, 224, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(746, 224, '严重');


insert into psychtestquestions(id, test_id, type, description) values(225, 2, 'SINGLE_CHOICE', '做事必须做得很慢以保证做得正确');
insert into psychtestquestionoptions(id, question_id, description) values(747, 225, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(748, 225, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(749, 225, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(750, 225, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(751, 225, '严重');


insert into psychtestquestions(id, test_id, type, description) values(226, 2, 'SINGLE_CHOICE', '心跳得很厉害');
insert into psychtestquestionoptions(id, question_id, description) values(752, 226, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(753, 226, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(754, 226, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(755, 226, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(756, 226, '严重');


insert into psychtestquestions(id, test_id, type, description) values(227, 2, 'SINGLE_CHOICE', '恶心或胃部不舒服');
insert into psychtestquestionoptions(id, question_id, description) values(757, 227, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(758, 227, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(759, 227, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(760, 227, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(761, 227, '严重');


insert into psychtestquestions(id, test_id, type, description) values(228, 2, 'SINGLE_CHOICE', '感到比不上他人');
insert into psychtestquestionoptions(id, question_id, description) values(762, 228, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(763, 228, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(764, 228, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(765, 228, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(766, 228, '严重');


insert into psychtestquestions(id, test_id, type, description) values(229, 2, 'SINGLE_CHOICE', '肌肉酸痛');
insert into psychtestquestionoptions(id, question_id, description) values(767, 229, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(768, 229, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(769, 229, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(770, 229, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(771, 229, '严重');


insert into psychtestquestions(id, test_id, type, description) values(230, 2, 'SINGLE_CHOICE', '感到有人在监视您或谈论');
insert into psychtestquestionoptions(id, question_id, description) values(772, 230, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(773, 230, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(774, 230, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(775, 230, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(776, 230, '严重');


insert into psychtestquestions(id, test_id, type, description) values(231, 2, 'SINGLE_CHOICE', '难以入睡');
insert into psychtestquestionoptions(id, question_id, description) values(777, 231, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(778, 231, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(779, 231, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(780, 231, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(781, 231, '严重');


insert into psychtestquestions(id, test_id, type, description) values(232, 2, 'SINGLE_CHOICE', '做事必须反复检查');
insert into psychtestquestionoptions(id, question_id, description) values(782, 232, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(783, 232, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(784, 232, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(785, 232, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(786, 232, '严重');


insert into psychtestquestions(id, test_id, type, description) values(233, 2, 'SINGLE_CHOICE', '难以做出决定');
insert into psychtestquestionoptions(id, question_id, description) values(787, 233, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(788, 233, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(789, 233, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(790, 233, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(791, 233, '严重');


insert into psychtestquestions(id, test_id, type, description) values(234, 2, 'SINGLE_CHOICE', '怕乘电车、公共汽车、地铁或火车');
insert into psychtestquestionoptions(id, question_id, description) values(792, 234, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(793, 234, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(794, 234, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(795, 234, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(796, 234, '严重');


insert into psychtestquestions(id, test_id, type, description) values(235, 2, 'SINGLE_CHOICE', '呼吸有困难');
insert into psychtestquestionoptions(id, question_id, description) values(797, 235, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(798, 235, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(799, 235, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(800, 235, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(801, 235, '严重');


insert into psychtestquestions(id, test_id, type, description) values(236, 2, 'SINGLE_CHOICE', '一阵阵发冷或发热');
insert into psychtestquestionoptions(id, question_id, description) values(802, 236, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(803, 236, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(804, 236, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(805, 236, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(806, 236, '严重');


insert into psychtestquestions(id, test_id, type, description) values(237, 2, 'SINGLE_CHOICE', '因为感到害怕而避开某些东西、场合或活动');
insert into psychtestquestionoptions(id, question_id, description) values(807, 237, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(808, 237, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(809, 237, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(810, 237, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(811, 237, '严重');


insert into psychtestquestions(id, test_id, type, description) values(238, 2, 'SINGLE_CHOICE', '脑子变空了');
insert into psychtestquestionoptions(id, question_id, description) values(812, 238, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(813, 238, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(814, 238, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(815, 238, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(816, 238, '严重');


insert into psychtestquestions(id, test_id, type, description) values(239, 2, 'SINGLE_CHOICE', '身体发麻或刺痛');
insert into psychtestquestionoptions(id, question_id, description) values(817, 239, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(818, 239, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(819, 239, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(820, 239, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(821, 239, '严重');


insert into psychtestquestions(id, test_id, type, description) values(240, 2, 'SINGLE_CHOICE', '喉咙有梗塞感');
insert into psychtestquestionoptions(id, question_id, description) values(822, 240, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(823, 240, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(824, 240, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(825, 240, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(826, 240, '严重');


insert into psychtestquestions(id, test_id, type, description) values(241, 2, 'SINGLE_CHOICE', '感到前途没有希望');
insert into psychtestquestionoptions(id, question_id, description) values(827, 241, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(828, 241, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(829, 241, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(830, 241, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(831, 241, '严重');


insert into psychtestquestions(id, test_id, type, description) values(242, 2, 'SINGLE_CHOICE', '不能集中注意');
insert into psychtestquestionoptions(id, question_id, description) values(832, 242, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(833, 242, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(834, 242, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(835, 242, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(836, 242, '严重');


insert into psychtestquestions(id, test_id, type, description) values(243, 2, 'SINGLE_CHOICE', '感到身体的某一部分软弱无力');
insert into psychtestquestionoptions(id, question_id, description) values(837, 243, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(838, 243, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(839, 243, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(840, 243, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(841, 243, '严重');


insert into psychtestquestions(id, test_id, type, description) values(244, 2, 'SINGLE_CHOICE', '感到紧张或容易紧张');
insert into psychtestquestionoptions(id, question_id, description) values(842, 244, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(843, 244, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(844, 244, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(845, 244, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(846, 244, '严重');


insert into psychtestquestions(id, test_id, type, description) values(245, 2, 'SINGLE_CHOICE', '感到手或脚发重');
insert into psychtestquestionoptions(id, question_id, description) values(847, 245, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(848, 245, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(849, 245, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(850, 245, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(851, 245, '严重');


insert into psychtestquestions(id, test_id, type, description) values(246, 2, 'SINGLE_CHOICE', '想到死亡的事');
insert into psychtestquestionoptions(id, question_id, description) values(852, 246, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(853, 246, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(854, 246, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(855, 246, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(856, 246, '严重');


insert into psychtestquestions(id, test_id, type, description) values(247, 2, 'SINGLE_CHOICE', '吃的太多');
insert into psychtestquestionoptions(id, question_id, description) values(857, 247, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(858, 247, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(859, 247, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(860, 247, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(861, 247, '严重');


insert into psychtestquestions(id, test_id, type, description) values(248, 2, 'SINGLE_CHOICE', '当别人看者你或谈论您时感到不自在');
insert into psychtestquestionoptions(id, question_id, description) values(862, 248, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(863, 248, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(864, 248, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(865, 248, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(866, 248, '严重');


insert into psychtestquestions(id, test_id, type, description) values(249, 2, 'SINGLE_CHOICE', '有一些不属于您自己的想法');
insert into psychtestquestionoptions(id, question_id, description) values(867, 249, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(868, 249, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(869, 249, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(870, 249, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(871, 249, '严重');


insert into psychtestquestions(id, test_id, type, description) values(250, 2, 'SINGLE_CHOICE', '有想打人或伤害他人的冲动');
insert into psychtestquestionoptions(id, question_id, description) values(872, 250, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(873, 250, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(874, 250, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(875, 250, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(876, 250, '严重');


insert into psychtestquestions(id, test_id, type, description) values(251, 2, 'SINGLE_CHOICE', '醒得太早');
insert into psychtestquestionoptions(id, question_id, description) values(877, 251, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(878, 251, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(879, 251, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(880, 251, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(881, 251, '严重');


insert into psychtestquestions(id, test_id, type, description) values(252, 2, 'SINGLE_CHOICE', '必须反复洗手、点数目或触摸某些东西');
insert into psychtestquestionoptions(id, question_id, description) values(882, 252, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(883, 252, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(884, 252, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(885, 252, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(886, 252, '严重');


insert into psychtestquestions(id, test_id, type, description) values(253, 2, 'SINGLE_CHOICE', '睡得不稳不深');
insert into psychtestquestionoptions(id, question_id, description) values(887, 253, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(888, 253, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(889, 253, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(890, 253, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(891, 253, '严重');


insert into psychtestquestions(id, test_id, type, description) values(254, 2, 'SINGLE_CHOICE', '有想摔东西或破坏东西的冲动');
insert into psychtestquestionoptions(id, question_id, description) values(892, 254, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(893, 254, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(894, 254, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(895, 254, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(896, 254, '严重');


insert into psychtestquestions(id, test_id, type, description) values(255, 2, 'SINGLE_CHOICE', '有一些别人没有的想法或念头');
insert into psychtestquestionoptions(id, question_id, description) values(897, 255, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(898, 255, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(899, 255, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(900, 255, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(901, 255, '严重');


insert into psychtestquestions(id, test_id, type, description) values(256, 2, 'SINGLE_CHOICE', '感到对别人神经过敏');
insert into psychtestquestionoptions(id, question_id, description) values(902, 256, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(903, 256, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(904, 256, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(905, 256, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(906, 256, '严重');


insert into psychtestquestions(id, test_id, type, description) values(257, 2, 'SINGLE_CHOICE', '在商店或电影院等人多的地方感到不自在');
insert into psychtestquestionoptions(id, question_id, description) values(907, 257, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(908, 257, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(909, 257, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(910, 257, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(911, 257, '严重');


insert into psychtestquestions(id, test_id, type, description) values(258, 2, 'SINGLE_CHOICE', '感到任何事情都很困难');
insert into psychtestquestionoptions(id, question_id, description) values(912, 258, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(913, 258, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(914, 258, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(915, 258, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(916, 258, '严重');


insert into psychtestquestions(id, test_id, type, description) values(259, 2, 'SINGLE_CHOICE', '一阵阵恐惧或惊恐');
insert into psychtestquestionoptions(id, question_id, description) values(917, 259, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(918, 259, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(919, 259, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(920, 259, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(921, 259, '严重');


insert into psychtestquestions(id, test_id, type, description) values(260, 2, 'SINGLE_CHOICE', '感到在公共场合吃东西很不舒服');
insert into psychtestquestionoptions(id, question_id, description) values(922, 260, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(923, 260, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(924, 260, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(925, 260, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(926, 260, '严重');


insert into psychtestquestions(id, test_id, type, description) values(261, 2, 'SINGLE_CHOICE', '经常与人争论');
insert into psychtestquestionoptions(id, question_id, description) values(927, 261, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(928, 261, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(929, 261, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(930, 261, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(931, 261, '严重');


insert into psychtestquestions(id, test_id, type, description) values(262, 2, 'SINGLE_CHOICE', '单独一人时神经紧张');
insert into psychtestquestionoptions(id, question_id, description) values(932, 262, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(933, 262, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(934, 262, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(935, 262, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(936, 262, '严重');


insert into psychtestquestions(id, test_id, type, description) values(263, 2, 'SINGLE_CHOICE', '别人对您的成绩没有作出恰当的评价');
insert into psychtestquestionoptions(id, question_id, description) values(937, 263, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(938, 263, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(939, 263, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(940, 263, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(941, 263, '严重');


insert into psychtestquestions(id, test_id, type, description) values(264, 2, 'SINGLE_CHOICE', '即使和别人在一起也感到孤单');
insert into psychtestquestionoptions(id, question_id, description) values(942, 264, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(943, 264, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(944, 264, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(945, 264, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(946, 264, '严重');


insert into psychtestquestions(id, test_id, type, description) values(265, 2, 'SINGLE_CHOICE', '感到坐立不安心神不定');
insert into psychtestquestionoptions(id, question_id, description) values(947, 265, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(948, 265, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(949, 265, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(950, 265, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(951, 265, '严重');


insert into psychtestquestions(id, test_id, type, description) values(266, 2, 'SINGLE_CHOICE', '感到自己没有什么价值');
insert into psychtestquestionoptions(id, question_id, description) values(952, 266, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(953, 266, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(954, 266, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(955, 266, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(956, 266, '严重');


insert into psychtestquestions(id, test_id, type, description) values(267, 2, 'SINGLE_CHOICE', '感到熟悉的东西变得陌生或不象是真的');
insert into psychtestquestionoptions(id, question_id, description) values(957, 267, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(958, 267, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(959, 267, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(960, 267, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(961, 267, '严重');


insert into psychtestquestions(id, test_id, type, description) values(268, 2, 'SINGLE_CHOICE', '大叫或摔东西');
insert into psychtestquestionoptions(id, question_id, description) values(962, 268, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(963, 268, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(964, 268, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(965, 268, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(966, 268, '严重');


insert into psychtestquestions(id, test_id, type, description) values(269, 2, 'SINGLE_CHOICE', '害怕会在公共场合昏倒');
insert into psychtestquestionoptions(id, question_id, description) values(967, 269, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(968, 269, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(969, 269, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(970, 269, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(971, 269, '严重');


insert into psychtestquestions(id, test_id, type, description) values(270, 2, 'SINGLE_CHOICE', '感到别人想占您的便宜');
insert into psychtestquestionoptions(id, question_id, description) values(972, 270, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(973, 270, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(974, 270, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(975, 270, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(976, 270, '严重');


insert into psychtestquestions(id, test_id, type, description) values(271, 2, 'SINGLE_CHOICE', '为一些有关“性”的想法而很苦恼');
insert into psychtestquestionoptions(id, question_id, description) values(977, 271, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(978, 271, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(979, 271, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(980, 271, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(981, 271, '严重');


insert into psychtestquestions(id, test_id, type, description) values(272, 2, 'SINGLE_CHOICE', '您认为应该因为自己的过错而受到惩罚');
insert into psychtestquestionoptions(id, question_id, description) values(982, 272, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(983, 272, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(984, 272, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(985, 272, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(986, 272, '严重');


insert into psychtestquestions(id, test_id, type, description) values(273, 2, 'SINGLE_CHOICE', '感到要赶快把事情做完');
insert into psychtestquestionoptions(id, question_id, description) values(987, 273, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(988, 273, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(989, 273, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(990, 273, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(991, 273, '严重');


insert into psychtestquestions(id, test_id, type, description) values(274, 2, 'SINGLE_CHOICE', '感到自己的身体有严重问题');
insert into psychtestquestionoptions(id, question_id, description) values(992, 274, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(993, 274, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(994, 274, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(995, 274, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(996, 274, '严重');


insert into psychtestquestions(id, test_id, type, description) values(275, 2, 'SINGLE_CHOICE', '从未感到和其他人很亲近');
insert into psychtestquestionoptions(id, question_id, description) values(997, 275, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(998, 275, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(999, 275, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(1000, 275, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(1001, 275, '严重');


insert into psychtestquestions(id, test_id, type, description) values(276, 2, 'SINGLE_CHOICE', '感到自己有罪');
insert into psychtestquestionoptions(id, question_id, description) values(1002, 276, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(1003, 276, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(1004, 276, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(1005, 276, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(1006, 276, '严重');


insert into psychtestquestions(id, test_id, type, description) values(277, 2, 'SINGLE_CHOICE', '感到自己的脑子有毛病');
insert into psychtestquestionoptions(id, question_id, description) values(1007, 277, '没有');
insert into psychtestquestionoptions(id, question_id, description) values(1008, 277, '很轻');
insert into psychtestquestionoptions(id, question_id, description) values(1009, 277, '中等');
insert into psychtestquestionoptions(id, question_id, description) values(1010, 277, '偏重');
insert into psychtestquestionoptions(id, question_id, description) values(1011, 277, '严重');






-- insert into psychtestcategories16pf(id, name, topname) values (1, '适应与焦虑型', '次级人格因素分析');
-- insert into psychtestcategories16pf(id, name, topname) values (2, '内向与外向型', '次级人格因素分析');
-- insert into psychtestcategories16pf(id, name, topname) values (3, '感情用事与安详机警型', '次级人格因素分析');
-- insert into psychtestcategories16pf(id, name, topname) values (4, '怯懦与果断型', '次级人格因素分析');
-- insert into psychtestcategories16pf(id, name, topname) values (5, '心理健康因素', '16种人格因素测验应用的计算');
-- insert into psychtestcategories16pf(id, name, topname) values (6, '专业而有成就者的人格因素', '16种人格因素测验应用的计算');
-- insert into psychtestcategories16pf(id, name, topname) values (7, '创造能力人格因素', '16种人格因素测验应用的计算');
-- insert into psychtestcategories16pf(id, name, topname) values (8, '在新的环境中有成长能力的人格因素', '16种人格因素测验应用的计算');
