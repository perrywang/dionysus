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

insert into psychtestcategories(id,test_id,name) values (1, 1, '适应与焦虑型');

insert into psychtestings(id, test_id) values (1, 1);

--insert into psychtestcategories(id, result_id, category16pf_id, name, categoryweights) values (1, 1, 1, '乐群性', '10');

insert into psychtestitems(id, test_id, category_id, description) values (1, 1, 1, '我很明了本测验的说明');
insert into psychtestitems(id, test_id, category_id, description) values (2, 1, 1, '我对本测验的每一个问题，都能做到诚实的回答');
insert into psychtestitems(id, test_id, category_id, description) values (3, 1, 1, '如果我有机会的话，我愿意');
insert into psychtestitems(id, test_id, category_id, description) values (4, 1, 1, '我有能力应付各种困难');

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

insert into appointments (id, user_id, consultant_id, state, approach) values (1, 1, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (2, 2, 4, 'WAITING', 'ONLINE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (3, 2, 3, 'ACCEPTED', 'BY_PHONE' );
insert into appointments (id, user_id, consultant_id, state, approach) values (4, 2, 4, 'DECLINED', 'OFFLINE' );

insert into coursecategories (id, name) values(1, '亲子关系');
insert into coursecategories (id, name) values(2, '家庭关系');
insert into coursecategories (id, name) values(3, '婚姻关系');
insert into coursecategories (id, name) values(4, '职业心理');
insert into coursecategories (id, name) values(5, '个人成长');

insert into courses (id, title, description, category_id, consultant_id) values(1,'心理学导论','心理学入门课程',1,3);
insert into courses (id, title, description, category_id, consultant_id) values(2,'心理学进阶','心理学高级学员课程',1,3);
insert into courses (id, title, description, category_id, consultant_id) values(3,'心理学高级','心理学辅导员课程',2,3);

insert into user_course values (1, 2);
insert into user_course values (2, 2);
insert into user_course values (3, 2);