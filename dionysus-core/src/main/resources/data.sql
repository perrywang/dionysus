insert into inbox (id) values (1);
insert into inbox (id) values (2);
insert into inbox (id) values (3);
insert into inbox (id) values (4);
insert into inbox (id) values (5);
insert into inbox (id) values (6);

-- password: 'password'
insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (1, 'admin','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '系统管理员', '/public/images/placeholder.png', 'admin@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 1, '管理员');

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (2, 'test1','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '普通用户', '/public/images/placeholder.png', 'test1@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 2, '王鹏');

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (3, 'test2','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '高级注册心理咨询师', '/public/images/placeholder.png', 'test2@huixin.com', 'female', '30', '未知', '13888888888', '33333333', 3, '达峰');

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (4, 'wp','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '高级注册心理咨询师', '/public/images/placeholder.png', 'wp@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 4, '陆军');

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (5, 'consultant1','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, FALSE, '高级注册心理咨询师', '/public/images/placeholder.png', 'consultant1@huixin.com', 'female', '30', '未知', '13888888888', '33333333', 5, '心理咨询师');

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id, realname)
values (6, 'consultant2','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, FALSE, '高级注册心理咨询师', '/public/images/placeholder.png', 'consultant2@huixin.com', 'female', '30', '未知', '13888888888', '33333333', 6, '心理咨询师');

insert into consultants (id) values (3);
insert into consultants (id) values (4);
insert into consultants (id) values (5);
insert into consultants (id) values (6);

insert into expertises (id, name) values (1,'工作');
insert into expertises (id, name) values (2,'社交');
insert into expertises (id, name) values (3,'婚姻');
insert into expertises (id, name) values (4,'情感');
insert into expertises (id, name) values (5,'青少年');
insert into expertises (id, name) values (6,'恋爱与性');
insert into expertises (id, name) values (7,'神经症');
insert into expertises (id, name) values (8,'心理测评');

insert into consultants_expertises (consultants_id, expertises_id) values (4, 1);
insert into consultants_expertises (consultants_id, expertises_id) values (4, 2);
insert into consultants_expertises (consultants_id, expertises_id) values (4, 3);
insert into consultants_expertises (consultants_id, expertises_id) values (3, 4);
insert into consultants_expertises (consultants_id, expertises_id) values (3, 5);

insert into roles(id, name) values (1, 'ROLE_ADMIN');
insert into roles(id, name) values (2, 'ROLE_USER');
insert into roles(id, name) values (3, 'ROLE_CONSULTANT');

insert into users_roles(users_id, roles_id) values (1, 1);
insert into users_roles(users_id, roles_id) values (2, 2);
insert into users_roles(users_id, roles_id) values (3, 3);

insert into categories (id, name) values(1, '亲子关系');
insert into categories (id, name) values(2, '家庭关系');
insert into categories (id, name) values(3, '婚姻关系');
insert into categories (id, name) values(4, '职业心理');
insert into categories (id, name) values(5, '个人成长');

insert into articles (id, category_id, created_by_id,title, summary, cover, body) values (1, 4, 1, '中学生自我认同感的培养？', '文/Moon', 'http://bj.bcebos.com/v1/huixinpn/9a3a0d66-405a-48fd-afe5-45a208a10309?authorization=bce-auth-v1%2F9OLicojAlA50C2GqGIxNzvTN%2F2015-05-06T16%3A19%3A58Z%2F1800%2F%2Fa0103f0500f4dcdda900155ebc58f08926e1e496e6c6767899ee63bb5f488963', '<p>中学生第二性征的出现，意味着他们的性机能开始成熟，性意识开始觉醒。他们开始对自己的身体特征感到好奇和关注，同时产生不安、害羞的心理。表面上他们在异性面前羞涩，拘禁而淡漠，暗地里又十分关心自己在异性心目中的印象。常用一些特别的行为来引人注目，如：特别爱“美”，爱出风头，甚至以吵闹或恶作剧来吸引人注意。总之，中学生微妙的心理变化和心理闭锁性与其较浅的阅历和幼稚行为交织在一起，使他们出现了充满矛盾的多样化表现。父母是中学生自我认同发展过程中的重要人物。研究发现：民主型的父母由于鼓励青少年参与家庭决策，从而促进了子女自我认同感的发展；专制型的父母由于对青少年的行为控制过严，不给他们机会表达意见，从而促成了子女自我认同早闭；纵容型的父母对青少年的指导极少，并且让他们自行其是，结果促成了自我认同的扩散。还有研究发现：在教育子女时使用解释、接受、同情等行为的父母会促进青少年自我认同感的发展，而使用武断及贬低等限制性行为的父母在青少年自我认同感的发展上则起到消极作用。同辈群体对青少年自我认同的重要影响在于：在同辈群体中，彼此之间可以敞开思想，自由地探讨一些问题，如：生死观、恋爱观以及人体生理器官等。中学生认为这些问题十分神秘，但对于朋友用不着保密。因此，在同辈群体中，中学生形成了一套自己的价值标准。这些标准可能与社会的主流价值观相符合，也可能不符合，甚至背道而驰。他们在接纳吸收同伴行为处事方式的同时改造自己的行为处事方式，并形成相应的自我认同感，追求被同伴接纳和欣赏。</p><p><img class="fr-fil fr-dib" alt="Image title" src="http://bj.bcebos.com/v1/huixinpn/9a3a0d66-405a-48fd-afe5-45a208a10309?authorization=bce-auth-v1%2F9OLicojAlA50C2GqGIxNzvTN%2F2015-05-06T16%3A19%3A58Z%2F1800%2F%2Fa0103f0500f4dcdda900155ebc58f08926e1e496e6c6767899ee63bb5f488963" width="300"></p>');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (2, 'DOC',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (3, 'DOC',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (4, 'DOC',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (5, 'DOC',FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (6, 'DOC',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (7, 'DOC',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (8, 'DOC',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (9, 'DOC',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (10, 'VIDEO', 1, FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (11, 'VIDEO', 1, FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (12, 'VIDEO', 1, FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (13, 'VIDEO', 1, FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (14, 'VIDEO', 1, FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (15, 'VIDEO', 1, FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (16, 'VIDEO', 1, FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (17, 'AUDIO', 1, FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (18, 'AUDIO', 1, FALSE, 4, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (19, 'AUDIO', 1, FALSE, 5, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, created_by_id, interview, category_id, title, summary, body) values (20, 'AUDIO', 1, FALSE, 5, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (21, 'AUDIO',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (22, 'AUDIO',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (23, 'AUDIO',FALSE, 4, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (24, 'DOC',FALSE, 2, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (25, 'DOC',FALSE, 2, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (26, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (27, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (28, 'DOC',FALSE, 2, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (29, 'DOC',FALSE, 2, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (30, 'DOC',FALSE, 2, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (31, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (32, 'AUDIO',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (33, 'AUDIO',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (34, 'AUDIO',FALSE, 4, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (35, 'DOC',FALSE, 2, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (36, 'DOC',FALSE, 2, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (37, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (38, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (39, 'DOC',FALSE, 2, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (40, 'DOC',FALSE, 2, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (41, 'DOC',FALSE, 2, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (42, 'DOC',FALSE, 2, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');


insert into blog (id) values (10);
insert into blog (id) values (11);
insert into blog (id) values (12);
insert into blog (id) values (13);
insert into blog (id) values (14);
insert into blog (id) values (15);
insert into blog (id) values (16);
insert into blog (id) values (17);
insert into blog (id) values (18);
insert into blog (id) values (19);
insert into blog (id) values (20);


insert into official_articles (id, location) values (1, 'slider');
insert into official_articles (id, location) values (2, 'slider');
insert into official_articles (id, location) values (3, 'slider');
insert into official_articles (id) values (4);
insert into official_articles (id) values (5);
insert into official_articles (id) values (6);
insert into official_articles (id) values (7);
insert into official_articles (id) values (8);
insert into official_articles (id) values (9);
insert into official_articles (id) values (21);
insert into official_articles (id) values (22);
insert into official_articles (id) values (23);
insert into official_articles (id) values (24);
insert into official_articles (id) values (25);
insert into official_articles (id) values (26);
insert into official_articles (id) values (27);
insert into official_articles (id) values (28);
insert into official_articles (id) values (29);
insert into official_articles (id) values (30);
insert into official_articles (id) values (31);
insert into official_articles (id) values (32);
insert into official_articles (id) values (33);
insert into official_articles (id) values (34);
insert into official_articles (id) values (35);
insert into official_articles (id) values (36);
insert into official_articles (id) values (37);
insert into official_articles (id) values (38);
insert into official_articles (id) values (39);
insert into official_articles (id) values (40);
insert into official_articles (id) values (41);
insert into official_articles (id) values (42);

insert into comments (id, article_id, content, created_by_id) values (1, 1, '测试用Comment', 1);
insert into comments (id, article_id, content, created_by_id) values (2, 1, '第二条测试用Comment', 2);
insert into comments (id, article_id, content, created_by_id) values (3, 2, '测试用Comment', 3);

insert into modules (id, title, subtitle, href, image, body) values (1, '汇心网', '汇心网络中心', '/site', '/public/images/slide-2.jpeg', '关怀无处不在');
insert into modules (id, title, subtitle, href, image, body) values (2, '心理服务小站', '心灵避风港.汇心心理', '/colleges', '/public/images/slide-3.jpeg', '国内最专业的校园心理服务提供商');
insert into modules (id, title, subtitle, href, image, body) values (3, '汇心心理学院', '专业心理从业人员孵化基地', '/about', '/public/images/slide-1.jpeg', '汇心心理学院，专业源于权威');

insert into pages (id, name, title, body) values (1, 'about', 'About Us', '关于我们的详细页面');

insert into menu (id, name, href) values (1, '心理体验', '/experience');
insert into menu (id, name, href) values (2, '在线心理咨询', '/consult');
insert into menu (id, name, href) values (3, '心理知识', '/articles');
insert into menu (id, name, href) values (4, '心理课程', '/cources');

insert into appointments (id, user_id, consultant_id, state, approach) values (1, 1, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (2, 2, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (3, 2, 3, 'ACCEPTED', 'BY_PHONE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (4, 2, 4, 'DECLINED', 'OFFLINE' );

insert into coursecategories (id, name) values(1, '普通大众');
insert into coursecategories (id, name, parent_id) values(2, '亲子关系', 1);
insert into coursecategories (id, name, parent_id) values(3, '家庭关系', 1);
insert into coursecategories (id, name) values(4, '专业课程');
insert into coursecategories (id, name, parent_id) values(5, '婚姻关系', 4);
insert into coursecategories (id, name, parent_id) values(6, '职业心理', 4);
insert into coursecategories (id, name, parent_id) values(7, '个人成长', 4);


insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(1,'心理学导论','心理学入门课程',2,3,'OFFLINE','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(2,'心理学进阶','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location) values(3,'心理学高级','心理学辅导员课程',3,3,'ONE2MANY','slider');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(4,'心理学进阶2','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(5,'心理学进阶3','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(6,'心理学进阶4','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(7,'心理学进阶5','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(8,'心理学进阶6','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,location,state) values(9,'心理学进阶7','心理学高级学员课程',2,3, 'VIDEO','slider','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,state) values(10,'心理学高级2','心理学辅导员课程',2,3,'ONE2MANY','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,state) values(11,'心理学高级3','心理学辅导员课程',2,3,'ONE2MANY','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,state) values(12,'心理学高级4','心理学辅导员课程',2,3,'ONE2MANY','OPEN');
insert into courses (id, title, description, category_id, consultant_id, approach,state) values(13,'心理学高级5','心理学辅导员课程',2,3,'ONE2MANY','OPEN');



insert into user_course values (1, 2);
insert into user_course values (2, 2);
insert into user_course values (3, 2);

insert into tags(id,name) values(1,'ttttaaaaaggggg');

insert into courses_tags values(1,1,1);