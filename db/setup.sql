CREATE TABLE fruits
(
   id SERIAL NOT NULL,
   name varchar(255) NOT NULL,
   price Integer,
   created_at TIMESTAMP,
   updated_at TIMESTAMP,
   PRIMARY KEY (id)
);

INSERT INTO fruits (name, price, created_at, updated_at) VALUES
(
  'リンゴ',
  120,
  TO_TIMESTAMP('2007/01/09 00:42:00', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2010/01/27 00:41:00', 'YYYY/MM/DD HH24:MI:SS')
),
(
  'オレンジ',
  180,
  TO_TIMESTAMP('2002/10/14 14:23:14', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2014/05/26 01:36:58', 'YYYY/MM/DD HH24:MI:SS')
),
(
  'バナナ',
  240,
  TO_TIMESTAMP('2001/05/27 16:52:40', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2018/05/11 21:07:21', 'YYYY/MM/DD HH24:MI:SS')
),(
  'レモン',
  600,
  TO_TIMESTAMP('2009/06/08 17:07:55', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2017/03/11 09:02:45', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブルーベリー',
  580,
  TO_TIMESTAMP('2004/02/18 00:17:16', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2020/06/05 05:18:06', 'YYYY/MM/DD HH24:MI:SS')
),(
  'パイナップル',
  60,
  TO_TIMESTAMP('2003/10/12 15:12:11', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/12/14 21:07:17', 'YYYY/MM/DD HH24:MI:SS')
),(
  'リンゴ',
  90,
  TO_TIMESTAMP('2001/11/16 23:08:27', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/02/14 07:49:53', 'YYYY/MM/DD HH24:MI:SS')
),(
  'レモン',
  360,
  TO_TIMESTAMP('2003/07/08 05:38:25', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2006/05/05 23:12:19', 'YYYY/MM/DD HH24:MI:SS')
),(
  'バナナ',
  540,
  TO_TIMESTAMP('2003/06/05 13:39:31', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2004/07/07 00:28:28', 'YYYY/MM/DD HH24:MI:SS')
),(
  'レモン',
  50,
  TO_TIMESTAMP('2013/07/21 14:18:31', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/02/27 06:51:04', 'YYYY/MM/DD HH24:MI:SS')
),(
  'バナナ',
  570,
  TO_TIMESTAMP('2006/10/23 08:33:37', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2020/08/30 12:18:14', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  230,
  TO_TIMESTAMP('2004/08/26 09:00:06', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2018/08/31 05:35:28', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  160,
  TO_TIMESTAMP('2005/09/30 14:29:22', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/12/03 23:40:43', 'YYYY/MM/DD HH24:MI:SS')
),(
  'パイナップル',
  530,
  TO_TIMESTAMP('2005/10/20 13:30:04', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2018/03/14 11:40:43', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブドウ',
  190,
  TO_TIMESTAMP('2001/07/07 20:26:58', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2002/09/18 09:10:50', 'YYYY/MM/DD HH24:MI:SS')
),(
  'バナナ',
  180,
  TO_TIMESTAMP('2000/01/21 11:17:01', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2001/02/02 07:00:06', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブドウ',
  380,
  TO_TIMESTAMP('2000/01/30 23:25:20', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2020/03/23 18:55:17', 'YYYY/MM/DD HH24:MI:SS')
),(
  'パイナップル',
  350,
  TO_TIMESTAMP('2005/06/28 17:43:20', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2007/03/21 06:21:38', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブドウ',
  250,
  TO_TIMESTAMP('2006/03/02 15:41:09', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2014/01/19 08:58:07', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  360,
  TO_TIMESTAMP('2016/02/02 14:00:29', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/05/03 06:29:29', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  250,
  TO_TIMESTAMP('2009/02/12 15:53:44', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2010/01/07 19:11:16', 'YYYY/MM/DD HH24:MI:SS')
),(
  'イチゴ',
  400,
  TO_TIMESTAMP('2011/08/01 11:02:11', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2015/05/08 19:38:54', 'YYYY/MM/DD HH24:MI:SS')
),(
  'イチゴ',
  40,
  TO_TIMESTAMP('2016/12/08 15:25:00', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/01/13 23:55:33', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  150,
  TO_TIMESTAMP('2000/07/27 23:18:43', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/03/16 03:05:05', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  130,
  TO_TIMESTAMP('2003/08/04 07:35:21', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/06/08 09:31:56', 'YYYY/MM/DD HH24:MI:SS')
),(
  'パイナップル',
  130,
  TO_TIMESTAMP('2005/06/26 09:25:55', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2010/12/16 04:47:11', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブルーベリー',
  530,
  TO_TIMESTAMP('2010/03/11 22:09:36', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2011/10/15 21:55:01', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  530,
  TO_TIMESTAMP('2008/02/15 13:50:52', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2008/11/14 18:45:28', 'YYYY/MM/DD HH24:MI:SS')
),(
  'リンゴ',
  470,
  TO_TIMESTAMP('2004/12/13 11:01:07', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2010/05/25 08:19:44', 'YYYY/MM/DD HH24:MI:SS')
),(
  'イチゴ',
  500,
  TO_TIMESTAMP('2010/11/14 18:12:47', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2017/08/28 17:16:21', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブドウ',
  80,
  TO_TIMESTAMP('2000/07/03 18:36:57', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2018/10/13 21:00:26', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  20,
  TO_TIMESTAMP('2008/03/23 00:28:20', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2008/12/03 09:55:28', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブルーベリー',
  50,
  TO_TIMESTAMP('2003/02/14 20:53:35', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2015/09/13 07:24:40', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  150,
  TO_TIMESTAMP('2001/02/17 21:45:46', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2005/01/06 18:49:33', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  290,
  TO_TIMESTAMP('2000/10/26 15:26:42', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2011/07/15 13:41:50', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  420,
  TO_TIMESTAMP('2000/10/10 20:22:48', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2007/09/16 15:39:39', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  160,
  TO_TIMESTAMP('2014/09/27 10:51:33', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/03/31 14:58:16', 'YYYY/MM/DD HH24:MI:SS')
),(
  'バナナ',
  420,
  TO_TIMESTAMP('2003/04/22 03:58:00', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/09/05 20:05:30', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  190,
  TO_TIMESTAMP('2017/08/01 21:08:13', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2020/06/06 19:17:35', 'YYYY/MM/DD HH24:MI:SS')
),(
  'オレンジ',
  250,
  TO_TIMESTAMP('2012/10/15 22:53:06', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2019/05/11 13:47:28', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブルーベリー',
  490,
  TO_TIMESTAMP('2004/07/27 08:20:44', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2014/08/19 11:27:05', 'YYYY/MM/DD HH24:MI:SS')
),(
  'メロン',
  230,
  TO_TIMESTAMP('2000/07/06 18:19:47', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2001/02/14 00:32:09', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  210,
  TO_TIMESTAMP('2007/08/05 11:58:38', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2011/10/04 01:35:43', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ドラゴンフルーツ',
  580,
  TO_TIMESTAMP('2004/11/03 03:47:21', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/01/12 16:21:54', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  560,
  TO_TIMESTAMP('2011/12/03 17:39:26', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2012/11/05 14:52:09', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  440,
  TO_TIMESTAMP('2013/02/23 03:02:08', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2017/01/05 15:30:39', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  130,
  TO_TIMESTAMP('2020/05/14 14:53:39', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2020/09/03 13:08:06', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブルーベリー',
  20,
  TO_TIMESTAMP('2005/06/10 20:45:52', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2012/07/14 09:23:37', 'YYYY/MM/DD HH24:MI:SS')
),(
  'モモ',
  480,
  TO_TIMESTAMP('2016/12/13 20:13:37', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2017/01/08 22:56:13', 'YYYY/MM/DD HH24:MI:SS')
),(
  'リンゴ',
  170,
  TO_TIMESTAMP('2000/07/18 15:08:11', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2002/03/31 16:19:30', 'YYYY/MM/DD HH24:MI:SS')
),(
  'マンゴー',
  530,
  TO_TIMESTAMP('2003/08/13 10:14:27', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2007/01/08 20:31:11', 'YYYY/MM/DD HH24:MI:SS')
),(
  'ブドウ',
  180,
  TO_TIMESTAMP('2000/03/03 08:19:13', 'YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2018/04/11 01:59:41', 'YYYY/MM/DD HH24:MI:SS')
);