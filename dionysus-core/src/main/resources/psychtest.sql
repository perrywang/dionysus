insert into psychtestsuites(id, title, description) values (1, '人格类', '人格类');

insert into psychtests(id, type, format, title, description, object, duration, cost, approach) values (1, 'PF16', 'ONE_BY_ONE', '16PF', '人格评定以及心理健康评定', '12岁以上', '30', '120', 'MACHINE');
insert into psychtests(id, type, format, title, description, object, duration, cost, approach) values (2, 'EPQ',  'TABLE', '艾森克量表', '人格评定以及心理健康评定', '3岁以上', '10', '100', 'MACHINE');
insert into psychtests(id, type, format, title, description, object, duration, cost, approach) values (3, 'MMPI', 'TABLE', '明尼苏达', '人格评定及精神疾病评定', '12岁以上', '60', '300', 'MACHINE');
insert into psychtests(id, type, format, title, description, object, duration, cost, approach) values (4, 'EPPS', 'ONE_BY_ONE', '爱德华个人偏好量表', '了解性格特点以及内在各项需求评定认知', '12岁以上', '40', '100', 'MACHINE');
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














-- 艾森克人格问卷（ＥＰＱ）（成人）
--   请回答下列问题。回答“是“时，就在答题卡内写“1”；回答“否“时就在答题卡内写上打“2”。
--   每个答案无所谓正确与错误。这里没有对你不利的题目。请尽快回答，不要在每道题目上太多思索。
--   回答时不要考虑应该怎样，只回答你平时是怎样的。每题都要回答。

insert into psychtestquestions(id, test_id, type, description) values (188, 2, 'YES_NO', '你是否有许多不同的业余爱好？');
insert into psychtestquestions(id, test_id, type, description) values (189, 2, 'YES_NO', '你是否在做任何事情以前都要停下来仔细思考？');
insert into psychtestquestions(id, test_id, type, description) values (190, 2, 'YES_NO', '你的心境是否常有起伏？');
insert into psychtestquestions(id, test_id, type, description) values (191, 2, 'YES_NO', '你曾有过明知是别人的功劳而你去接受奖励的事吗？');
insert into psychtestquestions(id, test_id, type, description) values (192, 2, 'YES_NO', '你是否健谈？');
insert into psychtestquestions(id, test_id, type, description) values (193, 2, 'YES_NO', '欠债会使你不安吗？');
insert into psychtestquestions(id, test_id, type, description) values (194, 2, 'YES_NO', '你曾无缘无故觉得“真是难受”吗？');
insert into psychtestquestions(id, test_id, type, description) values (195, 2, 'YES_NO', '你曾贪图过份外之物吗？');
insert into psychtestquestions(id, test_id, type, description) values (196, 2, 'YES_NO', '你是否在晚上小心翼翼地关好门窗？');
insert into psychtestquestions(id, test_id, type, description) values (197, 2, 'YES_NO', '你是否比较活跃？');
insert into psychtestquestions(id, test_id, type, description) values (198, 2, 'YES_NO', '你在见到一小孩或一动物受折磨时是否会感到非常难过？');
insert into psychtestquestions(id, test_id, type, description) values (199, 2, 'YES_NO', '你是否常常为自己不该作而作了的事，不该说而说了的话而紧张吗？');
insert into psychtestquestions(id, test_id, type, description) values (200, 2, 'YES_NO', '你喜欢跳降落伞吗？');
insert into psychtestquestions(id, test_id, type, description) values (201, 2, 'YES_NO', '通常你能在热闹联欢会中尽情地玩吗？');
insert into psychtestquestions(id, test_id, type, description) values (202, 2, 'YES_NO', '你容易激动吗？');
insert into psychtestquestions(id, test_id, type, description) values (203, 2, 'YES_NO', '你曾经将自己的过错推给别人吗？');
insert into psychtestquestions(id, test_id, type, description) values (204, 2, 'YES_NO', '你喜欢会见陌生人吗？');
insert into psychtestquestions(id, test_id, type, description) values (205, 2, 'YES_NO', '你是否相信保险制度是一种好办法？');
insert into psychtestquestions(id, test_id, type, description) values (206, 2, 'YES_NO', '你是一个容易伤感情的人吗？');
insert into psychtestquestions(id, test_id, type, description) values (207, 2, 'YES_NO', '你所有的习惯都是好的吗？');
insert into psychtestquestions(id, test_id, type, description) values (208, 2, 'YES_NO', '在社交场合你是否总不愿露头角？');
insert into psychtestquestions(id, test_id, type, description) values (209, 2, 'YES_NO', '你会服用奇异或危险作用的药物吗？');
insert into psychtestquestions(id, test_id, type, description) values (210, 2, 'YES_NO', '你常有“厌倦”之感吗？');
insert into psychtestquestions(id, test_id, type, description) values (211, 2, 'YES_NO', '你曾拿过别人的东西吗（那怕一针一线）？');
insert into psychtestquestions(id, test_id, type, description) values (212, 2, 'YES_NO', '你是否常爱外出？');
insert into psychtestquestions(id, test_id, type, description) values (213, 2, 'YES_NO', '你是否从伤害你所宠爱的人而感到乐趣？');
insert into psychtestquestions(id, test_id, type, description) values (214, 2, 'YES_NO', '你常为有罪恶之感所苦恼吗？');
insert into psychtestquestions(id, test_id, type, description) values (215, 2, 'YES_NO', '你在谈论中是否有时不懂装懂？');
insert into psychtestquestions(id, test_id, type, description) values (216, 2, 'YES_NO', '你是否宁愿去看书而不愿去多见人？');
insert into psychtestquestions(id, test_id, type, description) values (217, 2, 'YES_NO', '你有要伤害你的仇人吗？');
insert into psychtestquestions(id, test_id, type, description) values (218, 2, 'YES_NO', '你觉得自己是一个神经过敏的人吗？');
insert into psychtestquestions(id, test_id, type, description) values (219, 2, 'YES_NO', '对人有所失礼时你是否经常要表示歉意？');
insert into psychtestquestions(id, test_id, type, description) values (220, 2, 'YES_NO', '你有许多朋友吗？');
insert into psychtestquestions(id, test_id, type, description) values (221, 2, 'YES_NO', '你是否喜爱讲些有时确能伤害人的笑话？');
insert into psychtestquestions(id, test_id, type, description) values (222, 2, 'YES_NO', '你是一个多忧多虑的人吗？');
insert into psychtestquestions(id, test_id, type, description) values (223, 2, 'YES_NO', '你在童年是否按照吩咐要做什么便做什么，毫无怨言？');
insert into psychtestquestions(id, test_id, type, description) values (224, 2, 'YES_NO', '你认为你是一个乐天派吗？');
insert into psychtestquestions(id, test_id, type, description) values (225, 2, 'YES_NO', '你很讲究礼貌和整洁吗？');
insert into psychtestquestions(id, test_id, type, description) values (226, 2, 'YES_NO', '你是否总在担心会发生可怕的事情？');
insert into psychtestquestions(id, test_id, type, description) values (227, 2, 'YES_NO', '你曾损坏或遗失过别人的东西吗？');
insert into psychtestquestions(id, test_id, type, description) values (228, 2, 'YES_NO', '交新朋友时一般是你采取主动吗？');
insert into psychtestquestions(id, test_id, type, description) values (229, 2, 'YES_NO', '当别人向你诉苦时，你是否容易理解他们的苦哀？');
insert into psychtestquestions(id, test_id, type, description) values (230, 2, 'YES_NO', '你认为自己很紧张，如同“拉紧的弦”一样吗？');
insert into psychtestquestions(id, test_id, type, description) values (231, 2, 'YES_NO', '在没有废纸篓时，你是否将废纸扔在地板上？');
insert into psychtestquestions(id, test_id, type, description) values (232, 2, 'YES_NO', '当你与别人在一起时，你是否言语很少？');
insert into psychtestquestions(id, test_id, type, description) values (233, 2, 'YES_NO', '你是否认为结婚制度是过时了，应该废止？');
insert into psychtestquestions(id, test_id, type, description) values (234, 2, 'YES_NO', '你是否有时感到自己可怜？');
insert into psychtestquestions(id, test_id, type, description) values (235, 2, 'YES_NO', '你是否有时有点自夸？');
insert into psychtestquestions(id, test_id, type, description) values (236, 2, 'YES_NO', '你是否很容易将一个沉寂的集会搞得活跃起来？');
insert into psychtestquestions(id, test_id, type, description) values (237, 2, 'YES_NO', '你是否讨厌那种小心翼翼地开车的人？');
insert into psychtestquestions(id, test_id, type, description) values (238, 2, 'YES_NO', '你为你的健康担忧吗？');
insert into psychtestquestions(id, test_id, type, description) values (239, 2, 'YES_NO', '你曾讲过什么人的坏话吗？');
insert into psychtestquestions(id, test_id, type, description) values (240, 2, 'YES_NO', '你是否喜欢对朋友讲笑话和有趣的故事？');
insert into psychtestquestions(id, test_id, type, description) values (241, 2, 'YES_NO', '你小时候曾对父母粗暴无礼吗？');
insert into psychtestquestions(id, test_id, type, description) values (242, 2, 'YES_NO', '你是否喜欢与人混在一起？');
insert into psychtestquestions(id, test_id, type, description) values (243, 2, 'YES_NO', '你如知道自己工作有错误，这会使你感到难过吗？');
insert into psychtestquestions(id, test_id, type, description) values (244, 2, 'YES_NO', '你患失眠吗？');
insert into psychtestquestions(id, test_id, type, description) values (245, 2, 'YES_NO', '你吃饭前必定洗手吗？');
insert into psychtestquestions(id, test_id, type, description) values (246, 2, 'YES_NO', '你常无缘无故感到无精打采和倦怠吗？');
insert into psychtestquestions(id, test_id, type, description) values (247, 2, 'YES_NO', '和别人玩游戏时，你有过欺骗行为吗？');
insert into psychtestquestions(id, test_id, type, description) values (248, 2, 'YES_NO', '你是否喜欢从事一些动作迅速的工作？');
insert into psychtestquestions(id, test_id, type, description) values (249, 2, 'YES_NO', '你的母亲是一位善良的妇人吗？');
insert into psychtestquestions(id, test_id, type, description) values (250, 2, 'YES_NO', '你是否常常觉得人生非常无味？');
insert into psychtestquestions(id, test_id, type, description) values (251, 2, 'YES_NO', '你曾利用过某人为自己取得好处吗？');
insert into psychtestquestions(id, test_id, type, description) values (252, 2, 'YES_NO', '你是否常常参加许多活动，超过你的时间所允许？');
insert into psychtestquestions(id, test_id, type, description) values (253, 2, 'YES_NO', '是否有几个人总在躲避你？');
insert into psychtestquestions(id, test_id, type, description) values (254, 2, 'YES_NO', '你是否为你的容貌而非常烦恼？');
insert into psychtestquestions(id, test_id, type, description) values (255, 2, 'YES_NO', '你是否觉得人们为了未来有保障而办理储蓄和保险所花的时间太多？');
insert into psychtestquestions(id, test_id, type, description) values (256, 2, 'YES_NO', '你曾有过不如死了为好的愿望吗？');
insert into psychtestquestions(id, test_id, type, description) values (257, 2, 'YES_NO', '如果有把握永远不会被别人发现，你会逃税吗？');
insert into psychtestquestions(id, test_id, type, description) values (258, 2, 'YES_NO', '你能使一个集会顺利进行吗？');
insert into psychtestquestions(id, test_id, type, description) values (259, 2, 'YES_NO', '你能克制自己不对人无礼吗？');
insert into psychtestquestions(id, test_id, type, description) values (260, 2, 'YES_NO', '遇到一次难堪的经历后，你是否在一段很长的时间内还感到难受？');
insert into psychtestquestions(id, test_id, type, description) values (261, 2, 'YES_NO', '你患有“神经过敏”吗？');
insert into psychtestquestions(id, test_id, type, description) values (262, 2, 'YES_NO', '你曾经故意说些什么来伤害别人的感情吗？');
insert into psychtestquestions(id, test_id, type, description) values (263, 2, 'YES_NO', '你与别人的友谊是否容易破裂，虽然不是你的过错？');
insert into psychtestquestions(id, test_id, type, description) values (264, 2, 'YES_NO', '你常感到孤单吗？');
insert into psychtestquestions(id, test_id, type, description) values (265, 2, 'YES_NO', '当人家寻你的差错,找你工作中的缺点时,你是否容易在精神上受挫伤？');
insert into psychtestquestions(id, test_id, type, description) values (266, 2, 'YES_NO', '你赴约会或上班曾迟到过吗？');
insert into psychtestquestions(id, test_id, type, description) values (267, 2, 'YES_NO', '你喜欢忙忙碌碌地过日子吗？');
insert into psychtestquestions(id, test_id, type, description) values (268, 2, 'YES_NO', '你愿意别人怕你吗？');
insert into psychtestquestions(id, test_id, type, description) values (269, 2, 'YES_NO', '你是否觉得有时浑身是劲，而有时又是懒洋洋的吗？');
insert into psychtestquestions(id, test_id, type, description) values (270, 2, 'YES_NO', '你有时把今天应做的事拖到明天去做吗？');
insert into psychtestquestions(id, test_id, type, description) values (271, 2, 'YES_NO', '别人认为你是生气勃勃吗？');
insert into psychtestquestions(id, test_id, type, description) values (272, 2, 'YES_NO', '别人是否对你说了许多谎话？');
insert into psychtestquestions(id, test_id, type, description) values (273, 2, 'YES_NO', '你是否容易对某些事物容易冒火？');
insert into psychtestquestions(id, test_id, type, description) values (274, 2, 'YES_NO', '当你犯了错误时，你是否常常愿意承认它？');
insert into psychtestquestions(id, test_id, type, description) values (275, 2, 'YES_NO', '你会为一动物落入圈套被捉拿而感到很难过吗？');


















-- 明尼苏达多相人格测试(MMPI) 
--     明尼苏达多相人格测试(MMPI)是美国明尼苏达大学教授哈撒韦(S·R·Hathaway)和麦金利(J·C·Mckinley)制定的，此后40多年来，一直被广泛应用于各个领域，如人类学、心理学、医学、社会学等研究工作中。本测验对每个受试者的个性特点提供的客观评价，是临床医师与心理学工作所关注的。在选择测查表的每个问题时Hathaway与Mckinley进行了深入细致的工作。 首先由大量病史、 早期出版的个性量表及医生笔记中选出了550个题目。然后对正常与异常受试进行测验。通过重复测验， 交叉测验，以验证每个量表的信度与效度。在临床实践中反复验证、修订最后确定为13个量表(其中包括10个临床量表，3个效度量表)。
--      目前较常见的测试方式是只做前399道。测试时间最长90分钟，通常是45分钟。
-- 说明：
-- （1）MMPI回答采用“是”或“否”。没有中间答案
-- （2）根据自己的实际情况回答，如果不确定，凭直觉回答。
insert into psychtestquestions(id, test_id, type, description) values (276, 3, 'YES_NO', '我喜欢看机械方面的杂志。');
insert into psychtestquestions(id, test_id, type, description) values (277, 3, 'YES_NO', '我的胃口很好。');
insert into psychtestquestions(id, test_id, type, description) values (278, 3, 'YES_NO', '我早上起来的时候，多半觉得睡眠充足，头脑清醒。');
insert into psychtestquestions(id, test_id, type, description) values (279, 3, 'YES_NO', '我想我会喜欢图书管理员的工作。');
insert into psychtestquestions(id, test_id, type, description) values (280, 3, 'YES_NO', '我很容易被吵醒。');
insert into psychtestquestions(id, test_id, type, description) values (281, 3, 'YES_NO', '我喜欢看报纸上的犯罪新闻。');
insert into psychtestquestions(id, test_id, type, description) values (282, 3, 'YES_NO', '我的手脚经常是很暖和的。');
insert into psychtestquestions(id, test_id, type, description) values (283, 3, 'YES_NO', '我的日常生活中，充满了使我感兴趣的事情。');
insert into psychtestquestions(id, test_id, type, description) values (284, 3, 'YES_NO', '我现在工作（学习）的能力，和从前差不多。');
insert into psychtestquestions(id, test_id, type, description) values (285, 3, 'YES_NO', '我的喉咙里总好象有一块东西堵着似的。');
insert into psychtestquestions(id, test_id, type, description) values (286, 3, 'YES_NO', '一个人应该去了解自己的梦，并从中得到指导和警告。');
insert into psychtestquestions(id, test_id, type, description) values (287, 3, 'YES_NO', '我喜欢侦探小说或神秘小说。');
insert into psychtestquestions(id, test_id, type, description) values (288, 3, 'YES_NO', '我总是在很紧张的情况下工作。');
insert into psychtestquestions(id, test_id, type, description) values (289, 3, 'YES_NO', '我每个月至少有一二次拉肚子。');
insert into psychtestquestions(id, test_id, type, description) values (290, 3, 'YES_NO', '偶尔我会想到一些坏得说不出口的话。');
insert into psychtestquestions(id, test_id, type, description) values (291, 3, 'YES_NO', '我深信生活对我是残酷的。');
insert into psychtestquestions(id, test_id, type, description) values (292, 3, 'YES_NO', '我的父亲是一个好人。');
insert into psychtestquestions(id, test_id, type, description) values (293, 3, 'YES_NO', '我很少有大便不通的毛病。');
insert into psychtestquestions(id, test_id, type, description) values (294, 3, 'YES_NO', '当我干一件新的工作时，总喜欢别人告诉我，我应该接近谁。');
insert into psychtestquestions(id, test_id, type, description) values (295, 3, 'YES_NO', '我的性生活是满意的。');
insert into psychtestquestions(id, test_id, type, description) values (296, 3, 'YES_NO', '有时我非常想离开家。');
insert into psychtestquestions(id, test_id, type, description) values (297, 3, 'YES_NO', '有时我会哭一阵笑一阵，连自己也不能控制。');
insert into psychtestquestions(id, test_id, type, description) values (298, 3, 'YES_NO', '有恶心和呕吐的毛病，我很苦恼。');
insert into psychtestquestions(id, test_id, type, description) values (299, 3, 'YES_NO', '似乎没有一个人了解我。');
insert into psychtestquestions(id, test_id, type, description) values (300, 3, 'YES_NO', '我想当一个歌唱家。');
insert into psychtestquestions(id, test_id, type, description) values (301, 3, 'YES_NO', '当我处境困难的时候，我觉得最好是不开口。');
insert into psychtestquestions(id, test_id, type, description) values (302, 3, 'YES_NO', '有时我觉得有鬼附在身上。');
insert into psychtestquestions(id, test_id, type, description) values (303, 3, 'YES_NO', '当别人惹了我时，我觉得只要有机会就应报复是理所当然的。');
insert into psychtestquestions(id, test_id, type, description) values (304, 3, 'YES_NO', '我有胃酸过多的毛病。一星期要犯好几次，我很苦恼。．');
insert into psychtestquestions(id, test_id, type, description) values (305, 3, 'YES_NO', '有时我真想骂人。');
insert into psychtestquestions(id, test_id, type, description) values (306, 3, 'YES_NO', '每隔几个晚上我就做噩梦。');
insert into psychtestquestions(id, test_id, type, description) values (307, 3, 'YES_NO', '我发现我很难把注意力集中到一件工作上。');
insert into psychtestquestions(id, test_id, type, description) values (308, 3, 'YES_NO', '我曾经有过很特别、很奇怪的体验。');
insert into psychtestquestions(id, test_id, type, description) values (309, 3, 'YES_NO', '我时常咳嗽。');
insert into psychtestquestions(id, test_id, type, description) values (310, 3, 'YES_NO', '假如不是有人和我作对，我一定会有更大的成就。');
insert into psychtestquestions(id, test_id, type, description) values (311, 3, 'YES_NO', '我很少担心自己的健康。');
insert into psychtestquestions(id, test_id, type, description) values (312, 3, 'YES_NO', '我从来没有因为我的性方面的行为出过事。');
insert into psychtestquestions(id, test_id, type, description) values (313, 3, 'YES_NO', '小的时候，有一段时间我干过小偷小摸的事。');
insert into psychtestquestions(id, test_id, type, description) values (314, 3, 'YES_NO', '有时我真想摔东西。');
insert into psychtestquestions(id, test_id, type, description) values (315, 3, 'YES_NO', '有很多时候我宁愿坐着空想，而不愿做任何事情。');
insert into psychtestquestions(id, test_id, type, description) values (316, 3, 'YES_NO', '我曾一连几天，几个星期，几个月什么也不想干，因为总是提不起精神。');
insert into psychtestquestions(id, test_id, type, description) values (317, 3, 'YES_NO', '我家里人对我已选择的工作（或将要选择的职业）不满意。');
insert into psychtestquestions(id, test_id, type, description) values (318, 3, 'YES_NO', '我睡得不安，容易被惊醒。');
insert into psychtestquestions(id, test_id, type, description) values (319, 3, 'YES_NO', '我觉得我的头到处都疼。');
insert into psychtestquestions(id, test_id, type, description) values (320, 3, 'YES_NO', '有时我也说假话。');
insert into psychtestquestions(id, test_id, type, description) values (321, 3, 'YES_NO', '我的判断力比以往任何时候都好。');
insert into psychtestquestions(id, test_id, type, description) values (322, 3, 'YES_NO', '每星期至少有一二次，我突然觉得无缘无故地全身发热。');
insert into psychtestquestions(id, test_id, type, description) values (323, 3, 'YES_NO', '当我与人相处的时候听到别人谈论稀奇古怪的事，我就心烦。');
insert into psychtestquestions(id, test_id, type, description) values (324, 3, 'YES_NO', '最好是所有的法律全都不要。');
insert into psychtestquestions(id, test_id, type, description) values (325, 3, 'YES_NO', '有时我觉得我的灵魂离开了我的身体。');
insert into psychtestquestions(id, test_id, type, description) values (326, 3, 'YES_NO', '我的身体和我大多数朋友一样的健康。');
insert into psychtestquestions(id, test_id, type, description) values (327, 3, 'YES_NO', '遇到同学或不常见朋友，除非他们先向我打招呼，不然我就装作没看见。');
insert into psychtestquestions(id, test_id, type, description) values (328, 3, 'YES_NO', '一位牧师（和尚、道士、神父、阿訇等教士），能用祈祷和把手放在病人的头上来治病。');
insert into psychtestquestions(id, test_id, type, description) values (329, 3, 'YES_NO', '认识我的人差不多都喜欢我。');
insert into psychtestquestions(id, test_id, type, description) values (330, 3, 'YES_NO', '我从来没有因为胸部痛或心痛而感到苦恼。');
insert into psychtestquestions(id, test_id, type, description) values (331, 3, 'YES_NO', '我小时候，曾经因为胡闹而受过学校的处分。');
insert into psychtestquestions(id, test_id, type, description) values (332, 3, 'YES_NO', '我和别人一见面就熟了（自来熟）。');
insert into psychtestquestions(id, test_id, type, description) values (333, 3, 'YES_NO', '一切事情都由老天爷安排好了。');
insert into psychtestquestions(id, test_id, type, description) values (334, 3, 'YES_NO', '我时常听从某些人的指挥，其实他们还不如我高明。');
insert into psychtestquestions(id, test_id, type, description) values (335, 3, 'YES_NO', '我不是每天都看报纸上的每一篇社论。');
insert into psychtestquestions(id, test_id, type, description) values (336, 3, 'YES_NO', '我从未有过正常的生活。');
insert into psychtestquestions(id, test_id, type, description) values (337, 3, 'YES_NO', '我身体某些部分常有像火烧、刺痛、虫爬、麻木的感觉。');
insert into psychtestquestions(id, test_id, type, description) values (338, 3, 'YES_NO', '我的大便正常，不难控制。');
insert into psychtestquestions(id, test_id, type, description) values (339, 3, 'YES_NO', '有时我会不停地做一件事情，直到别人不耐烦为止。');
insert into psychtestquestions(id, test_id, type, description) values (340, 3, 'YES_NO', '我爱我的父亲。');
insert into psychtestquestions(id, test_id, type, description) values (341, 3, 'YES_NO', '我能在我周围看到其他人所看不到的东西、动物和人。');
insert into psychtestquestions(id, test_id, type, description) values (342, 3, 'YES_NO', '我希望我能像别人那样快乐。');
insert into psychtestquestions(id, test_id, type, description) values (343, 3, 'YES_NO', '我从未感到脖子（颈）后面疼痛。');
insert into psychtestquestions(id, test_id, type, description) values (344, 3, 'YES_NO', '和我性别相同的人对我有强烈的吸引力。');
insert into psychtestquestions(id, test_id, type, description) values (345, 3, 'YES_NO', '我过去经常喜欢玩丢手帕的游戏。');
insert into psychtestquestions(id, test_id, type, description) values (346, 3, 'YES_NO', '我觉得许多人喜欢夸大看书的不幸，以便得到别人的同情和帮助。');
insert into psychtestquestions(id, test_id, type, description) values (347, 3, 'YES_NO', '我为经常感到心口（胃）不舒服而烦恼。');
insert into psychtestquestions(id, test_id, type, description) values (348, 3, 'YES_NO', '我是个重要人物。');
insert into psychtestquestions(id, test_id, type, description) values (349, 3, 'YES_NO', '男性：我总希望我是女的；女性：我从不因为我是女的遗憾。');
insert into psychtestquestions(id, test_id, type, description) values (350, 3, 'YES_NO', '我有时发怒。');
insert into psychtestquestions(id, test_id, type, description) values (351, 3, 'YES_NO', '我时常感到悲观失望。');
insert into psychtestquestions(id, test_id, type, description) values (352, 3, 'YES_NO', '我看爱情小说。');
insert into psychtestquestions(id, test_id, type, description) values (353, 3, 'YES_NO', '我喜欢诗。');
insert into psychtestquestions(id, test_id, type, description) values (354, 3, 'YES_NO', '我的感情不容易受伤害。');
insert into psychtestquestions(id, test_id, type, description) values (355, 3, 'YES_NO', '我有时捉弄动物。');
insert into psychtestquestions(id, test_id, type, description) values (356, 3, 'YES_NO', '我想我会喜欢干森林管理员那一类的工作。');
insert into psychtestquestions(id, test_id, type, description) values (357, 3, 'YES_NO', '和人争辩的时候，我常争不过别人。');
insert into psychtestquestions(id, test_id, type, description) values (358, 3, 'YES_NO', '任何人只要他有能力，而且愿意努力工作是能成功的。');
insert into psychtestquestions(id, test_id, type, description) values (359, 3, 'YES_NO', '近来，我觉得很容易放弃对某些事务的希望。');
insert into psychtestquestions(id, test_id, type, description) values (360, 3, 'YES_NO', '有时我被别人的东西，如鞋、手套等强烈吸引，虽然这些东西对我毫无用处，但我总想摸摸它或把它偷来。');
insert into psychtestquestions(id, test_id, type, description) values (361, 3, 'YES_NO', '我确实缺少自信心。');
insert into psychtestquestions(id, test_id, type, description) values (362, 3, 'YES_NO', '我愿意做一名花匠。');
insert into psychtestquestions(id, test_id, type, description) values (363, 3, 'YES_NO', '我总觉得人生是有价值的。');
insert into psychtestquestions(id, test_id, type, description) values (364, 3, 'YES_NO', '要使大多数人相信事实的真相，是要经过一番辩论的。');
insert into psychtestquestions(id, test_id, type, description) values (365, 3, 'YES_NO', '有时我将今天应该做的事，拖到明天去做。');
insert into psychtestquestions(id, test_id, type, description) values (366, 3, 'YES_NO', '我不在乎别人拿我开玩笑。');
insert into psychtestquestions(id, test_id, type, description) values (367, 3, 'YES_NO', '我想当个护士。');
insert into psychtestquestions(id, test_id, type, description) values (368, 3, 'YES_NO', '我觉得大多数人为了向上爬而不惜说谎。');
insert into psychtestquestions(id, test_id, type, description) values (369, 3, 'YES_NO', '许多事情，我做过以后就后悔了。');
insert into psychtestquestions(id, test_id, type, description) values (370, 3, 'YES_NO', '我几乎每星期都去教堂（或常去寺庙）。');
insert into psychtestquestions(id, test_id, type, description) values (371, 3, 'YES_NO', '我几乎没有和家里人吵过嘴。');
insert into psychtestquestions(id, test_id, type, description) values (372, 3, 'YES_NO', '有时我有一种强烈的冲动，去做一些惊人或有害的事。');
insert into psychtestquestions(id, test_id, type, description) values (373, 3, 'YES_NO', '我相信善有善报，恶有恶报。');
insert into psychtestquestions(id, test_id, type, description) values (374, 3, 'YES_NO', '我喜欢热闹的聚会。');
insert into psychtestquestions(id, test_id, type, description) values (375, 3, 'YES_NO', '我碰到一些千头万绪的问题，使我感到犹豫不决。');
insert into psychtestquestions(id, test_id, type, description) values (376, 3, 'YES_NO', '我认为女的在性生活方面，应该和男的有同等的自由。');
insert into psychtestquestions(id, test_id, type, description) values (377, 3, 'YES_NO', '我认为最难的是控制我自己。');
insert into psychtestquestions(id, test_id, type, description) values (378, 3, 'YES_NO', '我很少有肌肉抽筋或颤抖的毛病。');
insert into psychtestquestions(id, test_id, type, description) values (379, 3, 'YES_NO', '我似乎对什么事情都不在乎。');
insert into psychtestquestions(id, test_id, type, description) values (380, 3, 'YES_NO', '我身体不舒服的时候，有时发脾气。');
insert into psychtestquestions(id, test_id, type, description) values (381, 3, 'YES_NO', '我总觉得我自己好像做错了什么事或犯了什么罪。');
insert into psychtestquestions(id, test_id, type, description) values (382, 3, 'YES_NO', '我经常是快乐的。');
insert into psychtestquestions(id, test_id, type, description) values (383, 3, 'YES_NO', '我时常觉得头胀栓塞似的。');
insert into psychtestquestions(id, test_id, type, description) values (384, 3, 'YES_NO', '有些人太霸道，即使我明知他们是对的，也要和他们对着干。');
insert into psychtestquestions(id, test_id, type, description) values (385, 3, 'YES_NO', '有人想害我。');
insert into psychtestquestions(id, test_id, type, description) values (386, 3, 'YES_NO', '我从来没有为寻求刺激而去做危险的事。');
insert into psychtestquestions(id, test_id, type, description) values (387, 3, 'YES_NO', '我时常认为必须坚持那些我认为正确的事。');
insert into psychtestquestions(id, test_id, type, description) values (388, 3, 'YES_NO', '我相信法制。');
insert into psychtestquestions(id, test_id, type, description) values (389, 3, 'YES_NO', '我常觉得头上好像有一根绷得紧紧的带子。');
insert into psychtestquestions(id, test_id, type, description) values (390, 3, 'YES_NO', '我相信人死后会有“来世”。');
insert into psychtestquestions(id, test_id, type, description) values (391, 3, 'YES_NO', '我更喜欢我下了赌注的比赛和游戏。');
insert into psychtestquestions(id, test_id, type, description) values (392, 3, 'YES_NO', '大部分人之所以是诚实的，主要是因为怕被人识破。');
insert into psychtestquestions(id, test_id, type, description) values (393, 3, 'YES_NO', '我在上学的时候，有时因胡闹而被领导叫去。');
insert into psychtestquestions(id, test_id, type, description) values (394, 3, 'YES_NO', '我说话总是那样不快也不慢，不含糊也不嘶哑。');
insert into psychtestquestions(id, test_id, type, description) values (395, 3, 'YES_NO', '我在外边和朋友们一起吃饭的时候，比在家规矩得多。');
insert into psychtestquestions(id, test_id, type, description) values (396, 3, 'YES_NO', '我相信有人暗算我。');
insert into psychtestquestions(id, test_id, type, description) values (397, 3, 'YES_NO', '我似乎和我周围的人一样精明能干。');
insert into psychtestquestions(id, test_id, type, description) values (398, 3, 'YES_NO', '我相信有人在跟踪我。');
insert into psychtestquestions(id, test_id, type, description) values (399, 3, 'YES_NO', '大多数人不惜用不正当的手段谋取利益，也不愿失掉机会。');
insert into psychtestquestions(id, test_id, type, description) values (400, 3, 'YES_NO', '我的胃有很多毛病。');
insert into psychtestquestions(id, test_id, type, description) values (401, 3, 'YES_NO', '我喜欢戏剧。');
insert into psychtestquestions(id, test_id, type, description) values (402, 3, 'YES_NO', '我知道我的烦恼是谁造成的。');
insert into psychtestquestions(id, test_id, type, description) values (403, 3, 'YES_NO', '看到血的时候，我既不害怕，也不难受。');
insert into psychtestquestions(id, test_id, type, description) values (404, 3, 'YES_NO', '我自己常弄不清为什么这样爱生气和发牢骚。');
insert into psychtestquestions(id, test_id, type, description) values (405, 3, 'YES_NO', '我从来没有吐过血，或咳过血。');
insert into psychtestquestions(id, test_id, type, description) values (406, 3, 'YES_NO', '我不为得病而担心。');
insert into psychtestquestions(id, test_id, type, description) values (407, 3, 'YES_NO', '我喜欢栽花或采集花草。');
insert into psychtestquestions(id, test_id, type, description) values (408, 3, 'YES_NO', '我从来没有放纵自己发生过任何不正常的性行为。');
insert into psychtestquestions(id, test_id, type, description) values (409, 3, 'YES_NO', '有时我的思想跑得太快都来不及表达出来。');
insert into psychtestquestions(id, test_id, type, description) values (410, 3, 'YES_NO', '假如我能不买票白看电影，而且不会被人发觉，我可能会去做的。');
insert into psychtestquestions(id, test_id, type, description) values (411, 3, 'YES_NO', '如果别人待我好，我常常怀疑他们别有用心。');
insert into psychtestquestions(id, test_id, type, description) values (412, 3, 'YES_NO', '我相信我的家庭生活，和我所认识的许多人一样，幸福快乐。');
insert into psychtestquestions(id, test_id, type, description) values (413, 3, 'YES_NO', '批评和责骂都使我非常伤心。');
insert into psychtestquestions(id, test_id, type, description) values (414, 3, 'YES_NO', '有时我仿佛觉得我必须伤害自己或别人。');
insert into psychtestquestions(id, test_id, type, description) values (415, 3, 'YES_NO', '我喜欢做饭烧菜。');
insert into psychtestquestions(id, test_id, type, description) values (416, 3, 'YES_NO', '我的行为多半受周围人的喜欢所支配。');
insert into psychtestquestions(id, test_id, type, description) values (417, 3, 'YES_NO', '有时我觉得我真是毫无用处。');
insert into psychtestquestions(id, test_id, type, description) values (418, 3, 'YES_NO', '小时候我曾加入过一个团伙，有福共享，有祸同当。');
insert into psychtestquestions(id, test_id, type, description) values (419, 3, 'YES_NO', '我喜欢当兵。');
insert into psychtestquestions(id, test_id, type, description) values (420, 3, 'YES_NO', '有时我想借故和别人打架。');
insert into psychtestquestions(id, test_id, type, description) values (421, 3, 'YES_NO', '我喜欢到处乱逛，如果不行，我就不高兴。');
insert into psychtestquestions(id, test_id, type, description) values (422, 3, 'YES_NO', '由于我经常不能当机立断，因而失去许多良机。');
insert into psychtestquestions(id, test_id, type, description) values (423, 3, 'YES_NO', '当我正在做一件重要事情的时候，如果有人向我请教或打扰我，我会不耐烦的。');
insert into psychtestquestions(id, test_id, type, description) values (424, 3, 'YES_NO', '我以前写过日记。');
insert into psychtestquestions(id, test_id, type, description) values (425, 3, 'YES_NO', '做游戏的时候，我只愿赢而不愿输。');
insert into psychtestquestions(id, test_id, type, description) values (426, 3, 'YES_NO', '有人一直想毒死我。');
insert into psychtestquestions(id, test_id, type, description) values (427, 3, 'YES_NO', '大多数晚上我睡觉时，不受什么思想干扰。');
insert into psychtestquestions(id, test_id, type, description) values (428, 3, 'YES_NO', '近几年来大部分时间，我的身体都很好。');
insert into psychtestquestions(id, test_id, type, description) values (429, 3, 'YES_NO', '我从来没有过抽风的毛病。');
insert into psychtestquestions(id, test_id, type, description) values (430, 3, 'YES_NO', '现在我的体重既没有增加也没有减轻。');
insert into psychtestquestions(id, test_id, type, description) values (431, 3, 'YES_NO', '有一段时间，我自己做过的事情全不记得了。');
insert into psychtestquestions(id, test_id, type, description) values (432, 3, 'YES_NO', '我觉得我时常无缘无故地受到惩罚。');
insert into psychtestquestions(id, test_id, type, description) values (433, 3, 'YES_NO', '我容易哭。');
insert into psychtestquestions(id, test_id, type, description) values (434, 3, 'YES_NO', '我不能象从前那样理解我所读的东西了。');
insert into psychtestquestions(id, test_id, type, description) values (435, 3, 'YES_NO', '在我一生中，我从来没有感觉到像现在这么好。');
insert into psychtestquestions(id, test_id, type, description) values (436, 3, 'YES_NO', '有时候我觉得我的头顶一碰就疼。');
insert into psychtestquestions(id, test_id, type, description) values (437, 3, 'YES_NO', '我痛恨别人以不正当的手段捉弄我，使我不得不认输。');
insert into psychtestquestions(id, test_id, type, description) values (438, 3, 'YES_NO', '我不容易疲倦。');
insert into psychtestquestions(id, test_id, type, description) values (439, 3, 'YES_NO', '我喜欢研究和阅读与我目前工作有关的东西。');
insert into psychtestquestions(id, test_id, type, description) values (440, 3, 'YES_NO', '我喜欢结识一些重要人物，这样会使我感到自己也很重要。');
insert into psychtestquestions(id, test_id, type, description) values (441, 3, 'YES_NO', '我很害怕从高处往下看。');
insert into psychtestquestions(id, test_id, type, description) values (442, 3, 'YES_NO', '即使我家里有人犯法，我也不会紧张。');
insert into psychtestquestions(id, test_id, type, description) values (443, 3, 'YES_NO', '我的脑子有点毛病。');
insert into psychtestquestions(id, test_id, type, description) values (444, 3, 'YES_NO', '我不怕管钱。');
insert into psychtestquestions(id, test_id, type, description) values (445, 3, 'YES_NO', '我不在乎别人对我有什么看法。');
insert into psychtestquestions(id, test_id, type, description) values (446, 3, 'YES_NO', '在聚会当中，尽管有人出风头，如果让我也这样做，我会感到很不舒服。');
insert into psychtestquestions(id, test_id, type, description) values (447, 3, 'YES_NO', '我时常需要努力使自己不显出怕羞的样子。');
insert into psychtestquestions(id, test_id, type, description) values (448, 3, 'YES_NO', '我过去喜欢上学。');
insert into psychtestquestions(id, test_id, type, description) values (449, 3, 'YES_NO', '我从来没有昏倒过。');
insert into psychtestquestions(id, test_id, type, description) values (450, 3, 'YES_NO', '我很少头昏眼花。');
insert into psychtestquestions(id, test_id, type, description) values (451, 3, 'YES_NO', '我不大怕蛇。');
insert into psychtestquestions(id, test_id, type, description) values (452, 3, 'YES_NO', '我母亲是个好人。');
insert into psychtestquestions(id, test_id, type, description) values (453, 3, 'YES_NO', '我的记忆力似乎不错。');
insert into psychtestquestions(id, test_id, type, description) values (454, 3, 'YES_NO', '有关性方面的问题，使我烦恼。');
insert into psychtestquestions(id, test_id, type, description) values (455, 3, 'YES_NO', '我觉得我遇到生人的时候就不知道说什么好了。');
insert into psychtestquestions(id, test_id, type, description) values (456, 3, 'YES_NO', '无聊的时候，我就会惹事寻求开心。');
insert into psychtestquestions(id, test_id, type, description) values (457, 3, 'YES_NO', '我怕自己会发疯。');
insert into psychtestquestions(id, test_id, type, description) values (458, 3, 'YES_NO', '我反对把钱给乞丐。');
insert into psychtestquestions(id, test_id, type, description) values (459, 3, 'YES_NO', '我时常听到说话的声音，而不知道它是从那里来的。');
insert into psychtestquestions(id, test_id, type, description) values (460, 3, 'YES_NO', '我的听觉显然和大多数人一样好。');
insert into psychtestquestions(id, test_id, type, description) values (461, 3, 'YES_NO', '当我要做一件事的时候，我常发觉我的手在抖。');
insert into psychtestquestions(id, test_id, type, description) values (462, 3, 'YES_NO', '我的双手并没有变得笨拙不灵。');
insert into psychtestquestions(id, test_id, type, description) values (463, 3, 'YES_NO', '我能阅读很长的时间，而眼睛不觉得累。');
insert into psychtestquestions(id, test_id, type, description) values (464, 3, 'YES_NO', '许多时候，我觉得浑身无力。');
insert into psychtestquestions(id, test_id, type, description) values (465, 3, 'YES_NO', '我很少头痛。');
insert into psychtestquestions(id, test_id, type, description) values (466, 3, 'YES_NO', '有时，当我难为情的时候，会出很多汗，这使我非常苦恼。');
insert into psychtestquestions(id, test_id, type, description) values (467, 3, 'YES_NO', '我走路时保持平稳并不困难。');
insert into psychtestquestions(id, test_id, type, description) values (468, 3, 'YES_NO', '我没哮喘这一类病。');
insert into psychtestquestions(id, test_id, type, description) values (469, 3, 'YES_NO', '我曾经有过几次突然不能控制自己的行动或言语，但当时我的头脑还很清醒。');
insert into psychtestquestions(id, test_id, type, description) values (470, 3, 'YES_NO', '我所认识的人里不是各个我都喜欢。');
insert into psychtestquestions(id, test_id, type, description) values (471, 3, 'YES_NO', '我喜欢到我从来没有到过的地方去游览。');
insert into psychtestquestions(id, test_id, type, description) values (472, 3, 'YES_NO', '有人一直想抢我的东西。');
insert into psychtestquestions(id, test_id, type, description) values (473, 3, 'YES_NO', '我很少空想。');
insert into psychtestquestions(id, test_id, type, description) values (474, 3, 'YES_NO', '我们应该把有关性方面的主要知识告诉孩子。');
insert into psychtestquestions(id, test_id, type, description) values (475, 3, 'YES_NO', '有人想窃取我的思想和计划。');
insert into psychtestquestions(id, test_id, type, description) values (476, 3, 'YES_NO', '但愿我不像现在这样的害羞。');
insert into psychtestquestions(id, test_id, type, description) values (477, 3, 'YES_NO', '我相信我是一个被谴责的人。');
insert into psychtestquestions(id, test_id, type, description) values (478, 3, 'YES_NO', '假若我是一个新闻记者，我将喜欢报道戏剧界的新闻。');
insert into psychtestquestions(id, test_id, type, description) values (479, 3, 'YES_NO', '我喜欢做一个新闻记者。');
insert into psychtestquestions(id, test_id, type, description) values (480, 3, 'YES_NO', '有时我控制不住想要偷点东西。');
insert into psychtestquestions(id, test_id, type, description) values (481, 3, 'YES_NO', '我很信神，程度超过多数人。');
insert into psychtestquestions(id, test_id, type, description) values (482, 3, 'YES_NO', '我喜欢许多不同种类的游戏和娱乐。');
insert into psychtestquestions(id, test_id, type, description) values (483, 3, 'YES_NO', '我喜欢和异性说笑。');
insert into psychtestquestions(id, test_id, type, description) values (484, 3, 'YES_NO', '我相信我的罪恶是不可饶恕的。');
insert into psychtestquestions(id, test_id, type, description) values (485, 3, 'YES_NO', '每一种东西吃起来味道都是不一样的。');
insert into psychtestquestions(id, test_id, type, description) values (486, 3, 'YES_NO', '我白天睡觉，晚上却睡不着。');
insert into psychtestquestions(id, test_id, type, description) values (487, 3, 'YES_NO', '我家里的人把我当做小孩子，而不把我当做大人看待。');
insert into psychtestquestions(id, test_id, type, description) values (488, 3, 'YES_NO', '走路时，我很小心地跨过人行道上的接缝。');
insert into psychtestquestions(id, test_id, type, description) values (489, 3, 'YES_NO', '我从来没有为皮肤上长点东西而烦恼。');
insert into psychtestquestions(id, test_id, type, description) values (490, 3, 'YES_NO', '我曾经饮酒过度。');
insert into psychtestquestions(id, test_id, type, description) values (491, 3, 'YES_NO', '和别人的家庭比较，我的家庭缺乏爱和温暖。');
insert into psychtestquestions(id, test_id, type, description) values (492, 3, 'YES_NO', '我时常感到自己在为某些事而担心。');
insert into psychtestquestions(id, test_id, type, description) values (493, 3, 'YES_NO', '当看到动物受折磨的时候，我并不觉得特别难受。');
insert into psychtestquestions(id, test_id, type, description) values (494, 3, 'YES_NO', '我想我会喜欢建筑承包的工作。');
insert into psychtestquestions(id, test_id, type, description) values (495, 3, 'YES_NO', '我爱我母亲。');
insert into psychtestquestions(id, test_id, type, description) values (496, 3, 'YES_NO', '我喜欢科学。');
insert into psychtestquestions(id, test_id, type, description) values (497, 3, 'YES_NO', '即使我以后不能报答，我也愿向朋友求助。');
insert into psychtestquestions(id, test_id, type, description) values (498, 3, 'YES_NO', '我很喜欢打猎。');
insert into psychtestquestions(id, test_id, type, description) values (499, 3, 'YES_NO', '我父母经常反对那些和我交往的人。');
insert into psychtestquestions(id, test_id, type, description) values (500, 3, 'YES_NO', '有时我也会说说人家的闲话。');
insert into psychtestquestions(id, test_id, type, description) values (501, 3, 'YES_NO', '我家里有些人的习惯，使我非常讨厌。');
insert into psychtestquestions(id, test_id, type, description) values (502, 3, 'YES_NO', '人家告诉我，我在睡觉中起来走路（梦游）。');
insert into psychtestquestions(id, test_id, type, description) values (503, 3, 'YES_NO', '有时我觉得我非常容易做出决定。');
insert into psychtestquestions(id, test_id, type, description) values (504, 3, 'YES_NO', '我喜欢同时参加几个团体。');
insert into psychtestquestions(id, test_id, type, description) values (505, 3, 'YES_NO', '我从来没有感到心慌气短。');
insert into psychtestquestions(id, test_id, type, description) values (506, 3, 'YES_NO', '我喜欢谈论两性方面的事。');
insert into psychtestquestions(id, test_id, type, description) values (507, 3, 'YES_NO', '我曾经立志要过一种以责任为重的生活，我一直照此谨慎从事。');
insert into psychtestquestions(id, test_id, type, description) values (508, 3, 'YES_NO', '我有时阻止别人做某些事，并不是因为那种事有多大影响，而是在道义上我应该干预他。');
insert into psychtestquestions(id, test_id, type, description) values (509, 3, 'YES_NO', '我很容易生气，但很快就平静下来。');
insert into psychtestquestions(id, test_id, type, description) values (510, 3, 'YES_NO', '我已独立自主，不受家庭的约束。');
insert into psychtestquestions(id, test_id, type, description) values (511, 3, 'YES_NO', '我有很多心事。');
insert into psychtestquestions(id, test_id, type, description) values (512, 3, 'YES_NO', '我的亲属几乎全都同情我。');
insert into psychtestquestions(id, test_id, type, description) values (513, 3, 'YES_NO', '有时我十分烦躁，坐立不安。');
insert into psychtestquestions(id, test_id, type, description) values (514, 3, 'YES_NO', '我曾经失恋过。');
insert into psychtestquestions(id, test_id, type, description) values (515, 3, 'YES_NO', '我从来不为我的外貌而发愁。');
insert into psychtestquestions(id, test_id, type, description) values (516, 3, 'YES_NO', '我常梦到一些不可告人的事。');
insert into psychtestquestions(id, test_id, type, description) values (517, 3, 'YES_NO', '我相信我并不比别人更为神经过敏。');
insert into psychtestquestions(id, test_id, type, description) values (518, 3, 'YES_NO', '我几乎没有什么地方疼痛。');
insert into psychtestquestions(id, test_id, type, description) values (519, 3, 'YES_NO', '我的做事方法容易被人误解。');
insert into psychtestquestions(id, test_id, type, description) values (520, 3, 'YES_NO', '我的父母和家里人对我过于挑剔。');
insert into psychtestquestions(id, test_id, type, description) values (521, 3, 'YES_NO', '我脖子（颈）上时常出现红斑。');
insert into psychtestquestions(id, test_id, type, description) values (522, 3, 'YES_NO', '我有理由嫉妒家里的某些人。');
insert into psychtestquestions(id, test_id, type, description) values (523, 3, 'YES_NO', '我有时无缘无故地，甚至在不顺利的时候也会觉得非常快乐。');
insert into psychtestquestions(id, test_id, type, description) values (524, 3, 'YES_NO', '我相信阴间有魔鬼和地狱。');
insert into psychtestquestions(id, test_id, type, description) values (525, 3, 'YES_NO', '有人想把世界上所能得到的东西都夺到手，我绝不责怪他。');
insert into psychtestquestions(id, test_id, type, description) values (526, 3, 'YES_NO', '我曾经发呆（发愣）停止活动，不知道周围发生了什么事情。');
insert into psychtestquestions(id, test_id, type, description) values (527, 3, 'YES_NO', '谁也不关心谁的遭遇。');
insert into psychtestquestions(id, test_id, type, description) values (528, 3, 'YES_NO', '有些人所做的事，虽然我认为是错的，但我仍然能够友好地对待他们。');
insert into psychtestquestions(id, test_id, type, description) values (529, 3, 'YES_NO', '我喜欢和一些能互相开玩笑的人在一起。');
insert into psychtestquestions(id, test_id, type, description) values (530, 3, 'YES_NO', '在选举的时候，有时我会选出我不熟悉的人。');
insert into psychtestquestions(id, test_id, type, description) values (531, 3, 'YES_NO', '报纸上只有漫画最有趣。');
insert into psychtestquestions(id, test_id, type, description) values (532, 3, 'YES_NO', '凡是我所做的事，我都指望能够成功。');
insert into psychtestquestions(id, test_id, type, description) values (533, 3, 'YES_NO', '我相信有神。');
insert into psychtestquestions(id, test_id, type, description) values (534, 3, 'YES_NO', '做什么事情，我都感到难以开头。');
insert into psychtestquestions(id, test_id, type, description) values (535, 3, 'YES_NO', '在学校里，我是个笨学生。');
insert into psychtestquestions(id, test_id, type, description) values (536, 3, 'YES_NO', '如果我是个画家，我喜欢画花。');
insert into psychtestquestions(id, test_id, type, description) values (537, 3, 'YES_NO', '我虽然相貌不好看，也不因此而苦恼。');
insert into psychtestquestions(id, test_id, type, description) values (538, 3, 'YES_NO', '即使在冷天我也很容易出汗。');
insert into psychtestquestions(id, test_id, type, description) values (539, 3, 'YES_NO', '我十分自信。');
insert into psychtestquestions(id, test_id, type, description) values (540, 3, 'YES_NO', '对任何人都不信任，是比较安全的。');
insert into psychtestquestions(id, test_id, type, description) values (541, 3, 'YES_NO', '每星期至少有一两次我十分兴奋。');
insert into psychtestquestions(id, test_id, type, description) values (542, 3, 'YES_NO', '人多的时候，我不知道说些什么话好。');
insert into psychtestquestions(id, test_id, type, description) values (543, 3, 'YES_NO', '在我心情不好的时候，总会有一些事使我高兴起来。');
insert into psychtestquestions(id, test_id, type, description) values (544, 3, 'YES_NO', '我能很容易使人怕我，有时故意这样做来寻开心。');
insert into psychtestquestions(id, test_id, type, description) values (545, 3, 'YES_NO', '我离家外出的时候，从来不担心家里门窗是否关好锁好了。');
insert into psychtestquestions(id, test_id, type, description) values (546, 3, 'YES_NO', '我不责怪一个到处找没趣的人。');
insert into psychtestquestions(id, test_id, type, description) values (547, 3, 'YES_NO', '我有时精力充沛。');
insert into psychtestquestions(id, test_id, type, description) values (548, 3, 'YES_NO', '我的身体上有一两处麻木了。');
insert into psychtestquestions(id, test_id, type, description) values (549, 3, 'YES_NO', '我的视力和往年一样好。');
insert into psychtestquestions(id, test_id, type, description) values (550, 3, 'YES_NO', '有人控制着我的思想。');
insert into psychtestquestions(id, test_id, type, description) values (551, 3, 'YES_NO', '我喜欢小孩子。');
insert into psychtestquestions(id, test_id, type, description) values (552, 3, 'YES_NO', '有时我非常欣赏骗子的机智，我甚至希望他能侥幸混过去。');
insert into psychtestquestions(id, test_id, type, description) values (553, 3, 'YES_NO', '我时常觉得有些陌生人用挑剔的眼光盯着我。');
insert into psychtestquestions(id, test_id, type, description) values (554, 3, 'YES_NO', '我每天喝特别多水。');
insert into psychtestquestions(id, test_id, type, description) values (555, 3, 'YES_NO', '大多数人交朋友是因为朋友对他们有用。');
insert into psychtestquestions(id, test_id, type, description) values (556, 3, 'YES_NO', '我很少注意我的耳鸣。');
insert into psychtestquestions(id, test_id, type, description) values (557, 3, 'YES_NO', '通常我爱家里的人偶尔也恨他们。');
insert into psychtestquestions(id, test_id, type, description) values (558, 3, 'YES_NO', '假使我是一个新闻记者，我将很愿意报道体育新闻。');
insert into psychtestquestions(id, test_id, type, description) values (559, 3, 'YES_NO', '我确信别人正在议论我。');
insert into psychtestquestions(id, test_id, type, description) values (560, 3, 'YES_NO', '偶尔我听了下流的笑话也会发笑。');
insert into psychtestquestions(id, test_id, type, description) values (561, 3, 'YES_NO', '我独自一个人的时候，感到更快乐。');
insert into psychtestquestions(id, test_id, type, description) values (562, 3, 'YES_NO', '我害怕的事比我的朋友们少得多。');
insert into psychtestquestions(id, test_id, type, description) values (563, 3, 'YES_NO', '恶心呕吐的毛病使我苦恼。');
insert into psychtestquestions(id, test_id, type, description) values (564, 3, 'YES_NO', '当一个罪犯可以通过能言善辩的律师开脱罪责时，我对法律感到厌恶。');
insert into psychtestquestions(id, test_id, type, description) values (565, 3, 'YES_NO', '我总是在很紧张的情况下工作的。');
insert into psychtestquestions(id, test_id, type, description) values (566, 3, 'YES_NO', '在我这一生中，至少有一两次我觉得有人用催眠术指使我做了一些事。');
insert into psychtestquestions(id, test_id, type, description) values (567, 3, 'YES_NO', '我不愿意同人讲话，除非他先开口。');
insert into psychtestquestions(id, test_id, type, description) values (568, 3, 'YES_NO', '有人一直想要影响我的思想。');
insert into psychtestquestions(id, test_id, type, description) values (569, 3, 'YES_NO', '我从来没有犯过法。');
insert into psychtestquestions(id, test_id, type, description) values (570, 3, 'YES_NO', '我喜欢看《红楼梦》这一类的小说。');
insert into psychtestquestions(id, test_id, type, description) values (571, 3, 'YES_NO', '有些时候，我会无缘无故地觉得非常愉快。');
insert into psychtestquestions(id, test_id, type, description) values (572, 3, 'YES_NO', '我喜欢我不再受那种有关性方面的念头所困扰。');
insert into psychtestquestions(id, test_id, type, description) values (573, 3, 'YES_NO', '假若有几个人闯了祸，他们最好选编一套假话，而且不改口。');
insert into psychtestquestions(id, test_id, type, description) values (574, 3, 'YES_NO', '我认为我比大多数人更重感情。');
insert into psychtestquestions(id, test_id, type, description) values (575, 3, 'YES_NO', '在我的一生当中，从来没有喜欢过洋娃娃。 ');
insert into psychtestquestions(id, test_id, type, description) values (576, 3, 'YES_NO', '许多时候，生活对我来说是一件吃力的事。');
insert into psychtestquestions(id, test_id, type, description) values (577, 3, 'YES_NO', '我从来没有因为我的性方面的行为出过事。');
insert into psychtestquestions(id, test_id, type, description) values (578, 3, 'YES_NO', '对于某些事情我很敏感，以致使我不能提起。');
insert into psychtestquestions(id, test_id, type, description) values (579, 3, 'YES_NO', '在学校里，要我在班上发言，是非常困难的。');
insert into psychtestquestions(id, test_id, type, description) values (580, 3, 'YES_NO', '即使和人们在一起，我还是经常感到孤单。');
insert into psychtestquestions(id, test_id, type, description) values (581, 3, 'YES_NO', '应得的同情，我全得到了。');
insert into psychtestquestions(id, test_id, type, description) values (582, 3, 'YES_NO', '我拒绝玩那些我玩不好的游戏。');
insert into psychtestquestions(id, test_id, type, description) values (583, 3, 'YES_NO', '有时我非常想离开家。');
insert into psychtestquestions(id, test_id, type, description) values (584, 3, 'YES_NO', '我交朋友差不多和别人一样的容易。');
insert into psychtestquestions(id, test_id, type, description) values (585, 3, 'YES_NO', '我的性生活是满意的。');
insert into psychtestquestions(id, test_id, type, description) values (586, 3, 'YES_NO', '我小的时候，有一段时间我干过小偷小摸的事。 ');
insert into psychtestquestions(id, test_id, type, description) values (587, 3, 'YES_NO', '我不喜欢有人在我身旁。');
insert into psychtestquestions(id, test_id, type, description) values (588, 3, 'YES_NO', '有人不将自己的贵重物品保管好因而引起别人偷窃，这种人和小偷一样应受责备。');
insert into psychtestquestions(id, test_id, type, description) values (589, 3, 'YES_NO', '偶尔我会想到一些坏得说不出口的事。');
insert into psychtestquestions(id, test_id, type, description) values (590, 3, 'YES_NO', '我深信生活对我是残酷的。');
insert into psychtestquestions(id, test_id, type, description) values (591, 3, 'YES_NO', '我想差不多每个人，都会为了避免麻烦说点假话。');
insert into psychtestquestions(id, test_id, type, description) values (592, 3, 'YES_NO', '我比大多数人更敏感。');
insert into psychtestquestions(id, test_id, type, description) values (593, 3, 'YES_NO', '我的日常生活中，充满着使我感兴趣的事情。');
insert into psychtestquestions(id, test_id, type, description) values (594, 3, 'YES_NO', '大多数人都是内心不愿意挺身而出去帮助别人的。');
insert into psychtestquestions(id, test_id, type, description) values (595, 3, 'YES_NO', '我的梦有好些是关于性方面的事。');
insert into psychtestquestions(id, test_id, type, description) values (596, 3, 'YES_NO', '我很容易感到不知所措。');
insert into psychtestquestions(id, test_id, type, description) values (597, 3, 'YES_NO', '我为金钱和事业忧虑。');
insert into psychtestquestions(id, test_id, type, description) values (598, 3, 'YES_NO', '我曾经有过很特别、很奇怪的体验。');
insert into psychtestquestions(id, test_id, type, description) values (599, 3, 'YES_NO', '我从来没有爱上过任何人。');
insert into psychtestquestions(id, test_id, type, description) values (600, 3, 'YES_NO', '我家里有些人所做的事，使我吃惊。');
insert into psychtestquestions(id, test_id, type, description) values (601, 3, 'YES_NO', '有时我会哭一阵，笑一阵，连自己也不能控制。');
insert into psychtestquestions(id, test_id, type, description) values (602, 3, 'YES_NO', '我的母亲或父亲时常要我服从他，甚至我认为是不合理的。');
insert into psychtestquestions(id, test_id, type, description) values (603, 3, 'YES_NO', '我发现我很难把注意力集中到一件工作上。');
insert into psychtestquestions(id, test_id, type, description) values (604, 3, 'YES_NO', '我几乎从不做梦。');
insert into psychtestquestions(id, test_id, type, description) values (605, 3, 'YES_NO', '我从来没有瘫痪过，或是感到肌肉非常软弱无力。');
insert into psychtestquestions(id, test_id, type, description) values (606, 3, 'YES_NO', '假如不是别人和我作对，我一定会有更大的成就。');
insert into psychtestquestions(id, test_id, type, description) values (607, 3, 'YES_NO', '即使我没有感冒，我有时也会发不出声音或声音改变。');
insert into psychtestquestions(id, test_id, type, description) values (608, 3, 'YES_NO', '似乎没有人能了解我。');
insert into psychtestquestions(id, test_id, type, description) values (609, 3, 'YES_NO', '有时我会闻到奇怪的气味。');
insert into psychtestquestions(id, test_id, type, description) values (610, 3, 'YES_NO', '我不能专心于一件事情上。');
insert into psychtestquestions(id, test_id, type, description) values (611, 3, 'YES_NO', '我很容易对人感到不耐烦。');
insert into psychtestquestions(id, test_id, type, description) values (612, 3, 'YES_NO', '我几乎整天都在为某件事或某个人而焦虑。');
insert into psychtestquestions(id, test_id, type, description) values (613, 3, 'YES_NO', '我所操心的事，远远超过了我所应该操心的。');
insert into psychtestquestions(id, test_id, type, description) values (614, 3, 'YES_NO', '大部分时间，我觉得我还是死了的好。');
insert into psychtestquestions(id, test_id, type, description) values (615, 3, 'YES_NO', '有时我会兴奋得难以入睡。');
insert into psychtestquestions(id, test_id, type, description) values (616, 3, 'YES_NO', '有时我的听觉太灵敏了，反而使我感到烦恼。');
insert into psychtestquestions(id, test_id, type, description) values (617, 3, 'YES_NO', '听人对我所说的话，我立刻就忘记了。');
insert into psychtestquestions(id, test_id, type, description) values (618, 3, 'YES_NO', '哪怕是琐碎小事，我也再三考虑才去做。');
insert into psychtestquestions(id, test_id, type, description) values (619, 3, 'YES_NO', '有时为了避免和某些人相遇，我会绕道而行。');
insert into psychtestquestions(id, test_id, type, description) values (620, 3, 'YES_NO', '我常常觉得好像一切都不是真的。');
insert into psychtestquestions(id, test_id, type, description) values (621, 3, 'YES_NO', '我有一个习惯，喜欢数一些不重要的东西，像路上的电线杆等等。');
insert into psychtestquestions(id, test_id, type, description) values (622, 3, 'YES_NO', '我没有真正想伤害我的仇人。');
insert into psychtestquestions(id, test_id, type, description) values (623, 3, 'YES_NO', '我提防那些对我过分亲近的人。');
insert into psychtestquestions(id, test_id, type, description) values (624, 3, 'YES_NO', '我有一些奇怪和特别的念头。');
insert into psychtestquestions(id, test_id, type, description) values (625, 3, 'YES_NO', '在我独处的时候，我听到奇怪的声音。');
insert into psychtestquestions(id, test_id, type, description) values (626, 3, 'YES_NO', '当我必须短期离家出门的时候，我会感到心神不安。');
insert into psychtestquestions(id, test_id, type, description) values (627, 3, 'YES_NO', '我怕一些东西或人，虽然我明知他们是不会伤害我的。');
insert into psychtestquestions(id, test_id, type, description) values (628, 3, 'YES_NO', '如果屋子里已经有人聚在一起谈话，这时要我一个人进去，我一点也不怕。');
insert into psychtestquestions(id, test_id, type, description) values (629, 3, 'YES_NO', '我害怕使用刀子或任何尖利的东西。');
insert into psychtestquestions(id, test_id, type, description) values (630, 3, 'YES_NO', '有时我喜欢折磨我所爱的人。');
insert into psychtestquestions(id, test_id, type, description) values (631, 3, 'YES_NO', '我似乎比别人更难于集中注意力。');
insert into psychtestquestions(id, test_id, type, description) values (632, 3, 'YES_NO', '有好几次我放弃正在做的事，因为我感觉自己的能力太差了。');
insert into psychtestquestions(id, test_id, type, description) values (633, 3, 'YES_NO', '我脑子里常常出现一些坏的可怕的字眼，却又无法摆脱它们。');
insert into psychtestquestions(id, test_id, type, description) values (634, 3, 'YES_NO', '有时一些无关紧要的念头缠着我，使我好多天都感到不安。');
insert into psychtestquestions(id, test_id, type, description) values (635, 3, 'YES_NO', '几乎每天都有使我害怕的事发生。');
insert into psychtestquestions(id, test_id, type, description) values (636, 3, 'YES_NO', '我总是将事情看得严重些。');
insert into psychtestquestions(id, test_id, type, description) values (637, 3, 'YES_NO', '我比大多数人更敏感。');
insert into psychtestquestions(id, test_id, type, description) values (638, 3, 'YES_NO', '有时我喜欢受到我心爱的人的折磨。');
insert into psychtestquestions(id, test_id, type, description) values (639, 3, 'YES_NO', '有人用侮辱性和下流的话议论我。');
insert into psychtestquestions(id, test_id, type, description) values (640, 3, 'YES_NO', '我呆在屋里总感到不安。');
insert into psychtestquestions(id, test_id, type, description) values (641, 3, 'YES_NO', '即使和人们在一起，我仍经常感到孤单。');
insert into psychtestquestions(id, test_id, type, description) values (642, 3, 'YES_NO', '我并不是特别害羞拘谨。');
insert into psychtestquestions(id, test_id, type, description) values (643, 3, 'YES_NO', '有时我的头脑似乎比平时迟钝。');
insert into psychtestquestions(id, test_id, type, description) values (644, 3, 'YES_NO', '在社交场合，我多半是一个人坐着，或者只跟另一个人坐在一起，而不到人群里去。');
insert into psychtestquestions(id, test_id, type, description) values (645, 3, 'YES_NO', '人们常使我失望。');
insert into psychtestquestions(id, test_id, type, description) values (646, 3, 'YES_NO', '我很喜欢参加舞会。');
insert into psychtestquestions(id, test_id, type, description) values (647, 3, 'YES_NO', '有时我常感到困难重重，无法克服。');
insert into psychtestquestions(id, test_id, type, description) values (648, 3, 'YES_NO', '我常想：“我要能再成为一个孩子就好了。”');
insert into psychtestquestions(id, test_id, type, description) values (649, 3, 'YES_NO', '如果给我机会，我一定能做些对世界大有益处的事。');
insert into psychtestquestions(id, test_id, type, description) values (650, 3, 'YES_NO', '我时常遇见一些所谓的专家，他们并不比我高明。');
insert into psychtestquestions(id, test_id, type, description) values (651, 3, 'YES_NO', '当我听说我所熟悉的人成功了，我就觉得自己失败了。');
insert into psychtestquestions(id, test_id, type, description) values (652, 3, 'YES_NO', '如果有机会，我一定能成为一个人民的好领袖。');
insert into psychtestquestions(id, test_id, type, description) values (653, 3, 'YES_NO', '下流的故事使我感到不好意思。');
insert into psychtestquestions(id, test_id, type, description) values (654, 3, 'YES_NO', '一般来说人们要求别人尊重他们的权利比较多，而他们却很少尊重别人的权利。');
insert into psychtestquestions(id, test_id, type, description) values (655, 3, 'YES_NO', '我总想把好的故事记住，讲给别人听。');
insert into psychtestquestions(id, test_id, type, description) values (656, 3, 'YES_NO', '我喜欢搞输赢不大的赌博。');
insert into psychtestquestions(id, test_id, type, description) values (657, 3, 'YES_NO', '为了可以和人们在一起，我喜欢社交活动。');
insert into psychtestquestions(id, test_id, type, description) values (658, 3, 'YES_NO', '我喜欢人多热闹的场合。');
insert into psychtestquestions(id, test_id, type, description) values (659, 3, 'YES_NO', '当我和一群活泼的朋友在一起的时候，我的烦恼就消失了。');
insert into psychtestquestions(id, test_id, type, description) values (660, 3, 'YES_NO', '当人们说我班级人的闲话时，我从来不参与。');
insert into psychtestquestions(id, test_id, type, description) values (661, 3, 'YES_NO', '只要我开始做一件事，就很难放下，哪怕是暂时的。');
insert into psychtestquestions(id, test_id, type, description) values (662, 3, 'YES_NO', '我的小便不困难，也不难控制。');
insert into psychtestquestions(id, test_id, type, description) values (663, 3, 'YES_NO', '我常发现别人妒忌我的好主意，因为他们没能先想到。');
insert into psychtestquestions(id, test_id, type, description) values (664, 3, 'YES_NO', '只要有可能，我就避开人群。');
insert into psychtestquestions(id, test_id, type, description) values (665, 3, 'YES_NO', '我不怕见生人。');
insert into psychtestquestions(id, test_id, type, description) values (666, 3, 'YES_NO', '记得我曾经为了不想做某件事而装过病。');
insert into psychtestquestions(id, test_id, type, description) values (667, 3, 'YES_NO', '在火车和公共汽车上，我常跟陌生人交谈。');
insert into psychtestquestions(id, test_id, type, description) values (668, 3, 'YES_NO', '当事情不顺利的时候，我就想立即放弃。');
insert into psychtestquestions(id, test_id, type, description) values (669, 3, 'YES_NO', '我不愿意让人家知道我对于事物的态度。');
insert into psychtestquestions(id, test_id, type, description) values (670, 3, 'YES_NO', '有些时间，我感到劲头十足，以至一连好几天都不需要睡觉。');
insert into psychtestquestions(id, test_id, type, description) values (671, 3, 'YES_NO', '在人群中，如果叫我带头发言，或对我所熟悉的事情发表意见，我并不感到不好意思。');
insert into psychtestquestions(id, test_id, type, description) values (672, 3, 'YES_NO', '我喜欢聚会和社交活动。');
insert into psychtestquestions(id, test_id, type, description) values (673, 3, 'YES_NO', '面对困难或危险的时候，我总退缩不前。');
insert into psychtestquestions(id, test_id, type, description) values (674, 3, 'YES_NO', '我原来想做的事，假若别人认为不值得做，我很容易放弃。');






-- 爱德华个人偏好测验（EPPS）
-- 指导语：对于每道题的Ａ、Ｂ应当根据你当前的喜欢、倾向与感觉来选择，而不是你认为应该喜欢什么或怎样感觉，而且只能选择其一，假如二个你都有，请选择强度最大，最能反映你特征的一个答案，
-- 假如二个都没有正确描述你的感觉，那你应当选你认为比较正确的。
-- 题目内容（共225题）： 

insert into psychtestquestions(id, test_id, type, description) values(675, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(562, 675, '当我的朋友有麻烦时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, description) values(563, 675, '对我所承担的一切事情，我都喜欢尽我最大的努力去做');


insert into psychtestquestions(id, test_id, type, description) values(676, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(564, 676, '我喜欢探求伟人对我所感兴趣的各种问题有什么看法');
insert into psychtestquestionoptions(id, question_id, description) values(565, 676, '我喜欢完成具有重大意义的事情');


insert into psychtestquestions(id, test_id, type, description) values(677, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(566, 677, '我喜欢我写的所有的东西都很精确、清楚、有条有理');
insert into psychtestquestionoptions(id, question_id, description) values(567, 677, '我喜欢在某些职业、专业或专门项目上自己是公认的权威');


insert into psychtestquestions(id, test_id, type, description) values(678, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(568, 678, '我喜欢在宴会上讲些趣事与笑话');
insert into psychtestquestionoptions(id, question_id, description) values(569, 678, '我喜欢写本伟大的小说或剧本');


insert into psychtestquestions(id, test_id, type, description) values(679, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(570, 679, '我喜欢我能随我的意志来去自如');
insert into psychtestquestionoptions(id, question_id, description) values(571, 679, '我喜欢能够自豪地说我将一件难题成功地处理了');


insert into psychtestquestions(id, test_id, type, description) values(680, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(572, 680, '我喜欢解答其他人觉得很困难的谜语与问题');
insert into psychtestquestionoptions(id, question_id, description) values(573, 680, '我喜欢遵从指示去做人家期待我做的事');


insert into psychtestquestions(id, test_id, type, description) values(681, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(574, 681, '我喜欢在日常生活中体验到新奇与改变');
insert into psychtestquestionoptions(id, question_id, description) values(575, 681, '当我认为我的上级做得对时，我喜欢对他表示我的看法');


insert into psychtestquestions(id, test_id, type, description) values(682, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(576, 682, '对我所承担的任何工作，我喜欢对其细节作好计划与组织');
insert into psychtestquestionoptions(id, question_id, description) values(577, 682, '我喜欢遵从指示做我所该做的事');


insert into psychtestquestions(id, test_id, type, description) values(683, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(578, 683, '在公共场合中，我喜欢人们注意和评价我的外表');
insert into psychtestquestionoptions(id, question_id, description) values(579, 683, '我喜欢读伟人的故事');


insert into psychtestquestions(id, test_id, type, description) values(684, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(580, 684, '我喜欢回避要我按照例行方法办事的场合');
insert into psychtestquestionoptions(id, question_id, description) values(581, 684, '我喜欢读伟人的故事');


insert into psychtestquestions(id, test_id, type, description) values(685, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(582, 685, '我喜欢在某些职业、专业或专门项目上自己是个公认的权威');
insert into psychtestquestionoptions(id, question_id, description) values(583, 685, '我喜欢在工作开始之前对工作做好组织和计划');


insert into psychtestquestions(id, test_id, type, description) values(686, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(584, 686, '我喜欢探求伟人对我所感兴趣的各种问题的看法');
insert into psychtestquestionoptions(id, question_id, description) values(585, 686, '假如我必须旅行时，我喜欢把事情事先安排好');


insert into psychtestquestions(id, test_id, type, description) values(687, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(586, 687, '我喜欢将我开了头的工作或任务完成');
insert into psychtestquestionoptions(id, question_id, description) values(587, 687, '我喜欢保持我的书桌或工作间的清洁与整齐');


insert into psychtestquestions(id, test_id, type, description) values(688, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(588, 688, '我喜欢告诉别人我所经历的冒险与奇特的事情');
insert into psychtestquestionoptions(id, question_id, description) values(589, 688, '我喜欢饮食有规律，并且有固定时间吃东西');


insert into psychtestquestions(id, test_id, type, description) values(689, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(590, 689, '我喜欢独立决定我所要做的事');
insert into psychtestquestionoptions(id, question_id, description) values(591, 689, '我喜欢保持我的书桌或工作间的清洁与整齐');


insert into psychtestquestions(id, test_id, type, description) values(690, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(592, 690, '我喜欢比其他人做得更好');
insert into psychtestquestionoptions(id, question_id, description) values(593, 690, '我喜欢在宴会上讲些趣闻与笑话');


insert into psychtestquestions(id, test_id, type, description) values(691, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(594, 691, '我喜欢遵从习俗，并避免做我所尊敬的人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, description) values(595, 691, '我喜欢谈我的成就');


insert into psychtestquestions(id, test_id, type, description) values(692, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(596, 692, '我喜欢我的生活安排好，过得顺利，而不用对我的计划作太多改变');
insert into psychtestquestionoptions(id, question_id, description) values(597, 692, '我喜欢告诉别人我所经历的冒险与奇特的事情');


insert into psychtestquestions(id, test_id, type, description) values(693, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(598, 693, '我喜欢阅读以性为主的书与剧本');
insert into psychtestquestionoptions(id, question_id, description) values(599, 693, '我喜欢在团体中成为众目所瞩的对象');


insert into psychtestquestions(id, test_id, type, description) values(694, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(600, 694, '我喜欢批判权威人士');
insert into psychtestquestionoptions(id, question_id, description) values(601, 694, '我喜欢用别人不懂其意义的字眼');


insert into psychtestquestions(id, test_id, type, description) values(695, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(602, 695, '我喜欢完成其他人认为需要技巧和努力的工作');
insert into psychtestquestionoptions(id, question_id, description) values(603, 695, '我喜欢能随我的意志来去自如');


insert into psychtestquestions(id, test_id, type, description) values(696, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(604, 696, '我喜欢称赞我所崇拜的人');
insert into psychtestquestionoptions(id, question_id, description) values(605, 696, '我喜欢很自如地做我想做的事');


insert into psychtestquestions(id, test_id, type, description) values(697, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(606, 697, '我喜欢将我的信、帐单和其他文件整齐地排列着并以某种系统存档');
insert into psychtestquestionoptions(id, question_id, description) values(607, 697, '我希望独立决定我要做的事');


insert into psychtestquestions(id, test_id, type, description) values(698, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(608, 698, '我喜欢提出明知没有人能回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, description) values(609, 698, '我喜欢批判权威人士');


insert into psychtestquestions(id, test_id, type, description) values(699, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(610, 699, '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, description) values(611, 699, '我喜欢回避责任与义务');


insert into psychtestquestions(id, test_id, type, description) values(700, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(612, 700, '我喜欢将所承担的事办成功');
insert into psychtestquestionoptions(id, question_id, description) values(613, 700, '我喜欢结交新朋友');


insert into psychtestquestions(id, test_id, type, description) values(701, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(614, 701, '我喜欢遵照指示去做我所该做的事');
insert into psychtestquestionoptions(id, question_id, description) values(615, 701, '我喜欢与朋友有深厚的友谊');


insert into psychtestquestions(id, test_id, type, description) values(702, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(616, 702, '我喜欢我写的所有东西都很精确、清楚、有条有理');
insert into psychtestquestionoptions(id, question_id, description) values(617, 702, '我喜欢广交朋友');


insert into psychtestquestions(id, test_id, type, description) values(703, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(618, 703, '我喜欢在宴会中说趣闻与笑话');
insert into psychtestquestionoptions(id, question_id, description) values(619, 703, '我喜欢写信给我的朋友');


insert into psychtestquestions(id, test_id, type, description) values(704, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(620, 704, '我喜欢能随我的意志来去自如');
insert into psychtestquestionoptions(id, question_id, description) values(621, 704, '我喜欢与朋友分享一切');


insert into psychtestquestions(id, test_id, type, description) values(705, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(622, 705, '我喜欢解答别人认为困难的谜语与问题');
insert into psychtestquestionoptions(id, question_id, description) values(623, 705, '我喜欢就一个人为什么那样做去判断他，而不从他实际上做什么去判断他');


insert into psychtestquestions(id, test_id, type, description) values(706, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(624, 706, '我喜欢接受我所崇拜的人领导');
insert into psychtestquestionoptions(id, question_id, description) values(625, 706, '我喜欢了解我的朋友们对他们所面对的各种问题怎样感觉');


insert into psychtestquestions(id, test_id, type, description) values(707, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(626, 707, '我喜欢饮食有规律，并且在固定时间吃东西');
insert into psychtestquestionoptions(id, question_id, description) values(627, 707, '我喜欢研究与分析别人的行为');


insert into psychtestquestions(id, test_id, type, description) values(708, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(628, 708, '我喜欢说别人认为机智与聪明的事');
insert into psychtestquestionoptions(id, question_id, description) values(629, 708, '我喜欢将自己放在别人的立场上，看自己若处在相同的情境会有什么感觉');


insert into psychtestquestions(id, test_id, type, description) values(709, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(630, 709, '我喜欢照我的意思做我想做的事');
insert into psychtestquestionoptions(id, question_id, description) values(631, 709, '我喜欢观察其他人在某个场合的感觉');


insert into psychtestquestions(id, test_id, type, description) values(710, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(632, 710, '我喜欢完成别人认为需要技巧和努力的工作');
insert into psychtestquestionoptions(id, question_id, description) values(633, 710, '我喜欢在我失败时朋友们能鼓励我');


insert into psychtestquestions(id, test_id, type, description) values(711, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(634, 711, '作计划时，我喜欢从其见解为我所尊重的人那里获得些建议');
insert into psychtestquestionoptions(id, question_id, description) values(635, 711, '我喜欢我的朋友对我仁慈');


insert into psychtestquestions(id, test_id, type, description) values(712, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(636, 712, '我喜欢我的朋友的生活安排得好，过得顺利，而不用我的计划作太多的改变');
insert into psychtestquestionoptions(id, question_id, description) values(637, 712, '当我生病时，我喜欢我的朋友感到不安');


insert into psychtestquestions(id, test_id, type, description) values(713, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(638, 713, '我喜欢在团体中成为众目所瞩的对象');
insert into psychtestquestionoptions(id, question_id, description) values(639, 713, '当我受伤或生病时，我喜欢我的朋友为此小题大作');


insert into psychtestquestions(id, test_id, type, description) values(714, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(640, 714, '我喜欢回避要我按照例行方式办事的场合');
insert into psychtestquestionoptions(id, question_id, description) values(641, 714, '当我沮丧时，我喜欢我的朋友们同情我并使我愉快');


insert into psychtestquestions(id, test_id, type, description) values(715, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(642, 715, '我想写一本伟大的小说或剧本');
insert into psychtestquestionoptions(id, question_id, description) values(643, 715, '当作为群众团体的一个成员时，我喜欢被指定或选为领导者');


insert into psychtestquestions(id, test_id, type, description) values(716, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(644, 716, '在团体中，我喜欢接受别人的领导来决定团体该作什么');
insert into psychtestquestionoptions(id, question_id, description) values(645, 716, '只要可能，我喜欢监督与指导别人的行动');


insert into psychtestquestions(id, test_id, type, description) values(717, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(646, 717, '我喜欢将我的信、帐单和其他文件整齐地排列着并以某种系统存档');
insert into psychtestquestionoptions(id, question_id, description) values(647, 717, '我喜欢成为我所属的机构与团体的领导之一');


insert into psychtestquestions(id, test_id, type, description) values(718, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(648, 718, '我喜欢问些明知别人回答不出来的问题');
insert into psychtestquestionoptions(id, question_id, description) values(649, 718, '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, test_id, type, description) values(719, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(650, 719, '我喜欢逃避责任与义务');
insert into psychtestquestionoptions(id, question_id, description) values(651, 719, '我喜欢被人们叫去做和事佬');


insert into psychtestquestions(id, test_id, type, description) values(720, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(652, 720, '我喜欢在某种职业、专业或专门项目上成为公认的权威');
insert into psychtestquestionoptions(id, question_id, description) values(653, 720, '每当我做错了事，我感到有罪恶感');


insert into psychtestquestions(id, test_id, type, description) values(721, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(654, 721, '我喜欢读伟人的故事');
insert into psychtestquestionoptions(id, question_id, description) values(655, 721, '我觉得我必须承认我所做的一些错事');


insert into psychtestquestions(id, test_id, type, description) values(722, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(656, 722, '对我所承担的任何工作，我喜欢对其细节作好计划与组织');
insert into psychtestquestionoptions(id, question_id, description) values(657, 722, '当事情不顺时，我感到我比任何人更该受到责备');


insert into psychtestquestions(id, test_id, type, description) values(723, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(658, 723, '我喜欢用些别人常常不明白其意义的字眼');
insert into psychtestquestionoptions(id, question_id, description) values(659, 723, '我觉得样样不如人');


insert into psychtestquestions(id, test_id, type, description) values(724, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(660, 724, '我喜欢批评权威人士');
insert into psychtestquestionoptions(id, question_id, description) values(661, 724, '在我认为是我上司的人面前，我感到胆怯');


insert into psychtestquestions(id, test_id, type, description) values(725, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(662, 725, '对我所承担的一切事情，我喜欢尽力而为');
insert into psychtestquestionoptions(id, question_id, description) values(663, 725, '我喜欢帮助比我不幸的人');


insert into psychtestquestions(id, test_id, type, description) values(726, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(664, 726, '我喜欢探求伟人们对我所感兴趣的各种问题有什么看法');
insert into psychtestquestionoptions(id, question_id, description) values(665, 726, '我喜欢对朋友们慷慨');


insert into psychtestquestions(id, test_id, type, description) values(727, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(666, 727, '在处理难题时，我喜欢在开始之前作计划');
insert into psychtestquestionoptions(id, question_id, description) values(667, 727, '我喜欢为我的朋友做点小事');


insert into psychtestquestions(id, test_id, type, description) values(728, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(668, 728, '我喜欢对别人谈我所经历的冒险与奇特的事');
insert into psychtestquestionoptions(id, question_id, description) values(669, 728, '我喜欢我的朋友信任我，并对我倾诉他们的麻烦');


insert into psychtestquestions(id, test_id, type, description) values(729, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(670, 729, '我喜欢发表我对事情的看法');
insert into psychtestquestionoptions(id, question_id, description) values(671, 729, '我喜欢原谅有时可能伤害了我的朋友');


insert into psychtestquestions(id, test_id, type, description) values(730, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(672, 730, '我喜欢自己能比其他人做得更好');
insert into psychtestquestionoptions(id, question_id, description) values(673, 730, '我喜欢在新奇的餐厅里吃饭');


insert into psychtestquestions(id, test_id, type, description) values(731, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(674, 731, '我喜欢遵从习俗避免做我所尊敬的人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, description) values(675, 731, '我喜欢追求时髦');


insert into psychtestquestions(id, test_id, type, description) values(732, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(676, 732, '在开始工作之前，我喜欢对它做好组织与计划');
insert into psychtestquestionoptions(id, question_id, description) values(677, 732, '我喜欢旅行和到处观光');


insert into psychtestquestions(id, test_id, type, description) values(733, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(678, 733, '在公共场合，我喜欢人们注意和评价我的外表');
insert into psychtestquestionoptions(id, question_id, description) values(679, 733, '我喜欢搬家，住在不同的地方');


insert into psychtestquestions(id, test_id, type, description) values(734, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(680, 734, '我喜欢独立决定我所要做的事');
insert into psychtestquestionoptions(id, question_id, description) values(681, 734, '我喜欢做些新鲜且有变化的事');


insert into psychtestquestions(id, test_id, type, description) values(735, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(682, 735, '我喜欢我能自豪地说我解决了一个难题');
insert into psychtestquestionoptions(id, question_id, description) values(683, 735, '对我所承担的事，我喜欢认真去做');


insert into psychtestquestions(id, test_id, type, description) values(736, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(684, 736, '当我认为我的上司做得对时，我喜欢对他们表示我的看法');
insert into psychtestquestionoptions(id, question_id, description) values(685, 736, '我喜欢在接受其他事之前完成手头的事');


insert into psychtestquestions(id, test_id, type, description) values(737, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(686, 737, '假如我必须旅行时，我喜欢事先计划好');
insert into psychtestquestionoptions(id, question_id, description) values(687, 737, '我喜欢继续解我的难题或问题，直到解决为止');


insert into psychtestquestions(id, test_id, type, description) values(738, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(688, 738, '我有时喜欢做些事，只为了想看别人对此事的反应');
insert into psychtestquestionoptions(id, question_id, description) values(689, 738, '我喜欢固定在某一职业或问题上，甚至看来它好象没有什么希望');


insert into psychtestquestions(id, test_id, type, description) values(739, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(690, 739, '我喜欢做别人认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, description) values(691, 739, '我喜欢不受干扰地长时间工作');


insert into psychtestquestions(id, test_id, type, description) values(740, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(692, 740, '我喜欢完成具有重大意义的事');
insert into psychtestquestionoptions(id, question_id, description) values(693, 740, '我不在乎与迷人的异性表示亲近');


insert into psychtestquestions(id, test_id, type, description) values(741, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(694, 741, '我喜欢称赞我所崇拜的人');
insert into psychtestquestionoptions(id, question_id, description) values(695, 741, '我喜欢被异性认为身材吸引人');


insert into psychtestquestions(id, test_id, type, description) values(742, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(696, 742, '我喜欢保持我的书桌与工作间的清洁与整齐');
insert into psychtestquestionoptions(id, question_id, description) values(697, 742, '我喜欢与异性谈情说爱');


insert into psychtestquestions(id, test_id, type, description) values(743, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(698, 743, '我喜欢谈我的成就');
insert into psychtestquestionoptions(id, question_id, description) values(699, 743, '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, test_id, type, description) values(744, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(700, 744, '我喜欢依我的方式做事而不在乎别人的看法');
insert into psychtestquestionoptions(id, question_id, description) values(701, 744, '我喜欢看以性为主的书或剧本');


insert into psychtestquestions(id, test_id, type, description) values(745, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(702, 745, '我喜欢写本伟大的小说或剧本');
insert into psychtestquestionoptions(id, question_id, description) values(703, 745, '我喜欢考虑与我看法相反的观点');


insert into psychtestquestions(id, test_id, type, description) values(746, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(704, 746, '在团体中我喜欢接受别人的领导来决定团体该做什么');
insert into psychtestquestionoptions(id, question_id, description) values(705, 746, '假如某人罪有应得的话我想公开的进行批评');


insert into psychtestquestions(id, test_id, type, description) values(747, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(706, 747, '我喜欢我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');
insert into psychtestquestionoptions(id, question_id, description) values(707, 747, '当我动怒时，我想摔东西');


insert into psychtestquestions(id, test_id, type, description) values(748, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(708, 748, '我喜欢问些没有人能回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, description) values(709, 748, '我喜欢对别人说我对他们的看法');


insert into psychtestquestions(id, test_id, type, description) values(749, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(710, 749, '我喜欢回避责任与义务');
insert into psychtestquestionoptions(id, question_id, description) values(711, 749, '我想取笑那些我认为他们行为愚蠢的人');


insert into psychtestquestions(id, test_id, type, description) values(750, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(712, 750, '我喜欢对我的朋友忠实');
insert into psychtestquestionoptions(id, question_id, description) values(713, 750, '对所有我承担的事，我喜欢尽力做好');


insert into psychtestquestions(id, test_id, type, description) values(751, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(714, 751, '我喜欢观察别人在某些情况下的感觉');
insert into psychtestquestionoptions(id, question_id, description) values(715, 751, '我喜欢我能自豪地说我成功地解决了一件难题');


insert into psychtestquestions(id, test_id, type, description) values(752, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(716, 752, '当我失败时，我喜欢我的朋友鼓励我');
insert into psychtestquestionoptions(id, question_id, description) values(717, 752, '我喜欢将所承担的事做得很成功');


insert into psychtestquestions(id, test_id, type, description) values(753, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(718, 753, '我喜欢成为所属机构与团体的领导之一');
insert into psychtestquestionoptions(id, question_id, description) values(719, 753, '我喜欢能比别人做得更好');


insert into psychtestquestions(id, test_id, type, description) values(754, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(720, 754, '我喜欢当发生差错时，我觉得我比别人更该受到责备');
insert into psychtestquestionoptions(id, question_id, description) values(721, 754, '我喜欢解答别人认为困难的谜语和问题');


insert into psychtestquestions(id, test_id, type, description) values(755, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(722, 755, '我喜欢为我的朋友做事');
insert into psychtestquestionoptions(id, question_id, description) values(723, 755, '作计划时，我喜欢从其见解为我所尊敬的人那里得到些建议');


insert into psychtestquestions(id, test_id, type, description) values(756, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(724, 756, '我喜欢将自己放在别人的处境上，去想象在同样的情况下也会有什么感觉');
insert into psychtestquestionoptions(id, question_id, description) values(725, 756, '当我认为上司做得对时，我喜欢对他们表示我的看法');


insert into psychtestquestions(id, test_id, type, description) values(757, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(726, 757, '当我有问题时，我喜欢我的朋友能同情与了解');
insert into psychtestquestionoptions(id, question_id, description) values(727, 757, '我喜欢接受我所尊敬的人领导');


insert into psychtestquestions(id, test_id, type, description) values(758, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(728, 758, '在群众团体中，我喜欢被指定或选为领导者');
insert into psychtestquestionoptions(id, question_id, description) values(729, 758, '在团体中，我喜欢接受别人的领导来决定团体该怎么做');


insert into psychtestquestions(id, test_id, type, description) values(759, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(730, 759, '假如我作错了事，我觉得应该受处罚');
insert into psychtestquestionoptions(id, question_id, description) values(731, 759, '我喜欢遵从习俗，避免做我所尊敬的人认为不合常规的事');


insert into psychtestquestions(id, test_id, type, description) values(760, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(732, 760, '我喜欢与朋友分享一切');
insert into psychtestquestionoptions(id, question_id, description) values(733, 760, '在开始做困难的事情之前，我喜欢先做计划');


insert into psychtestquestions(id, test_id, type, description) values(761, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(734, 761, '我喜欢了解我的朋友在面临各种问题时的感觉');
insert into psychtestquestionoptions(id, question_id, description) values(735, 761, '假如我必须旅行时，我喜欢事先将事情安排好');


insert into psychtestquestions(id, test_id, type, description) values(762, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(736, 762, '我喜欢我的朋友对我仁慈');
insert into psychtestquestionoptions(id, question_id, description) values(737, 762, '在开始之前，我喜欢将工作组织与计划好');


insert into psychtestquestions(id, test_id, type, description) values(763, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(738, 763, '我喜欢被别人看作领导');
insert into psychtestquestionoptions(id, question_id, description) values(739, 763, '我喜欢将我的信件、帐单与其他文件整齐地排列着并依某种系统存档');


insert into psychtestquestions(id, test_id, type, description) values(764, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(740, 764, '我感到我所受的痛苦与折磨对我而言是好处多于坏处');
insert into psychtestquestionoptions(id, question_id, description) values(741, 764, '我喜欢将我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');


insert into psychtestquestions(id, test_id, type, description) values(765, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(742, 765, '我喜欢与我的朋友有深厚的交情');
insert into psychtestquestionoptions(id, question_id, description) values(743, 765, '我喜欢说些别人认为机智与聪明的事');


insert into psychtestquestions(id, test_id, type, description) values(766, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(744, 766, '我喜欢观察我的朋友们的性格并尝试找出使他们成为这样的原因');
insert into psychtestquestionoptions(id, question_id, description) values(745, 766, '我有时喜欢做些事，只为了想看别人对它的反应');


insert into psychtestquestions(id, test_id, type, description) values(767, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(746, 767, '当我受伤或生病时，我喜欢我的朋友们小题大作');
insert into psychtestquestionoptions(id, question_id, description) values(747, 767, '我喜欢谈我的成就');


insert into psychtestquestions(id, test_id, type, description) values(768, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(748, 768, '我喜欢告诉别人该怎么做他们的工作');
insert into psychtestquestionoptions(id, question_id, description) values(749, 768, '我喜欢成为团体中众目所瞩的对象');


insert into psychtestquestions(id, test_id, type, description) values(769, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(750, 769, '在所认定的强者面前我感到胆怯');
insert into psychtestquestionoptions(id, question_id, description) values(751, 769, '我喜欢用些别人不懂其意义的字眼');


insert into psychtestquestions(id, test_id, type, description) values(770, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(752, 770, '我比较喜欢与朋友共事而不喜欢独自工作');
insert into psychtestquestionoptions(id, question_id, description) values(753, 770, '我喜欢表达我对事情的看法');


insert into psychtestquestions(id, test_id, type, description) values(771, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(754, 771, '我喜欢研究与分析他人的行为');
insert into psychtestquestionoptions(id, question_id, description) values(755, 771, '我喜欢做些别人认为不合常规的事');


insert into psychtestquestions(id, test_id, type, description) values(772, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(756, 772, '当我生病时，我喜欢朋友们为我感伤');
insert into psychtestquestionoptions(id, question_id, description) values(757, 772, '我喜欢避免需要依常规做事的场合');


insert into psychtestquestions(id, test_id, type, description) values(773, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(758, 773, '只要可能，我喜欢监督与指导别人的行为');
insert into psychtestquestionoptions(id, question_id, description) values(759, 773, '我喜欢依我的方式做事而不在乎别人的看法');


insert into psychtestquestions(id, test_id, type, description) values(774, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(760, 774, '我觉得我处处不如人');
insert into psychtestquestionoptions(id, question_id, description) values(761, 774, '我喜欢回避责任与义务');


insert into psychtestquestions(id, test_id, type, description) values(775, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(762, 775, '我喜欢将我所承担的事办成功');
insert into psychtestquestionoptions(id, question_id, description) values(763, 775, '我喜欢结交新朋友');


insert into psychtestquestions(id, test_id, type, description) values(776, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(764, 776, '我喜欢分析我自己的动机与感情');
insert into psychtestquestionoptions(id, question_id, description) values(765, 776, '我喜欢广交朋友');


insert into psychtestquestions(id, test_id, type, description) values(777, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(766, 777, '当我有困难时，我喜欢我的朋友帮助我');
insert into psychtestquestionoptions(id, question_id, description) values(767, 777, '我喜欢为我的朋友做事');


insert into psychtestquestions(id, test_id, type, description) values(778, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(768, 778, '当我的观点被冲击时，我喜欢为之辩护');
insert into psychtestquestionoptions(id, question_id, description) values(769, 778, '我喜欢写信给我的朋友');


insert into psychtestquestions(id, test_id, type, description) values(779, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(770, 779, '每当我做错事时，我感到内疚');
insert into psychtestquestionoptions(id, question_id, description) values(771, 779, '我喜欢与朋友有深交');


insert into psychtestquestions(id, test_id, type, description) values(780, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(772, 780, '我喜欢与朋友分享一切');
insert into psychtestquestionoptions(id, question_id, description) values(773, 780, '我喜欢分析我自己的动机与情感');


insert into psychtestquestions(id, test_id, type, description) values(781, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(774, 781, '我喜欢接受我所尊敬的人的领导');
insert into psychtestquestionoptions(id, question_id, description) values(775, 781, '我喜欢了解我的朋友在面临各种问题时的感觉');


insert into psychtestquestions(id, test_id, type, description) values(782, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(776, 782, '我喜欢我的朋友们高兴地为我办些小事');
insert into psychtestquestionoptions(id, question_id, description) values(777, 782, '我喜欢从人们为什么那样做而不从他实际做什么来判断人');


insert into psychtestquestions(id, test_id, type, description) values(783, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(778, 783, '大家在一起时，我喜欢决定我们该做什么');
insert into psychtestquestionoptions(id, question_id, description) values(779, 783, '我喜欢预测我的朋友们在各种情况下的反应');


insert into psychtestquestions(id, test_id, type, description) values(784, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(780, 784, '当我退让或避免了冲突时，我觉得比争取达到目标时还好些');
insert into psychtestquestionoptions(id, question_id, description) values(781, 784, '我喜欢分析他人的感情与动机');


insert into psychtestquestions(id, test_id, type, description) values(785, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(782, 785, '我喜欢结交新朋友');
insert into psychtestquestionoptions(id, question_id, description) values(783, 785, '当我有麻烦时，我喜欢我的朋友帮助我');


insert into psychtestquestions(id, test_id, type, description) values(786, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(784, 786, '我喜欢从人们为什么那样做而不从他实际做什么来判断人');
insert into psychtestquestionoptions(id, question_id, description) values(785, 786, '我喜欢我的朋友们对我有深情');


insert into psychtestquestions(id, test_id, type, description) values(787, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(786, 787, '我喜欢将我的生活安排得好，过得顺利，而不用对我的计划做太多的改变');
insert into psychtestquestionoptions(id, question_id, description) values(787, 787, '当我生病时，我喜欢朋友们为我感伤');


insert into psychtestquestions(id, test_id, type, description) values(788, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(788, 788, '我喜欢被人叫做和事佬');
insert into psychtestquestionoptions(id, question_id, description) values(789, 788, '我喜欢我的朋友高兴地为我办点小事');


insert into psychtestquestions(id, test_id, type, description) values(789, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(790, 789, '我觉得我必须承认自己做错了的事');
insert into psychtestquestionoptions(id, question_id, description) values(791, 789, '当我沮丧时，我喜欢我的朋友们同情我，并使我愉快');


insert into psychtestquestions(id, test_id, type, description) values(790, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(792, 790, '我喜欢与朋友们共事而不喜欢独自进行工作');
insert into psychtestquestionoptions(id, question_id, description) values(793, 790, '当我的观点被攻击时，我喜欢为之辩护');


insert into psychtestquestions(id, test_id, type, description) values(791, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(794, 791, '我喜欢观察我的朋友们的性格，试着找出究竟是什么缘故使他们成为现在这样');
insert into psychtestquestionoptions(id, question_id, description) values(795, 791, '我喜欢能说服与影响其他人去做他们的工作');


insert into psychtestquestions(id, test_id, type, description) values(792, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(796, 792, '当我沮丧时，我喜欢我的朋友们同情我，并使我愉快');
insert into psychtestquestionoptions(id, question_id, description) values(797, 792, '在团体中，我喜欢决定我们该做什么');


insert into psychtestquestions(id, test_id, type, description) values(793, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(798, 793, '我喜欢问明知没有人回答得出来的问题');
insert into psychtestquestionoptions(id, question_id, description) values(799, 793, '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, test_id, type, description) values(794, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(800, 794, '在我所认定的强者面前，我感到胆怯');
insert into psychtestquestionoptions(id, question_id, description) values(801, 794, '只要我能够的话，我喜欢监督与指导别人的行动');


insert into psychtestquestions(id, test_id, type, description) values(795, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(802, 795, '我喜欢加入一个成员之间彼此温暖与友善的团体');
insert into psychtestquestionoptions(id, question_id, description) values(803, 795, '我知道自己做错了些事时会感到内疚');


insert into psychtestquestions(id, test_id, type, description) values(796, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(804, 796, '我喜欢分析别人的感情与动机');
insert into psychtestquestionoptions(id, question_id, description) values(805, 796, '由于自己无能力处理各种情况使我感到沮丧');


insert into psychtestquestions(id, test_id, type, description) values(797, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(806, 797, '当我生病时，我喜欢朋友们为我感伤');
insert into psychtestquestionoptions(id, question_id, description) values(807, 797, '当我退让或避免争执时，我感到比争取达到目的时还好些');


insert into psychtestquestions(id, test_id, type, description) values(798, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(808, 798, '我喜欢我能够说服与影响他人做我想做的事');
insert into psychtestquestionoptions(id, question_id, description) values(809, 798, '由于自己无能力处理各种情况使我感到沮丧');


insert into psychtestquestions(id, test_id, type, description) values(799, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(810, 799, '我喜欢批评权威人士');
insert into psychtestquestionoptions(id, question_id, description) values(811, 799, '在我认为是上司的人面前，我感到胆怯');


insert into psychtestquestions(id, test_id, type, description) values(800, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(812, 800, '我喜欢加入在成员之间彼此具有温暖与友爱的感情的团体');
insert into psychtestquestionoptions(id, question_id, description) values(813, 800, '当我的朋友有麻烦时，我喜欢帮助他们');


insert into psychtestquestions(id, test_id, type, description) values(801, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(814, 801, '我喜欢分析我的动机与情感');
insert into psychtestquestionoptions(id, question_id, description) values(815, 801, '当我的朋友受伤时，我喜欢同情他们');


insert into psychtestquestions(id, test_id, type, description) values(802, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(816, 802, '当我有麻烦时，我喜欢我的朋友帮助我');
insert into psychtestquestionoptions(id, question_id, description) values(817, 802, '我喜欢待人以仁慈与同情');


insert into psychtestquestions(id, test_id, type, description) values(803, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(818, 803, '我喜欢成为我所属机构与团体的领导之一');
insert into psychtestquestionoptions(id, question_id, description) values(819, 803, '当我的朋友受伤或生病时，我喜欢同情他们');


insert into psychtestquestions(id, test_id, type, description) values(804, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(820, 804, '我觉得所受的痛苦与不幸是好处多于坏处');
insert into psychtestquestionoptions(id, question_id, description) values(821, 804, '我喜欢对我的朋友表示自己的深情');


insert into psychtestquestions(id, test_id, type, description) values(805, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(822, 805, '我喜欢与朋友共事而不喜欢独立工作');
insert into psychtestquestionoptions(id, question_id, description) values(823, 805, '我喜欢试验与尝试新东西');


insert into psychtestquestions(id, test_id, type, description) values(806, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(824, 806, '我喜欢思索我的朋友们的性格，探讨为什么他们象现在这样');
insert into psychtestquestionoptions(id, question_id, description) values(825, 806, '我喜欢尝试新职业，而不喜欢一直做同样的老事情');


insert into psychtestquestions(id, test_id, type, description) values(807, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(826, 807, '当我有问题时，我喜欢我的朋友们能同情与了解');
insert into psychtestquestionoptions(id, question_id, description) values(827, 807, '我喜欢见些原来不熟悉的人');


insert into psychtestquestions(id, test_id, type, description) values(808, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(828, 808, '当我的观点被攻击时，我喜欢为之辩护');
insert into psychtestquestionoptions(id, question_id, description) values(829, 808, '我喜欢在日常生活中经历新奇与变迁');


insert into psychtestquestions(id, test_id, type, description) values(809, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(830, 809, '当我退让避免了争执时，我感到比照自己的方式做还好些');
insert into psychtestquestionoptions(id, question_id, description) values(831, 809, '我喜欢搬家住到不同的地方');


insert into psychtestquestions(id, test_id, type, description) values(810, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(832, 810, '我喜欢为我的朋友办事');
insert into psychtestquestionoptions(id, question_id, description) values(833, 810, '当我有功课要做时，我喜欢及时做并一直工作至完成为止');


insert into psychtestquestions(id, test_id, type, description) values(811, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(834, 811, '我喜欢分析别人的感情与动机');
insert into psychtestquestionoptions(id, question_id, description) values(835, 811, '当我工作时，我喜欢避开干扰');


insert into psychtestquestions(id, test_id, type, description) values(812, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(836, 812, '我喜欢我的朋友们高兴地为我办点小事');
insert into psychtestquestionoptions(id, question_id, description) values(837, 812, '我喜欢熬夜将工作完成');


insert into psychtestquestions(id, test_id, type, description) values(813, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(838, 813, '我喜欢被人当作领导');
insert into psychtestquestionoptions(id, question_id, description) values(839, 813, '我喜欢长时间地工作而不受别人干扰');


insert into psychtestquestions(id, test_id, type, description) values(814, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(840, 814, '假如我做错了事的话，我觉得我应当受责备');
insert into psychtestquestionoptions(id, question_id, description) values(841, 814, '我喜欢坚持我的职业与方向，甚至看起来好象没什么进展时，我也不在乎');


insert into psychtestquestions(id, test_id, type, description) values(815, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(842, 815, '我喜欢对我的朋友忠实');
insert into psychtestquestionoptions(id, question_id, description) values(843, 815, '我喜欢与迷人的异性约会');


insert into psychtestquestions(id, test_id, type, description) values(816, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(844, 816, '我喜欢预测我的朋友在各种情况下的行动');
insert into psychtestquestionoptions(id, question_id, description) values(845, 816, '我喜欢参与有关性与性行为的讨论');


insert into psychtestquestions(id, test_id, type, description) values(817, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(846, 817, '我喜欢我的朋友对我有深情');
insert into psychtestquestionoptions(id, question_id, description) values(847, 817, '我喜欢变得性兴奋');


insert into psychtestquestions(id, test_id, type, description) values(818, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(848, 818, '在一群人中，我喜欢由我决定该做什么');
insert into psychtestquestionoptions(id, question_id, description) values(849, 818, '我喜欢参与有异性的社交场合');


insert into psychtestquestions(id, test_id, type, description) values(819, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(850, 819, '我为自己无力处理各种情况感到内疚');
insert into psychtestquestionoptions(id, question_id, description) values(851, 819, '我喜欢看以性为主的书与剧本');


insert into psychtestquestions(id, test_id, type, description) values(820, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(852, 820, '我喜欢写信给我的朋友');
insert into psychtestquestionoptions(id, question_id, description) values(853, 820, '我喜欢看报上有关谋杀与其他暴力方面的新闻');


insert into psychtestquestions(id, test_id, type, description) values(821, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(854, 821, '我喜欢预测我的朋友们在各种情况下将怎么做');
insert into psychtestquestionoptions(id, question_id, description) values(855, 821, '我喜欢攻击与我观点相反的看法');


insert into psychtestquestions(id, test_id, type, description) values(822, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(856, 822, '当我受伤或生病时，我喜欢我的朋友们为我小题大作');
insert into psychtestquestionoptions(id, question_id, description) values(857, 822, '当事情不顺时，我想责怪别人');


insert into psychtestquestions(id, test_id, type, description) values(823, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(858, 823, '我喜欢告诉别人如何做他们的工作');
insert into psychtestquestionoptions(id, question_id, description) values(859, 823, '当有人侮辱我时，我想报复');


insert into psychtestquestions(id, test_id, type, description) values(824, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(860, 824, '我喜欢我处处不如人');
insert into psychtestquestionoptions(id, question_id, description) values(861, 824, '当我不赞同他们的看法时，我喜欢说服他们');


insert into psychtestquestions(id, test_id, type, description) values(825, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(862, 825, '当我的朋友有麻烦时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, description) values(863, 825, '对我所承担的一切事情，我喜欢认真去做');


insert into psychtestquestions(id, test_id, type, description) values(826, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(864, 826, '我喜欢旅行，到各处看看');
insert into psychtestquestionoptions(id, question_id, description) values(865, 826, '我喜欢完成别人认为需要技巧与努力的任务');


insert into psychtestquestions(id, test_id, type, description) values(827, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(866, 827, '对我所承担的一切事情，我喜欢认真去做');
insert into psychtestquestionoptions(id, question_id, description) values(867, 827, '我喜欢完成某些具有重大意义的事');


insert into psychtestquestions(id, test_id, type, description) values(828, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(868, 828, '我喜欢与迷人的异性约会');
insert into psychtestquestionoptions(id, question_id, description) values(869, 828, '对我所承担的事我希望能够成功');


insert into psychtestquestions(id, test_id, type, description) values(829, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(870, 829, '我喜欢看报纸上有关谋杀与其他形式的暴力新闻');
insert into psychtestquestionoptions(id, question_id, description) values(871, 829, '我想写本伟大的小说或剧本');


insert into psychtestquestions(id, test_id, type, description) values(830, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(872, 830, '我喜欢对我的朋友做点小事');
insert into psychtestquestionoptions(id, question_id, description) values(873, 830, '做计划时，我喜欢我所尊敬的人给我提出些建议');


insert into psychtestquestions(id, test_id, type, description) values(831, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(874, 831, '我喜欢在日常生活经历新奇与变异');
insert into psychtestquestionoptions(id, question_id, description) values(875, 831, '当我认为我的上司做得对时，我喜欢对他们表示我的看法');


insert into psychtestquestions(id, test_id, type, description) values(832, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(876, 832, '我喜欢熬夜将工作完成');
insert into psychtestquestionoptions(id, question_id, description) values(877, 832, '我喜欢称赞我所仰慕的人');


insert into psychtestquestions(id, test_id, type, description) values(833, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(878, 833, '我喜欢变得性兴奋');
insert into psychtestquestionoptions(id, question_id, description) values(879, 833, '我喜欢接受我所仰慕的人领导');


insert into psychtestquestions(id, test_id, type, description) values(834, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(880, 834, '当有人欺负我时，我想报复');
insert into psychtestquestionoptions(id, question_id, description) values(881, 834, '在团体中，我喜欢接受别人的领导来决定团体该做什么');


insert into psychtestquestions(id, test_id, type, description) values(835, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(882, 835, '我喜欢对我的朋友慷慨');
insert into psychtestquestionoptions(id, question_id, description) values(883, 835, '在做困难的事之前，我喜欢先作个计划');


insert into psychtestquestions(id, test_id, type, description) values(836, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(884, 836, '我喜欢交新朋友');
insert into psychtestquestionoptions(id, question_id, description) values(885, 836, '我希望我的一切作品都是严密、整齐而有条理的');


insert into psychtestquestions(id, test_id, type, description) values(837, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(886, 837, '我喜欢将我开了头的事情或工作完成');
insert into psychtestquestionoptions(id, question_id, description) values(887, 837, '我喜欢使我的书桌与工作间保持清洁与整齐');


insert into psychtestquestions(id, test_id, type, description) values(838, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(888, 838, '我喜欢被异性认为身材迷人');
insert into psychtestquestionoptions(id, question_id, description) values(889, 838, '对我所承担的任何事，我喜欢仔细无遗地进行计划与组织');


insert into psychtestquestions(id, test_id, type, description) values(839, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(890, 839, '我喜欢告诉别人我对他们的看法');
insert into psychtestquestionoptions(id, question_id, description) values(891, 839, '我喜欢饮食有规律，并在固定的时间吃东西');


insert into psychtestquestions(id, test_id, type, description) values(840, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(892, 840, '我喜欢对我的朋友表示深情');
insert into psychtestquestionoptions(id, question_id, description) values(893, 840, '我喜欢说些别人认为机智与聪明的事');


insert into psychtestquestions(id, test_id, type, description) values(841, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(894, 841, '我喜欢尝试新工作而不喜欢一直做同样的老事情');
insert into psychtestquestionoptions(id, question_id, description) values(895, 841, '我有时想做一些事情的目的只为了想看别人对它的反应');


insert into psychtestquestions(id, test_id, type, description) values(842, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(896, 842, '我喜欢坚持自己的工作与方向，即便看来好象已进入了无底深渊。我也不在乎');
insert into psychtestquestionoptions(id, question_id, description) values(897, 842, '在工作场合中我喜欢别人注意我和评价我的外表');


insert into psychtestquestions(id, test_id, type, description) values(843, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(898, 843, '我喜欢看以性为主题的书与剧本');
insert into psychtestquestionoptions(id, question_id, description) values(899, 843, '在团体中，我喜欢成为人所注目的对象');


insert into psychtestquestions(id, test_id, type, description) values(844, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(900, 844, '当事情不顺时，我想责怪别人');
insert into psychtestquestionoptions(id, question_id, description) values(901, 844, '我喜欢问些明知没有人能回答的问题');


insert into psychtestquestions(id, test_id, type, description) values(845, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(902, 845, '当我的朋友受伤或生病时，我喜欢对他们表示同情');
insert into psychtestquestionoptions(id, question_id, description) values(903, 845, '我喜欢发表我对事情的看法');


insert into psychtestquestions(id, test_id, type, description) values(846, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(904, 846, '我喜欢在新奇的餐厅吃饭');
insert into psychtestquestionoptions(id, question_id, description) values(905, 846, '我喜欢做些别人认为不合常规的事');


insert into psychtestquestions(id, test_id, type, description) values(847, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(906, 847, '在承担其他事之前，我喜欢每次只做一件事并将它完成');
insert into psychtestquestionoptions(id, question_id, description) values(907, 847, '我喜欢能自如地做我想做的事');


insert into psychtestquestions(id, test_id, type, description) values(848, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(908, 848, '我喜欢参与有关性与性行为的讨论');
insert into psychtestquestionoptions(id, question_id, description) values(909, 848, '我喜欢照我自己的方式来做而不管别人有什么想法');


insert into psychtestquestions(id, test_id, type, description) values(849, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(910, 849, '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, description) values(911, 849, '我喜欢回避责任与义务');


insert into psychtestquestions(id, test_id, type, description) values(850, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(912, 850, '当我的朋友有困难时，我喜欢帮助他们');
insert into psychtestquestionoptions(id, question_id, description) values(913, 850, '我喜欢对我的朋友们忠诚');


insert into psychtestquestions(id, test_id, type, description) values(851, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(914, 851, '我喜欢做些新鲜的事');
insert into psychtestquestionoptions(id, question_id, description) values(915, 851, '我喜欢交新朋友');


insert into psychtestquestions(id, test_id, type, description) values(852, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(916, 852, '当我有工作要做时，我喜欢立即开始并持续到工作完成为止');
insert into psychtestquestionoptions(id, question_id, description) values(917, 852, '我喜欢参与那些成员之间具有温暖与友善情感的团体');


insert into psychtestquestions(id, test_id, type, description) values(853, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(918, 853, '我喜欢与迷人的异性约会');
insert into psychtestquestionoptions(id, question_id, description) values(919, 853, '我喜欢广交朋友');


insert into psychtestquestions(id, test_id, type, description) values(854, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(920, 854, '我喜欢攻击与我观点相反的看法');
insert into psychtestquestionoptions(id, question_id, description) values(921, 854, '我喜欢给朋友写信');


insert into psychtestquestions(id, test_id, type, description) values(855, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(922, 855, '我喜欢我的朋友们慷慨');
insert into psychtestquestionoptions(id, question_id, description) values(923, 855, '我喜欢观察别人在某一情况下的感觉');


insert into psychtestquestions(id, test_id, type, description) values(856, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(924, 856, '我喜欢在新奇的餐厅吃饭');
insert into psychtestquestionoptions(id, question_id, description) values(925, 856, '我喜欢将自己放在别人的立场上，来想象在同样的情况下我会有什么感觉');


insert into psychtestquestions(id, test_id, type, description) values(857, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(926, 857, '我喜欢熬夜将工作完成');
insert into psychtestquestionoptions(id, question_id, description) values(927, 857, '我喜欢了解我的朋友们在面临各种问题时的感觉');


insert into psychtestquestions(id, test_id, type, description) values(858, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(928, 858, '我喜欢变得性兴奋');
insert into psychtestquestionoptions(id, question_id, description) values(929, 858, '我喜欢研究分析别人的行为');


insert into psychtestquestions(id, test_id, type, description) values(859, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(930, 859, '我喜欢取笑那些我觉得是做了蠢事的人');
insert into psychtestquestionoptions(id, question_id, description) values(931, 859, '我喜欢预测我的朋友们在各种情况下会怎么做');


insert into psychtestquestions(id, test_id, type, description) values(860, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(932, 860, '对有时伤害我的朋友，我喜欢原谅他们');
insert into psychtestquestionoptions(id, question_id, description) values(933, 860, '当我失败时，我喜欢我的朋友们鼓励我');


insert into psychtestquestions(id, test_id, type, description) values(861, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(934, 861, '我喜欢试验与尝试新的事情');
insert into psychtestquestionoptions(id, question_id, description) values(935, 861, '当我有问题时，我喜欢我的朋友们能同情与了解');


insert into psychtestquestions(id, test_id, type, description) values(862, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(936, 862, '我喜欢持续地解谜语与问题，直到解决为止');
insert into psychtestquestionoptions(id, question_id, description) values(937, 862, '我喜欢我的朋友对我仁慈');


insert into psychtestquestions(id, test_id, type, description) values(863, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(938, 863, '我喜欢被异性认为身材迷人');
insert into psychtestquestionoptions(id, question_id, description) values(939, 863, '我喜欢我的朋友们对我有深情');


insert into psychtestquestions(id, test_id, type, description) values(864, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(940, 864, '假如某人是罪有应得，我会公开批评他');
insert into psychtestquestionoptions(id, question_id, description) values(941, 864, '当我受伤或生病时，我喜欢我的朋友们小题大作');


insert into psychtestquestions(id, test_id, type, description) values(865, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(942, 865, '我喜欢对我的朋友们有深情');
insert into psychtestquestionoptions(id, question_id, description) values(943, 865, '我喜欢被人当作领导');


insert into psychtestquestions(id, test_id, type, description) values(866, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(944, 866, '我喜欢尝试新的工作，而不喜欢一直做同样的老事情');
insert into psychtestquestionoptions(id, question_id, description) values(945, 866, '在群众团体中，我喜欢被指定或被选为领导');


insert into psychtestquestions(id, test_id, type, description) values(867, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(946, 867, '对我起了头的一切事情，我都喜欢将它完成');
insert into psychtestquestionoptions(id, question_id, description) values(947, 867, '我喜欢我能够说服与影响别人做我所要做的事');


insert into psychtestquestions(id, test_id, type, description) values(868, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(948, 868, '我喜欢参与有关性行为的讨论');
insert into psychtestquestionoptions(id, question_id, description) values(949, 868, '我愿意被人们叫做和事佬');


insert into psychtestquestions(id, test_id, type, description) values(869, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(950, 869, '当我动怒时，我想摔东西');
insert into psychtestquestionoptions(id, question_id, description) values(951, 869, '我喜欢告诉别人怎么做他们的工作');


insert into psychtestquestions(id, test_id, type, description) values(870, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(952, 870, '我喜欢对我的朋友们表示深情');
insert into psychtestquestionoptions(id, question_id, description) values(953, 870, '当事情有差错时，我觉得我比任何人都该受到责备');


insert into psychtestquestions(id, test_id, type, description) values(871, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(954, 871, '我喜欢搬家，住在不同的地方');
insert into psychtestquestionoptions(id, question_id, description) values(955, 871, '当我做错事时，我觉得我比任何人都更该受到责备');


insert into psychtestquestions(id, test_id, type, description) values(872, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(956, 872, '我喜欢坚持自己的工作与方向，即便看来好象已使我陷入无底深渊时，我也不在乎');
insert into psychtestquestionoptions(id, question_id, description) values(957, 872, '我觉得我所受的痛苦与不幸是好处多于坏处');


insert into psychtestquestions(id, test_id, type, description) values(873, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(958, 873, '我喜欢看性为主的书与剧本');
insert into psychtestquestionoptions(id, question_id, description) values(959, 873, '我觉得我必须承认有些事我做错了');


insert into psychtestquestions(id, test_id, type, description) values(874, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(960, 874, '当事情不顺时，我想责怪别人');
insert into psychtestquestionoptions(id, question_id, description) values(961, 874, '我觉得我处处不如人');


insert into psychtestquestions(id, test_id, type, description) values(875, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(962, 875, '对我所承担的一切事情，我喜欢尽力而为');
insert into psychtestquestionoptions(id, question_id, description) values(963, 875, '我喜欢帮助比我更不幸的人');


insert into psychtestquestions(id, test_id, type, description) values(876, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(964, 876, '我喜欢做新的和各不相同的事');
insert into psychtestquestionoptions(id, question_id, description) values(965, 876, '我喜欢待人仁慈和同情');


insert into psychtestquestions(id, test_id, type, description) values(877, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(966, 877, '当我有功课要做时，我喜欢及时开始并一直做到完成为止');
insert into psychtestquestionoptions(id, question_id, description) values(967, 877, '我喜欢帮助比我不幸的人');


insert into psychtestquestions(id, test_id, type, description) values(878, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(968, 878, '我喜欢参与有异性的社交场合');
insert into psychtestquestionoptions(id, question_id, description) values(969, 878, '我喜欢原谅有时可能伤害了我的朋友');


insert into psychtestquestions(id, test_id, type, description) values(879, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(970, 879, '我喜欢攻击与我观点相反的看法');
insert into psychtestquestionoptions(id, question_id, description) values(971, 879, '我喜欢我的朋友们信任我并告诉他们的问题');


insert into psychtestquestions(id, test_id, type, description) values(880, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(972, 880, '我喜欢待人仁慈和同情');
insert into psychtestquestionoptions(id, question_id, description) values(973, 880, '我喜欢旅行，到各处看看');


insert into psychtestquestions(id, test_id, type, description) values(881, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(974, 881, '我喜欢遵照习俗，避免做人家认为不合常规的事');
insert into psychtestquestionoptions(id, question_id, description) values(975, 881, '我喜欢追求新潮流与时髦');


insert into psychtestquestions(id, test_id, type, description) values(882, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(976, 882, '对我所承担的一切事情，我喜欢认真去做');
insert into psychtestquestionoptions(id, question_id, description) values(977, 882, '我喜欢在日常生活中经历新奇与变异');


insert into psychtestquestions(id, test_id, type, description) values(883, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(978, 883, '我不在乎与迷人的异性表示亲近');
insert into psychtestquestionoptions(id, question_id, description) values(979, 883, '我喜欢试验与尝试新的事情');


insert into psychtestquestions(id, test_id, type, description) values(884, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(980, 884, '当我不赞同他人的意见时，我想指责别人');
insert into psychtestquestionoptions(id, question_id, description) values(981, 884, '我喜欢追求新潮流与时髦');


insert into psychtestquestions(id, test_id, type, description) values(885, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(982, 885, '我喜欢帮助比我不幸的人');
insert into psychtestquestionoptions(id, question_id, description) values(983, 885, '我喜欢将我开了头的任何事情或工作完成 ');


insert into psychtestquestions(id, test_id, type, description) values(886, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(984, 886, '我喜欢搬家，住在不同的地方');
insert into psychtestquestionoptions(id, question_id, description) values(985, 886, '我喜欢长时间地工作而不受干扰');


insert into psychtestquestions(id, test_id, type, description) values(887, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(986, 887, '假如我必须旅行的话，我喜欢先将事情安排好');
insert into psychtestquestionoptions(id, question_id, description) values(987, 887, '我喜欢持续地解谜底直到解出为止');


insert into psychtestquestions(id, test_id, type, description) values(888, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(988, 888, '我喜欢与异性谈恋爱');
insert into psychtestquestionoptions(id, question_id, description) values(989, 888, '在承担别的事之前，我喜欢将现在的工作或任务完成');


insert into psychtestquestions(id, test_id, type, description) values(889, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(990, 889, '我喜欢对别人说我对他们的看法');
insert into psychtestquestionoptions(id, question_id, description) values(991, 889, '当我工作时，我喜欢避免干扰');


insert into psychtestquestions(id, test_id, type, description) values(890, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(992, 890, '我喜欢为我的朋友们办点小事');
insert into psychtestquestionoptions(id, question_id, description) values(993, 890, '我喜欢参与有异性的社交场合');


insert into psychtestquestions(id, test_id, type, description) values(891, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(994, 891, '我喜欢见到不熟悉的人');
insert into psychtestquestionoptions(id, question_id, description) values(995, 891, '我不在乎与迷人的异性表示亲近');


insert into psychtestquestions(id, test_id, type, description) values(892, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(996, 892, '我喜欢持续解谜底直到解出为止');
insert into psychtestquestionoptions(id, question_id, description) values(997, 892, '我喜欢与异性谈恋爱');


insert into psychtestquestions(id, test_id, type, description) values(893, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(998, 893, '我喜欢谈论我的成就');
insert into psychtestquestionoptions(id, question_id, description) values(999, 893, '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, test_id, type, description) values(894, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1000, 894, '我想取笑那些我认为做了蠢事的人');
insert into psychtestquestionoptions(id, question_id, description) values(1001, 894, '我喜欢听或说以性为主的笑话');


insert into psychtestquestions(id, test_id, type, description) values(895, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1002, 895, '我喜欢我的朋友们信任并告诉我他们的麻烦');
insert into psychtestquestionoptions(id, question_id, description) values(1003, 895, '我喜欢看报上有关谋杀与其他形式暴力的新闻');


insert into psychtestquestions(id, test_id, type, description) values(896, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1004, 896, '我喜欢追求新潮流与时髦');
insert into psychtestquestionoptions(id, question_id, description) values(1005, 896, '假如某人罪有应得，我会公开批评他');


insert into psychtestquestions(id, test_id, type, description) values(897, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1006, 897, '当我工作时，我喜欢避免干扰');
insert into psychtestquestionoptions(id, question_id, description) values(1007, 897, '当我不赞同别人的看法，我想责怪他们');


insert into psychtestquestions(id, test_id, type, description) values(898, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1008, 898, '我喜欢听或说与性为主的笑话');
insert into psychtestquestionoptions(id, question_id, description) values(1009, 898, '当有人侮辱我时，我想报复');


insert into psychtestquestions(id, test_id, type, description) values(899, 4, 'SINGLE_CHOICE', '');
insert into psychtestquestionoptions(id, question_id, description) values(1010, 899, '我喜欢回避责任与义务');
insert into psychtestquestionoptions(id, question_id, description) values(1011, 899, '当有人做了我认为很蠢的事情时，我想取笑他们');















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
