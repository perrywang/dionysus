insert into inbox (id) values (1);
insert into inbox (id) values (2);
insert into inbox (id) values (3);
insert into inbox (id) values (4);

-- password: 'password'
insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id)
values (1, 'admin','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '系统管理员', '/public/images/placeholder.png', 'admin@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 1);

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id)
values (2, 'test1','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '普通用户', '/public/images/placeholder.png', 'test1@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 2);

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id)
values (3, 'test2','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '高级注册心理咨询师，擅长抑郁症引导和咨询', '/public/images/placeholder.png', 'test2@huixin.com', 'female', '30', '未知', '13888888888', '33333333', 3);

insert into users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled, about, avatar, email, gender, age, address, mobile, landline, inbox_id)
values (4, 'wp','$2a$10$56XBkZOecmVo27bDByl4t.Y49T6ps.mJZf1ptSdAWf1fAICftXzdG', TRUE, TRUE, TRUE, TRUE, '高级注册心理咨询师，擅长家庭关系咨询和调节', '/public/images/placeholder.png', 'wp@huixin.com', 'male', '30', '未知', '13888888888', '33333333', 4);



insert into consultants (id) values (4);
insert into consultants (id) values (3);

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

insert into articles (id, category_id, created_by_id,title, summary, cover, body) values (1, 4, 1, '挫折对我们意味着什么？', '心理学中有一种说法，要想获得情绪上的成熟，需要经历“恰到好处的挫折”。我们早期都会有很多理想和愿望，需要通过合适但不过分的挫折，才能分辨愿望和现实的区别，获得现实感和行动力。适当的挫折让我们明白，满足愿望之前要先有行动。', 'http://bj.bcebos.com/v1/huixinpn/9a3a0d66-405a-48fd-afe5-45a208a10309?authorization=bce-auth-v1%2F9OLicojAlA50C2GqGIxNzvTN%2F2015-05-06T16%3A19%3A58Z%2F1800%2F%2Fa0103f0500f4dcdda900155ebc58f08926e1e496e6c6767899ee63bb5f488963', '<p><img class="fr-fil fr-dib" alt="Image title" src="http://bj.bcebos.com/v1/huixinpn/9a3a0d66-405a-48fd-afe5-45a208a10309?authorization=bce-auth-v1%2F9OLicojAlA50C2GqGIxNzvTN%2F2015-05-06T16%3A19%3A58Z%2F1800%2F%2Fa0103f0500f4dcdda900155ebc58f08926e1e496e6c6767899ee63bb5f488963" width="300"></p>');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (2, 'DOC',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (3, 'DOC',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (4, 'DOC',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (5, 'DOC',FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (6, 'DOC',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (7, 'DOC',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (8, 'DOC',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (9, 'DOC',FALSE, 5, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (10, 'VIDEO',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (11, 'VIDEO',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (12, 'VIDEO',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (13, 'VIDEO',FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (14, 'VIDEO',FALSE, 1, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (15, 'VIDEO',FALSE, 1, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (16, 'VIDEO',FALSE, 1, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (17, 'AUDIO',FALSE, 1, '萨提亚自我成长工作坊', '真正的力量绝不是要强、计较、防御，那样只会让自己累与孤独。真正的力量是温暖。你可以做一个内心有力量的人，可以温暖自己，也温暖身边的人。可以放下抗拒与控制，活出爱与光。这个世界上的烦恼，归根结底就是对自己的不了解。才会延伸出一系列的问题：对自己要求高、敏感、拖延、完美主义、抑郁、忧伤、挫败，继而自我否定。以为得到通过努力就会得到更多的成就，就会得到认可。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (18, 'AUDIO',FALSE, 4, '上班恐惧症怎么克服', '所谓金无足赤，人无完人。我们不可能迎合每个人的性格，你不喜欢他人的性格，你认为每一个人都喜欢你吗？要学会容纳他人，有容乃大。也不要总是去评论他人，做好自己就行了，他做得少拿得多，他会成世界首富吗？与其讨论这些没用的，还不如努力工作，相信自己未来做了他上司就可以扣他工资了，呵呵，开玩笑的。不过还是要靠自己努力工作。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (19, 'AUDIO',FALSE, 5, '如何放下', '如果处在一般的层面，看到你的描述，而后同情你的遭遇，我想你会觉得被安慰，会得到一时的平衡。但而后，当你回到人际群体中，你仍会被这样的境遇包围。所以，我想“在你的伤口上撒盐”！俗话说“可怜之人必有可恨之处，可恨之人也必然有可怜之处”，作为一个可怜人，你肯定有些可恨之处，而人的本性之一是“人都不愿意承认自己错了”，所以，如果想改变现状，让自己体验到平和的快乐，那就勇敢的承担改变的痛苦，找寻下自己的劣势，而后改变。', '正文内容');
insert into articles (id, articletype, interview, category_id, title, summary, body) values (20, 'AUDIO',FALSE, 5, '如何完美地失败', '知性上，我们知道失败能使我们领悟机遇，从而为我们人生最终的胜利导航。因此，当拒绝降临、老板说不；当你投资失利、丢了房子，或者失去了任何你想要的东西时，放慢速度，看看有哪里不对。', '正文内容');
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




insert into comments (id, article_id, content) values (1, 1, '测试用Comment');
insert into comments (id, article_id, content) values (2, 1, '第二条测试用Comment');
insert into comments (id, article_id, content) values (3, 2, '测试用Comment');

insert into modules (id, title, subtitle, href, image, body) values (1, '汇心网', '汇心网络中心', '/site', '/public/images/slide-2.jpeg', '关怀无处不在');
insert into modules (id, title, subtitle, href, image, body) values (2, '心理服务小站', '心灵避风港.汇心心理', '/colleges', '/public/images/slide-3.jpeg', '国内最专业的校园心理服务提供商');
insert into modules (id, title, subtitle, href, image, body) values (3, '汇心心理学院', '专业心理从业人员孵化基地', '/about', '/public/images/slide-1.jpeg', '汇心心理学院，专业源于权威');

insert into pages (id, name, title, body) values (1, 'about', 'About Us', '关于我们的详细页面');

insert into menu (id, name, href) values (1, '心理体验', '/experience');
insert into menu (id, name, href) values (2, '在线心理咨询', '/consult');
insert into menu (id, name, href) values (3, '心理知识', '/articles');
insert into menu (id, name, href) values (4, '心理课程', '/cources');

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

insert into psychtestitems(id, test_id, category_id, description) values (1, 1, 1, '我很明了本测验的说明');
insert into psychtestitems(id, test_id, category_id, description) values (2, 1, 1, '我对本测验的每一个问题，都能做到诚实的回答');
insert into psychtestitems(id, test_id, category_id, description) values (3, 1, 1, '如果我有机会的话，我愿意');
insert into psychtestitems(id, test_id, category_id, description) values (4, 1, 1, '我有能力应付各种困难');
insert into psychtestitems(id, test_id, category_id, description) values (5, 1, 1, '即使是关在铁笼里的猛兽，我见了也会感到惴惴不安');
insert into psychtestitems(id, test_id, category_id, description) values (6, 1, 1, '我总是不敢大胆批评别人的言行');
insert into psychtestitems(id, test_id, category_id, description) values (7, 1, 1, '我的思想似乎');
insert into psychtestitems(id, test_id, category_id, description) values (8, 1, 1, '我不擅长说笑话、讲有趣的事');
insert into psychtestitems(id, test_id, category_id, description) values (9, 1, 1, '当我见到亲友和邻居争吵时，我总是');
insert into psychtestitems(id, test_id, category_id, description) values (10, 1, 1, '在群众集会中，我');
insert into psychtestitems(id, test_id, category_id, description) values (11, 1, 1, '我愿做一个');
insert into psychtestitems(id, test_id, category_id, description) values (12, 1, 1, '阅读时，我喜欢选读');
insert into psychtestitems(id, test_id, category_id, description) values (13, 1, 1, '我认为很多人都有些心理不正常、只是他们不愿意承认');
insert into psychtestitems(id, test_id, category_id, description) values (14, 1, 1, '我希望我的爱人擅长交际，无须具有文艺才能');
insert into psychtestitems(id, test_id, category_id, description) values (15, 1, 1, '对于性情急噪，爱发脾气的人，我仍能以礼相待');
insert into psychtestitems(id, test_id, category_id, description) values (16, 1, 1, '受人侍奉时我常常局促不安');
insert into psychtestitems(id, test_id, category_id, description) values (17, 1, 1, '在从事体力或脑力劳动之后，我总是需要有比别人更多的休息时间，才能保持工作效率');
insert into psychtestitems(id, test_id, category_id, description) values (18, 1, 1, '半夜醒来，我常常为种种惴虑不安而不能再入睡');
insert into psychtestitems(id, test_id, category_id, description) values (19, 1, 1, '事情进行得不顺利时，我常常急得涕泪交流');
insert into psychtestitems(id, test_id, category_id, description) values (20, 1, 1, '我认为只要双方同意可以离婚，可以不受传统观念的束缚');
insert into psychtestitems(id, test_id, category_id, description) values (21, 1, 1, '我对人或物的兴趣都很容易改变');
insert into psychtestitems(id, test_id, category_id, description) values (22, 1, 1, '在工作中，我愿意');
insert into psychtestitems(id, test_id, category_id, description) values (23, 1, 1, '我常常会无缘无故地自言自语');
insert into psychtestitems(id, test_id, category_id, description) values (24, 1, 1, '无论是工作、饮食或外出游览，我总是');
insert into psychtestitems(id, test_id, category_id, description) values (25, 1, 1, '有时我怀疑别人是否对我的言行真正的有兴趣');
insert into psychtestitems(id, test_id, category_id, description) values (26, 1, 1, '如果我在工厂里工作，我愿做');
insert into psychtestitems(id, test_id, category_id, description) values (27, 1, 1, '在阅读时，我愿阅读');
insert into psychtestitems(id, test_id, category_id, description) values (28, 1, 1, '本题后面列出的三个单词，哪个与其他两个单词不类同');
insert into psychtestitems(id, test_id, category_id, description) values (29, 1, 1, '如果我能到一个新的环境，我要');
insert into psychtestitems(id, test_id, category_id, description) values (30, 1, 1, '在一生中，我总觉得我能达到我所预期的目标');
insert into psychtestitems(id, test_id, category_id, description) values (31, 1, 1, '当我说谎时，总觉得内心羞愧，不敢正视对方');
insert into psychtestitems(id, test_id, category_id, description) values (32, 1, 1, '假使我手里拿着一颗装有子弹的手枪，我必须把子弹取出来才能安心');

insert into psychtestitemoptions(id, item_id, description, score, weight) values (1, 1, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (2, 1, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (3, 1, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (4, 2, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (5, 2, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (6, 2, '不同意', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (7, 3, '到一个繁华的城市去旅行', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (8, 3, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (9, 3, '游览清静的山区', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (10, 4, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (11, 4, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (12, 4, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (13, 5, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (14, 5, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (15, 5, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (16, 6, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (17, 6, '有时如此', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (18, 6, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (19, 7, '比较先进', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (20, 7, '一般', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (21, 7, '比较保守', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (22, 8, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (23, 8, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (24, 8, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (25, 9, '任其自己解决', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (26, 9, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (27, 9, '予以劝解', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (28, 10, '谈吐自如', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (29, 10, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (30, 10, '保持沉默', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (31, 11, '建筑工程师', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (32, 11, '不确定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (33, 11, '社会科学研究者', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (34, 12, '自然科学书籍', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (35, 12, '不确定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (36, 12, '政治理论书籍', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (37, 13, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (38, 13, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (39, 13, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (40, 14, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (41, 14, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (42, 14, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (43, 15, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (44, 15, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (45, 15, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (46, 16, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (47, 16, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (48, 16, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (49, 17, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (50, 17, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (51, 17, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (52, 18, '常常如此', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (53, 18, '有时如此', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (54, 18, '极少如此', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (55, 19, '极少如此', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (56, 19, '有时如此', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (57, 19, '常常如此', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (58, 20, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (59, 20, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (60, 20, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (61, 21, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (62, 21, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (63, 21, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (64, 22, '和别人合作', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (65, 22, '不确定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (66, 22, '自己单独进行', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (67, 23, '常常如此', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (68, 23, '偶然如此', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (69, 23, '从不如此', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (70, 24, '匆匆忙忙，不能尽兴', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (71, 24, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (72, 24, '从容不迫', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (73, 25, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (74, 25, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (75, 25, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (76, 26, '技术科的工作', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (77, 26, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (78, 26, '宣传科的工作', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (79, 27, '有关太空旅行的书籍', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (80, 27, '不太确定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (81, 27, '有关家庭教育的书籍', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (82, 28, '狗', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (83, 28, '石头', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (84, 28, '牛', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (85, 29, '把生活安排得和从前不一样', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (86, 29, '不确定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (87, 29, '和从前相仿', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (88, 30, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (89, 30, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (90, 30, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (91, 31, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (92, 31, '不一定', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (93, 31, '不是的', 0, 30);

insert into psychtestitemoptions(id, item_id, description, score, weight) values (94, 32, '是的', 2, 10);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (95, 32, '介于A-C之间', 1, 20);
insert into psychtestitemoptions(id, item_id, description, score, weight) values (96, 32, '不是的', 0, 30);

insert into appointments (id, user_id, consultant_id, state, approach) values (1, 1, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (2, 2, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (3, 2, 3, 'ACCEPTED', 'BY_PHONE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (4, 2, 4, 'DECLINED', 'OFFLINE' );

insert into coursecategories (id, name) values(1, '亲子关系');
insert into coursecategories (id, name) values(2, '家庭关系');
insert into coursecategories (id, name) values(3, '婚姻关系');
insert into coursecategories (id, name) values(4, '职业心理');
insert into coursecategories (id, name) values(5, '个人成长');

insert into courses (id, title, description, category_id, consultant_id, approach) values(1,'心理学导论','心理学入门课程',1,3,'OFFLINE');
insert into courses (id, title, description, category_id, consultant_id) values(2,'心理学进阶','心理学高级学员课程',1,3);
insert into courses (id, title, description, category_id, consultant_id) values(3,'心理学高级','心理学辅导员课程',2,3);

insert into user_course values (1, 2);
insert into user_course values (2, 2);
insert into user_course values (3, 2);

insert into tags(id,name) values(1,'ttttaaaaaggggg');

insert into tags_courses values(1,1,1);