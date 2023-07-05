DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`
(
    `role_id`   varchar(10)                       NOT NULL,
    `role_name` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
    PRIMARY KEY (`role_id`)
);
INSERT INTO `user_role`
VALUES ('R01', 'Admin'),
       ('R02', 'Customer');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`       varchar(10)                        NOT NULL,
    `role_id`       varchar(10)                        NOT NULL,
    `user_username` varchar(255)                       NOT NULL,
    `user_password` varchar(255)                       NOT NULL,
    `user_name`     varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `user_phone`    varchar(255)                       NOT NULL,
    `user_email`    varchar(255)                       NOT NULL,
    `user_address`  varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `createdAt`     timestamp DEFAULT 0,
    `modifiedAt`    timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`     timestamp                          NULL,
    `public_key`    blob,
    `private_key`   blob,
    PRIMARY KEY (`user_id`, `user_username`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
);
INSERT INTO `user`
VALUES ('96BhitTAhy', 'R02', 'nhan3331', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 18:03:05', '2023-01-02 18:06:18', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0:ºKC\ãH¥\"\Õ÷z V\ÌE­XSò¥²(To\Ö,I¥u­\×ô\ß\Ø#/ÉÏª­\âi;%\Ùv-­¿Ì¶4\Ã3×¨®&«Jqj\ë¯\'¦|j@ £q\"p	\æû>û\ÂC¨IÜ¦Ó/\×>_\ç\èK\åo§Á',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*_\è2\ëùi.ð\Ýõ½¿C\Ê$t\à'),
       ('aZAx3DdFfq', 'R01', 'nhanv', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2022-07-06 19:18:19', '2023-01-02 14:34:13', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0füøÀ\ìw>\0(ý;\ãÍ®\Û2\Ö.\í-\Ì3A=úH?41zg]\ä:\à9T~ó$Ì¸ßGz%\ç%{³\Úk\ÆLÃ¤¹w±Ö¿pTø Y(þ\ÛÃºÉ\ÄO3\ÆsPV\"\Õó£->ô\Ùf÷\n$\à²\Ó¾RÎ',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*k\Ëûðq RÃªs£­,'),
       ('cQSKw5V3Dh', 'R02', 'nhan222', 'BB4E31F2D20F8E7F88E2B8459263657F', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 14:31:01', '2023-01-02 14:31:01', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0!¶%d]¿½³üù$!Úº\Ú~b%\Âw©ÎDº}òÇ±\à]=8\î\î(=Q\'\ÓEöuÁ\åþK[øóth\Ó\\û.)tµ¤MjLs\"tþ;3Csý\êL¾\0IOeµ@Â¦W\ß:´E~¼ðGZBWnL',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*y\×(o=x\å\å\rKõR¬½E'),
       ('DHQOb5vbWI', 'R02', 'nhan123456', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-03 08:37:19', '2023-01-03 08:38:05', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\08H\Ý\è¯¬\ÜJa¤Ö±\ÇR\Ý=¼+\Å>\ã\ìYI¡>^\êztÀÍ¥À=}¶\ê[(\âó\à\Çx­(c©\nF\Ñ?\Ý´Äw\'\äñy\Ö÷e\Òô\ß?ó1	\Î\Ï$súp\Û\r»¶\Ú< Ñ³`@®µ\\\Ð.g',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\à!xX©µ+¼\äf\ï}\Õ'),
       ('E0WpdDTJoI', 'R01', 'admin', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh Äáº¡t', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2022-06-25 14:27:06', '2023-01-02 14:34:13', NULL, NULL, NULL),
       ('e40cqUMxWQ', 'R02', 'nhan123', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2022-07-01 19:21:46', '2023-01-02 14:34:13', NULL, NULL, NULL),
       ('GUHItfgKlQ', 'R01', 'bee', '202CB962AC59075B964B07152D234B70', 'Tráº§n NhÃ n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2022-07-08 14:11:27', '2023-01-02 14:34:13', NULL, NULL, NULL),
       ('hADJi98tF6', 'R02', 'nh1an333', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 20:44:32', '2023-01-02 20:44:32', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0gG\Ññ÷û\ÅÀLK®X\0Iö\î5\é\Ü\'þ±ST\"2lÿ\ç+[ö\åô\Ò\ç\Çv}ª--©\0ú$\ç®Z\"C5ñ¨\ÍYs¬\ã°ðN69ZF\î)¡\æ¯0¦1\âe§=6ûñÍu·jqICR\âú$3þ,J;ø\ÞwK',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*v\Õ\ä|Fg]\àÆ\í\ê\'ª=¢'),
       ('OfHEehhBxX', 'R02', 'nhanit', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2022-07-08 17:57:05', '2023-01-02 14:34:13', NULL, NULL, NULL),
       ('QTCoNRylti', 'R01', 'nhan123', '202CB962AC59075B964B07152D234B70', 'Huá»³nh Há»¯u ÄÃ´ng', '094783333',
        'huudong1512@gmail.com', 'BiÃªn HÃ²a', '2022-07-01 21:23:04', '2023-01-02 14:34:13', NULL, NULL, NULL),
       ('qXuQr5x2TX', 'R02', 'nhan333', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 14:33:17', '2023-01-02 14:33:17', NULL,
        _binary '0¸0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0\0ù\ÅeþºE\rD\Èv«÷;+°¿\æp¿Z\æ,ý\êÏ¬j1\ÎpMø\Î*¹\ã\É\nW6v-uTÆ5rk\Ê\ÜaG@C\ÄJkyÁ¼¨p(Eò\ÂCW#\Ö²FC÷:5Å}nmÿz¸\îLG¶zxôÀº£÷­|\Ì ð\Ã\Ï',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*R¯4\Ò\éC÷\Ý3ªW;³Z\ç'),
       ('SezIZJkJtI', 'R02', 'thanhnhan', 'BB4E31F2D20F8E7F88E2B8459263657F', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 04:10:12', '2023-01-02 04:10:12', NULL,
        _binary '0¸0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0\0°¨v®j-@d\â\'eyL\'M%¡·\Ï\×c\'Ò­«*4\é¼\åj£`H«Ì¶TX¬C\Ð^p¾ú«·X\í\áV\ëÿúN¿ªm!¾\È<l\ï¹w7.ð(\ÞÀf\Ä\Ç|/\"R\'\n7£Á\ËzK\Z\ÂÔ,{±z¿\í±i²ñz',
        _binary '0L\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0q![\ç\ÓE§\Ü=¦Q;\"Uª'),
       ('su6q9PWjdm', 'R02', 'nhan3332', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'tthanhnhan1512@gmail.com', 'Quáº­n 6', '2023-01-02 18:46:13', '2023-01-02 18:46:13', NULL,
        _binary '0·0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0:üW\á¯-\0¢vdpm\Ï^þp\ï\Éÿ?¡_ñµ²-NK<¹×h\ß\×Ü°\È~.ªuc\ÄNeµû\ÕÁM5\Í\ã\Ì=ªÿ4\ì9\Ù_5b¶7N\äÝx<5\é\ï!¶ô­b\å`ÿ\Ä\ÔÊ¯Oº·Dth\ãSÏª$ø\Ô',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*/\">÷c­\×y±n\Å{=7\ïX'),
       ('US01', 'R01', 'nhan', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0946286953',
        'nhanvapp@gmail.com', 'TÃ¢n HÃ²a ÄÃ´ng PhÆ°á»ng 12 Quáº­n 6', '2022-04-19 20:27:23', '2023-01-02 14:34:13',
        NULL,
        _binary '0¸0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0\0¤\Ó\Ü_ó,\×\Õ<÷þ½þÀ\ì\"\ÃÍ¾s\ØRµ\Ü_Ök\ÛLb=³\àk\èn)\"R¸\0M[B\ç\"*\È#È:pXv±\Ó\êb\ZùÀ5\ç&¥m´k\ï$­¦ib§¶W§:H:\ï]÷R\ËS«?¥\à¿#±\ïO\ìÒCö',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*FP!{õkPK´Dg~óH<'),
       ('XcdtueGFss', 'R02', 'nhan123123', '202CB962AC59075B964B07152D234B70', 'Tráº§n Thanh NhÃ¢n', '0947834538',
        'nhanvapp@gmail.com', 'Quáº­n 6', '2023-01-03 08:36:31', '2023-01-03 08:36:31', NULL,
        _binary '0¸0,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*\0\0\Ôùð\Çi\ä\í	«\Úes[\È\ÕOEÎ³)Dhe±kZ\ÌB³oCX³¦KY\Ç&\Ö\Îtû¶:7R}xx¼¡1ÂÀ Þ¹?²ýc[8³¨!cy01ÍOð\äCÊ³A®\nÍ(U¡Y¹öZf|hº¾7/ \"\Ù=',
        _binary '0K\00,*H\Î80\0ýSu)R\ßJ.\ì\ä\çö·R<\ïD\0\Ã?¶Q&iE]@\"QûY=Xú¿\Åõº0öËUl×;4oòf`·kP¥¤\è{\"\ÂO»©\×þ·\Æø;W\çÆ¨¦ûö\Ó\Å\Ã5TZ2öuó®+a\×*\ïò\"\ÑH\Ç\0`P#Ì²¹¢\ëðXõ\0÷á Ö=\ÞË¼«\\6¸W¹y¯»ú:\êùWL=gQYWº\ÔYO\æq´Iq#\èL(·\Ï	2È¦\á<zT|(à£®+³¦un£ú!5bñûbz$;Ì¤ñ¾¨Q¨\ß\áZ\åf^{U%dL;þ\ÏI*`Á\ç\åm¨\ÂRg±eT\äú²e'),
       ('z9OMq6ZMOs', 'R02', 'nhan12323', '202CB962AC59075B964B07152D234B70', 'Huá»³nh Nháº­t HÃ²a', '0947834132',
        'hoahuynh@gmail.com', 'Quáº­n 6, ThÃ nh phá» Há» ChÃ­ Minh', '2022-06-19 14:39:21', '2023-01-02 14:34:13',
        NULL, NULL, NULL),
       ('ZFenUBYDrv', 'R02', 'nguyen', '202CB962AC59075B964B07152D234B70', 'Nguyá»n Thá» Kim NgÃ¢n', '0947123123',
        'ngannguyen@gmai.com', 'ThÃ nh phá» Há» ChÃ­ Minh', '2022-06-19 15:04:20', '2023-01-02 14:34:13', NULL, NULL,
        NULL);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `category_id`   varchar(10)                        NOT NULL,
    `category_name` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `createdAt`     timestamp DEFAULT 0,
    `modifiedAt`    timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`     timestamp                          NULL,
    `category_slug` varchar(255)                       NOT NULL,
    PRIMARY KEY (`category_id`, `category_name`)
);
INSERT INTO `category`
VALUES ('CDtq2zCCDa', 'Phụ kiện ngoại', '2022-07-08 14:10:47', '2022-07-08 19:39:11', NULL, 'phu-kien-ngoai'),
       ('CY001', 'Điện thoại', '2022-04-17 13:22:59', '2022-07-08 19:05:07', NULL, 'ien-thoai'),
       ('CY002', 'Laptop & Macbook', '2022-04-17 13:22:59', '2022-04-21 09:59:57', NULL, 'laptop-macbook'),
       ('CY003', 'Tivi - Màn hình TV', '2022-04-17 13:22:59', '2022-04-21 09:59:57', NULL, 'tivi'),
       ('CY004', 'Màn hình máy tính', '2022-04-17 13:22:59', '2022-04-21 10:00:05', NULL, 'man-hinh-may-tinh'),
       ('CY005', 'PC - Máy tính đồng bộ', '2022-04-17 13:22:59', '2022-04-21 09:59:58', NULL, 'may-tinh'),
       ('fQP2yUh1SI', 'Phụ kiện Macbook', '2022-07-08 14:08:01', '2022-07-08 17:30:14', NULL, 'phu-kien-macbook'),
       ('FvrL2tlCE3', 'ádasdsa', '2022-07-09 10:53:22', '2022-07-09 10:53:22', NULL, 'adasdsa');

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`
(
    `inventory_id` varchar(10) NOT NULL,
    `quantity`     int         NOT NULL,
    `createdAt`    timestamp DEFAULT 0,
    `modifiedAt`   timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`    timestamp   NULL,
    PRIMARY KEY (`inventory_id`)
);
INSERT INTO `inventory`
VALUES ('1HD13sEirO', 50, '2022-06-24 13:15:37', '2022-06-24 13:15:37', NULL),
       ('7gRKe0UyxY', 123, '2022-06-24 18:29:08', '2022-06-24 18:29:08', NULL),
       ('9i5c4NanFE', 123, '2022-07-01 19:18:43', '2022-07-01 19:18:43', NULL),
       ('9URRnQMkBB', 26, '2022-06-24 13:16:25', '2022-06-24 13:16:25', NULL),
       ('a8n7CsV19Y', 50, '2022-06-24 13:11:45', '2022-06-24 13:11:45', NULL),
       ('AdcP17HWLF', 123, '2022-07-08 15:37:44', '2022-07-08 15:37:44', NULL),
       ('BIzKjIZaMx', 12312, '2022-07-05 18:32:07', '2022-07-05 18:32:07', NULL),
       ('cJXuW9OB6Z', 133, '2022-07-06 18:44:08', '2022-07-06 18:44:08', NULL),
       ('ckCWcJeF1i', 123, '2022-07-02 00:03:04', '2022-07-02 00:03:04', NULL),
       ('DHYmWkT37q', 123123, '2022-06-24 14:17:53', '2022-06-24 14:17:53', NULL),
       ('gQ5HhraYcn', 50, '2022-06-24 13:11:10', '2022-06-24 13:11:10', NULL),
       ('iMPuYrL6DQ', 50, '2022-06-24 13:09:41', '2022-06-24 13:09:41', NULL),
       ('IN111', 23, '2022-04-17 13:22:59', '2023-01-02 15:42:59', NULL),
       ('IN112', 11, '2022-04-17 13:22:59', '2023-01-03 08:42:18', NULL),
       ('IN113', 7, '2022-04-17 13:22:59', '2023-01-03 08:38:45', NULL),
       ('IN114', 15, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN115', 17, '2022-04-17 13:22:59', '2023-01-02 15:48:49', NULL),
       ('IN116', 20, '2022-04-17 13:22:59', '2023-01-02 15:48:49', NULL),
       ('IN117', 22, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN118', 23, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN119', 12, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN120', 14, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN121', 16, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN122', 11, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN401', 19, '2022-04-17 13:22:59', '2023-01-02 18:46:25', NULL),
       ('IN402', 18, '2022-04-17 13:22:59', '2023-01-02 18:46:25', NULL),
       ('IN403', 22, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN404', 0, '2022-04-17 13:22:59', '2022-04-19 14:18:04', NULL),
       ('IN405', 29, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN406', 36, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN407', 0, '2022-04-17 13:22:59', '2022-04-19 14:18:03', NULL),
       ('IN408', 24, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN409', 12, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN410', 39, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN411', 21, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IN412', 25, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY100', 23, '2022-04-17 13:22:59', '2022-06-23 21:01:25', NULL),
       ('IY101', 24, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY102', 14, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY103', 10, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY104', 17, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY105', 25, '2022-04-17 13:22:59', '2022-06-23 19:19:55', NULL),
       ('IY106', 12, '2022-04-17 13:22:59', '2022-07-08 14:34:15', NULL),
       ('IY107', 7, '2022-04-17 13:22:59', '2023-01-02 18:06:29', NULL),
       ('IY108', 23, '2022-04-17 13:22:59', '2022-06-23 22:20:54', NULL),
       ('IY109', 6, '2022-04-17 13:22:59', '2022-07-08 21:31:37', NULL),
       ('IY110', 0, '2022-04-17 13:22:59', '2022-07-08 03:54:36', NULL),
       ('IY201', 13, '2022-04-17 13:22:59', '2023-01-02 20:40:23', NULL),
       ('IY202', 30, '2022-04-17 13:22:59', '2023-01-03 08:42:18', NULL),
       ('IY203', 50, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY204', 15, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY205', 10, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY206', 2, '2022-04-17 13:22:59', '2023-01-02 18:16:35', NULL),
       ('IY207', 30, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY208', 20, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY209', 40, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY210', 12, '2022-04-17 13:22:59', '2022-07-06 19:16:23', NULL),
       ('IY211', 20, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY212', 0, '2022-04-17 13:22:59', '2022-07-08 01:15:46', NULL),
       ('IY213', 10, '2022-04-17 13:22:59', '2023-01-02 18:03:20', NULL),
       ('IY214', 5, '2022-04-17 13:22:59', '2023-01-02 18:03:20', NULL),
       ('IY215', 14, '2022-04-17 13:22:59', '2023-01-02 03:01:00', NULL),
       ('IY216', 17, '2022-04-17 13:22:59', '2023-01-02 15:33:58', NULL),
       ('IY217', 21, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY218', 0, '2022-04-17 13:22:59', '2022-04-19 14:18:04', NULL),
       ('IY219', 23, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY220', 12, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY221', 8, '2022-04-17 13:22:59', '2022-07-08 00:59:10', NULL),
       ('IY222', 16, '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IY223', 7, '2022-04-17 13:22:59', '2023-01-02 16:07:38', NULL),
       ('KQYcvvrkha', 123, '2022-06-24 18:29:01', '2022-06-24 18:29:01', NULL),
       ('M4bt8iWpeX', 123, '2022-06-24 18:29:03', '2022-06-24 18:29:03', NULL),
       ('MIOhhG9cXt', 123123, '2022-07-05 18:31:53', '2022-07-05 18:31:53', NULL),
       ('ncbBjN1Rp5', 123, '2022-06-24 18:29:06', '2022-06-24 18:29:06', NULL),
       ('OdToAFN7QR', 12, '2022-07-01 23:58:40', '2022-07-01 23:58:40', NULL),
       ('Sm5mrin6yq', 13, '2022-07-08 00:48:04', '2022-07-08 00:49:12', NULL),
       ('UM2RmLViOg', 12312, '2022-06-24 17:19:24', '2022-06-24 17:19:24', NULL),
       ('vIC4KC1AMg', 123, '2022-06-24 18:27:31', '2022-06-24 18:27:31', NULL),
       ('wV3jDcuu8d', 123, '2022-07-02 00:02:47', '2022-07-02 00:02:47', NULL),
       ('yyknVMlOFm', 3123123, '2022-06-24 17:18:48', '2022-06-24 17:18:48', NULL);

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`
(
    `discount_id`      varchar(10)  NOT NULL,
    `discount_desc`    varchar(255) NOT NULL,
    `discount_percent` float        NOT NULL,
    `discount_active`  tinyint(1)   NOT NULL              DEFAULT '1',
    `discount_name`    varchar(255) CHARACTER SET utf8mb3 DEFAULT 'Sự kiện giảm giá',
    `createdAt`        timestamp                          DEFAULT 0,
    `modifiedAt`       timestamp                          DEFAULT current_timestamp,
    `deletedAt`        timestamp    null,
    PRIMARY KEY (`discount_id`)
);
INSERT INTO `discount`
VALUES ('hXik2G5gJx', 'Giảm giá các mặt hàng tồn kho', 0.2, 1, 'Mừng tết', '2022-07-08 04:09:16', '2022-07-08 04:09:16',
        '2022-07-08 04:09:16'),
       ('OjEneRjEAX', 'Siêu sale 1/9', 0.1, 1, 'Giảm lớn mừng Xuân 2', '2022-07-08 14:11:52', '2022-07-08 14:11:52',
        '2022-07-08 14:11:52'),
       ('Seo6Kxou8F', 'Siêu sale 1/9', 0.1, 1, 'Siêu sale 1/9', '2022-07-08 00:40:39', '2022-07-08 00:40:39',
        '2022-07-08 00:40:39');

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `product_id`    varchar(10)                        NOT NULL,
    `product_name`  varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `product_desc`  text CHARACTER SET utf8mb3         NOT NULL,
    `product_price` decimal(16, 2)                     NOT NULL,
    `category_id`   varchar(10)                        NOT NULL,
    `inventory_id`  varchar(10)                        NOT NULL,
    `discount_id`   varchar(10) DEFAULT NULL,
    `createdAt`     timestamp   DEFAULT 0,
    `modifiedAt`    timestamp   DEFAULT current_timestamp ON UPDATE current_timestamp,
    `product_sku`   varchar(20) DEFAULT NULL,
    `product_slug`  varchar(255)                       NOT NULL,
    PRIMARY KEY (`product_id`),
    KEY `category_id` (`category_id`),
    KEY `discount_id` (`discount_id`),
    KEY `inventory_id` (`inventory_id`),
    CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
    CONSTRAINT `product_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`),
    CONSTRAINT `product_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`)
);
INSERT INTO `product`
VALUES ('PT107', 'PC Acer Aspire TC-865',
        '<p>CPU: Intel Core i3-9100 (3.6 GHz up to 4.20 GHz/6MB/4 nhân, 4 luồng)</p><p>RAM: 1 x 4GB DDR4 2666MHz (2 Khe cắm, Hỗ trợ tối đa 32GB)</p><p>Đồ họa: Intel UHD Graphics 630</p><p>Lưu trữ: 1TB HDD 7200RPM</p>',
        9690000.00, 'CY005', 'IY107', 'OjEneRjEAX', '2022-04-17 13:22:59', '2022-07-08 22:10:23', '7753855888',
        'pc-acer-aspire-tc-865'),
       ('PT109', 'PC Dell OptiPlex 3080 MT',
        '<p>CPU: Intel Core i5-10500 (3.10 GHz - 4.50 Ghz/12MB/6 nhân, 12 luồng)</p><p>RAM: 1 x 8GB DDR4 2666MHz (2 Khe cắm, Hỗ trợ tối đa 64GB)</p><p>Đồ họa: Intel UHD Graphics 630</p><p>Lưu trữ: 1TB HDD 7200RPM</p>',
        14290000.00, 'CY005', 'IY109', 'hXik2G5gJx', '2022-04-17 13:22:59', '2022-07-08 17:29:21', '0240228221',
        'pc-dell-optiplex-3080-mt'),
       ('PT110', 'PC HP 280 G4 MT 4LW12PA',
        '<p>CPU: Intel Core i5-8400 ( 2.80 GHz - 4.0 GHz / 9MB / 6 nhân, 6 luồng )\n        </p><p>RAM: 1 x 4GB DDR4 2666MHz\n        </p><p>Đồ họa: Intel UHD Graphics 630 / GeForce GT 730 2GB\n        </p><p>Lưu trữ: 500GB HDD 7200RPM</p>',
        12590000.00, 'CY005', 'IY110', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '0653369026',
        'pc-hp-280-g4-mt-4lw12pa'),
       ('PT201', 'Smart Tivi OLED LG 4K 55 inch 55C1PTB',
        '<p>Kích thước: 55\"</p><p>Độ phân giải: 3840 x 2160 / 4K</p><p>Hệ điều hành: WebOS</p><p>Kết nối mạng: LAN, WiFi, Bluetooth</p><p>Cổng xuất hình: 4 x HDMI</p>',
        36990000.00, 'CY003', 'IY201', NULL, '2022-04-17 13:22:59', '2022-07-08 04:09:57', '2283230265',
        'smart-tivi-oled-lg-4k-55-inch-55c1ptb'),
       ('PT202', 'Smart Tivi OLED LG 4K 48 inch 48C1PTB',
        '<p>Kích thước: 48\"</p><p>Độ phân giải: 3840 x 2160 / 4K</p><p>Hệ điều hành: WebOS</p><p>Kết nối mạng: LAN, WiFi, Bluetooth</p><p>Cổng xuất hình: 4 x HDMI</p>',
        26990000.00, 'CY002', 'IY202', NULL, '2022-04-17 13:22:59', '2022-07-08 00:38:28', '4148037019',
        'smart-tivi-oled-lg-4k-48-inch-48c1ptb'),
       ('PT203', 'Smart Tivi Samsung 4K 55 inch UA55TU8100KXXV',
        '<p>Kích thước: 55\"</p><p>Độ phân giải: 3840 x 2160 / Ultra HD (4K)</p><p>Hệ điều hành: Tizen</p><p>Kết nối mạng: LAN, WiFi</p><p>Cổng xuất hình: 3 x HDMI</p>',
        16490000.00, 'CY003', 'IY203', 'hXik2G5gJx', '2022-04-17 13:22:59', '2022-07-08 22:11:10', '8152422380',
        'smart-tivi-samsung-4k-55-inch-ua55tu8100kxxv'),
       ('PT204', 'Smart Tivi Neo QLED Samsung 8K 65 inch QA65QN900AKXXV',
        '<p>Kích thước: 65\"</p><p>Độ phân giải: 7680 x 4320 / Full Ultra HD (8K)</p><p>Hệ điều hành: Tizen</p><p>Kết nối mạng: LAN, WiFi</p><p>Cổng xuất hình: 4 x HDMI</p>',
        104990000.00, 'CY003', 'IY204', 'OjEneRjEAX', '2022-04-17 13:22:59', '2022-07-08 19:05:47', '7033737608',
        'smart-tivi-neo-qled-samsung-8k-65-inch-qa65qn900akxxv'),
       ('PT205', 'Smart Tivi Neo QLED Samsung 4K 65 inch QA65QN90AAKXXV',
        '<p>Kích thước: 65\"</p><p>Độ phân giải: 3840 x 2160 / Ultra HD (4K)</p><p>Hệ điều hành: Tizen</p><p>Kết nối mạng: LAN, WiFi</p><p>Cổng xuất hình: 4 x HDMI</p>',
        48990000.00, 'CY003', 'IY205', 'OjEneRjEAX', '2022-04-17 13:22:59', '2022-07-08 22:11:17', '2345391434',
        'smart-tivi-neo-qled-samsung-4k-65-inch-qa65qn90aakxxv'),
       ('PT206', 'iPhone 12 128GB Black MGJA3VN/A',
        '<p>Kích thước: 32\"</p><p>Độ phân giải: 1366 x 768 / HD</p><p>Hệ điều hành: Android</p><p>Kết nối mạng: LAN</p><p>Cổng xuất hình: 2 x HDMI</p>',
        4690000.00, 'CY001', 'IY206', 'OjEneRjEAX', '2022-04-17 13:22:59', '2022-07-08 19:05:54', '4616219686',
        'iphone-12-128gb-black-mgja3vna'),
       ('PT207', 'TIVI ELED SMART ASANZO 65 Inch AS65SK900 (KÍNH CƯỜNG LỰC)',
        '<p>Kích thước: 65\"</p><p>Độ phân giải: 1920 x 1080 / Full HD</p><p>Hệ điều hành: Android</p><p>Kết nối mạng: LAN</p><p>Cổng xuất hình: 2 x HDMI</p>',
        16990000.00, 'CY003', 'IY207', 'hXik2G5gJx', '2022-04-17 13:22:59', '2022-07-08 22:12:38', '4224305686',
        'tivi-eled-smart-asanzo-65-inch-as65sk900-kinh-cuong-luc'),
       ('PT209', 'Smart tivi Casper 4K 65 inch 65UG6000',
        '<p>Kích thước: 65\"\n        </p><p>Độ phân giải: 3840 x 2160 / Ultra HD (4K)\n        </p><p>Hệ điều hành: Android 9.0\n        </p><p>Kết nối mạng: WiFi\n        </p><p>Cổng xuất hình: 3 x HDMI</p>',
        16990000.00, 'CY003', 'IY209', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:46', '8980999529',
        'smart-tivi-casper-4k-65-inch-65ug6000'),
       ('PT210', 'Android Tivi Casper 4K 65 inch 65EG8000',
        '<p>Kích thước: 65\"\n        </p><p>Độ phân giải: 3840 x 2160 / 4K\n        </p><p>Hệ điều hành: Android</p>',
        20990000.00, 'CY003', 'IY210', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:58', '1277645453',
        'android-tivi-casper-4k-65-inch-65eg8000'),
       ('PT211', 'Smart Tivi Casper 4K 55 inch 55UW6000 (55\")',
        '<p>Kích thước: 55\"\n        </p><p>Độ phân giải: 3840 x 2160 / Ultra HD (4K)\n        </p><p>Hệ điều hành: WebOS\n        </p><p>Kết nối mạng: WiFi, LAN\n        </p><p>Cổng xuất hình: 3 x HDMI</p>',
        11490000.00, 'CY003', 'IY211', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:47', '7500093361',
        'smart-tivi-casper-4k-55-inch-55uw6000-55'),
       ('PT212', 'Samsung Galaxy Note 10 (Aura Glow)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.3\" Dynamic AMOLED\n        </p><p>Camera sau: 16MP, 2x 12MP\n        </p><p>Camera trước: 10MP\n        </p><p>CPU: Exynos 9825\n        </p><p>Bộ nhớ: 256GB\n        </p><p>RAM: 8GB\n        </p><p>Hệ điều hành: Android</p>',
        20690000.00, 'CY001', 'IY212', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '6341617337',
        'samsung-galaxy-note-10-aura-glow'),
       ('PT213', 'Samsung Galaxy Note 10 (Aura Black)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.3\" Dynamic AMOLED\n        </p><p>Camera sau: 16MP, 2x 12MP\n        </p><p>Camera trước: 10MP\n        </p><p>CPU: Exynos 9825\n        </p><p>Bộ nhớ: 256GB\n        </p><p>RAM: 8GB\n        </p><p>Hệ điều hành: Android</p>',
        20690000.00, 'CY001', 'IY213', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '3101624826',
        'samsung-galaxy-note-10-aura-black'),
       ('PT214', 'Samsung Galaxy Note 10+ (Aura White)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.8\" Dynamic AMOLED\n        </p><p>Camera sau: 16MP, TOF 3D, 2x 12MP\n        </p><p>Camera trước: 10MP\n        </p><p>CPU: Exynos 9825\n        </p><p>Bộ nhớ: 256GB\n        </p><p>RAM: 12GB\n        </p><p>Hệ điều hành: Android</p>',
        25690000.00, 'CY001', 'IY214', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '9207280318',
        'samsung-galaxy-note-10-aura-white'),
       ('PT215', 'Điện Thoại Di Động iPhone 11 Pro Max 256GB (Space gray)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.5\"\n        </p><p>Camera sau: 3x 12MP\n        </p><p>Camera trước: 12MP\n        </p><p>CPU: A13 Bionic\n        </p><p>Bộ nhớ: 256GB\n        </p><p>RAM: 4GB\n        </p><p>Hệ điều hành: IOS</p>',
        37690000.00, 'CY001', 'IY215', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '3182672621',
        'ien-thoai-di-ong-iphone-11-pro-max-256gb-space-gray'),
       ('PT216', 'Điện Thoại Di Động iPhone 11 Pro Max 512GB (Midnight Green)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.5\"\n        </p><p>Camera sau: 3x 12MP\n        </p><p>Camera trước: 12MP\n        </p><p>CPU: A13 Bionic\n        </p><p>Bộ nhớ: 512GB\n        </p><p>RAM: 4GB\n        </p><p>Hệ điều hành: IOS</p>',
        43490000.00, 'CY001', 'IY216', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '1809380243',
        'ien-thoai-di-ong-iphone-11-pro-max-512gb-midnight-green'),
       ('PT218', 'Samsung Galaxy A12 (2021) (4GB/128GB) (Xanh)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.5\" PLS TFT LCD\n        </p><p>Camera sau: 48MP, 5MP, 2x 2MP\n        </p><p>Camera trước: 8MP\n        </p><p>CPU: Exynos 850\n        </p><p>Bộ nhớ: 128GB\n        </p><p>RAM: 4GB\n        </p><p>Hệ điều hành: Android</p>',
        4160000.00, 'CY001', 'IY218', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '7979732495',
        'samsung-galaxy-a12-2021-4gb128gb-xanh'),
       ('PT219', 'iPhone 12 Pro Max 256GB Pacific Blue MGDF3VN/A',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.7\" Super Retina XDR\n        </p><p>Camera sau: 3x 12MP\n        </p><p>Camera trước: 12MP\n        </p><p>CPU: Apple A14 Bionic\n        </p><p>Bộ nhớ: 256GB\n        </p><p>RAM: 6GB\n        </p><p>Hệ điều hành: IOS</p>',
        34990000.00, 'CY001', 'IY219', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '5114999262',
        'iphone-12-pro-max-256gb-pacific-blue-mgdf3vna'),
       ('PT220', 'Samsung Galaxy S21+ 5G (8+128GB) SM-G996BZVDXXV (Phantom Violet)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.7\" Flat FHD+\n        </p><p>Camera sau: 2x 12MP, 64MP\n        </p><p>Camera trước: 10MP\n        </p><p>Bộ nhớ: 128GB\n        </p><p>RAM: 8GB\n        </p><p>Hệ điều hành: Android</p>',
        23390000.00, 'CY001', 'IY220', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '9107523747',
        'samsung-galaxy-s21-5g-8128gb-sm-g996bzvdxxv-phantom-violet'),
       ('PT221', 'Samsung Galaxy S21+ 5G (8+128GB) SM-G996BZSDXXV (Silver)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n        </p><p>Màn hình: 6.7\" Flat FHD+\n        </p><p>Camera sau: 2x 12MP, 64MP\n        </p><p>Camera trước: 10MP\n        </p><p>Bộ nhớ: 128GB\n        </p><p>RAM: 8GB\n        </p><p>Hệ điều hành: Android</p>',
        19900000.00, 'CY001', 'IY221', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '2658181278',
        'samsung-galaxy-s21-5g-8128gb-sm-g996bzsdxxv-silver'),
       ('PT222', 'Samsung Galaxy Z Flip, 256GB (SM-F700FZKDXEV) (Đen)',
        '<p>Chính hãng, Mới 100%, Nguyên seal</p><p>Màn hình: Main display: 6.7\' FHD+ (2636x1080) - Dynamic AMOLED Display (21.9:9)</p><p>Cover Display: 1.1\' (300x112) Super AMOLED Display</p><p>Camera sau: 2x 12MP</p><p>Camera trước: 10MP</p><p>CPU: Snapdragon 855+</p><p>Bộ nhớ: 256GB</p><p>RAM: 8GB</p><p>Hệ điều hành: Android</p>',
        33590000.00, 'CY001', 'IY222', 'OjEneRjEAX', '2022-04-17 13:22:59', '2022-07-08 22:12:49', '9862830619',
        'samsung-galaxy-z-flip-256gb-sm-f700fzkdxev-en'),
       ('PT223', 'Samsung Galaxy S21 Ultra 5G (12+128GB) SM-G998BZKDXXV (Black)',
        '<p>Màn hình 6.55\", Chip Snapdragon 732G\n        </p><p>RAM 8 GB, ROM 128 GB\n        </p><p>Camera sau: Chính 64 MP & Phụ 8 MP, 5 MP\n        </p><p>Camera trước: 16 MP\n        </p><p>Pin 4250 mAh, Sạc 33 W</p>',
        27890000.00, 'CY001', 'IY223', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:57', '7746072780',
        'samsung-galaxy-s21-ultra-5g-12128gb-sm-g998bzkdxxv-black'),
       ('PT401', 'Màn hình LCD ACER K222HQL (1920 x 1080/TN/60Hz/5 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 21.5\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền TN, Góc nhìn: 90 (H) / 65 (V)\n          </p><p>Tần số quét: 60Hz , Thời gian phản hồi 5 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh: , 1 x HDMI, 1 x DVI-D, 1 x VGA/D-sub</p>',
        3290000.00, 'CY004', 'IN401', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '2895946358',
        'man-hinh-lcd-acer-k222hql-1920-x-1080tn60hz5-ms'),
       ('PT402', 'Màn hình LCD ACER VG270 S (1920 x 1080/IPS/2 ms/FreeSync)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 27\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền IPS\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          -Thời gian phản hồi 2 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Công nghệ đồng bộ: FreeSync\n          </p><p>Cổng hình ảnh: 1 x DisplayPort, 2 x HDMI</p>',
        6690000.00, 'CY004', 'IN402', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '3538423312',
        'man-hinh-lcd-acer-vg270-s-1920-x-1080ips2-msfreesync'),
       ('PT403', 'Màn hình LCD ACER AOPEN CV1 22CV1Q (1920 x 1080/VA/75Hz/5 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 21.5\" (1920 x 1080)\n          </p><p>Tấm nền VA\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 75Hz\n          </p><p>Thời gian phản hồi 5 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh:1 x HDMI, 1 x VGA/D-sub</p>',
        3490000.00, 'CY004', 'IN403', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '0902277814',
        'man-hinh-lcd-acer-aopen-cv1-22cv1q-1920-x-1080va75hz5-ms'),
       ('PT404', 'Màn hình LCD ASUS ProArt PA248QV (1920 x 1200/IPS/75Hz/5 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 24\" (1920 x 1200)\n          </p><p>Tỷ lệ 16:10\n          </p><p>Tấm nền IPS\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 75Hz\n          -Thời gian phản hồi 5 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh: 1 x DisplayPort, 1 x HDMI, 1 x VGA/D-sub</p>',
        5790000.00, 'CY004', 'IN404', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '8480461256',
        'man-hinh-lcd-asus-proart-pa248qv-1920-x-1200ips75hz5-ms'),
       ('PT405', 'Màn hình LCD ASUS TUF Gaming VG27AQ (2560 x 1440/IPS/165Hz/1 ms/G-Sync compatible)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 27\" (2560 x 1440)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền IPS\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 165Hz\n          </p><p>Thời gian phản hồi 1 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Công nghệ đồng bộ: G-Sync compatible\n          </p><p>Cổng hình ảnh: 1 x DisplayPort 1.2, 2 x HDMI 2.0</p>',
        11990000.00, 'CY004', 'IN405', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '3045237756',
        'man-hinh-lcd-asus-tuf-gaming-vg27aq-2560-x-1440ips165hz1-msg-sync-compatible'),
       ('PT406', 'Màn hình LCD ASUS VP228HE (1920 x 1080/TN/60Hz/1 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 22\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền TN\n          </p><p>Góc nhìn: 90 (H) / 65 (V)\n          </p><p>Tần số quét: 60Hz\n          </p><p>Thời gian phản hồi 1 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh: , 1 x HDMI 1.4, 1 x VGA/D-sub</p>',
        3860000.00, 'CY004', 'IN406', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '9222653446',
        'man-hinh-lcd-asus-vp228he-1920-x-1080tn60hz1-ms'),
       ('PT407', 'Màn hình LCD HP OMEN 6FN08AA (2560 x 1440/240Hz/1 ms/FreeSync)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 27\" (2560 x 1440)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Góc nhìn: 170 (H) / 160 (V)\n          </p><p>Tần số quét: 240Hz\n          </p><p>Thời gian phản hồi 1 ms\n          </p><p>Công nghệ đồng bộ: FreeSync\n          </p><p>Cổng hình ảnh: 1 x DisplayPort 1.4, 1 x HDMI 2.0</p>',
        18990000.00, 'CY004', 'IN407', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '2892193760',
        'man-hinh-lcd-hp-omen-6fn08aa-2560-x-1440240hz1-msfreesync'),
       ('PT408', 'Màn hình LCD HP M22f (1920 x 1080/IPS/75Hz/5 ms/FreeSync)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 21.5\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền IPS\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 75Hz\n          </p><p>Thời gian phản hồi 5 ms\n          </p><p>Công nghệ đồng bộ: FreeSync\n          </p><p>Cổng hình ảnh:1 x HDMI 1.4, 1 x VGA/D-sub</p>',
        3590000.00, 'CY004', 'IN408', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '2357544686',
        'man-hinh-lcd-hp-m22f-1920-x-1080ips75hz5-msfreesync'),
       ('PT409', 'Màn hình LCD HP P22va G4 (1920 x 1080/VA/60Hz/7 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 21.5\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền VA, Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 60Hz\n          </p><p>Thời gian phản hồi 7 ms\n          </p><p>Cổng hình ảnh:1 x HDMI, 1 x VGA/D-sub</p>',
        7990000.00, 'CY004', 'IN409', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '9127432310',
        'man-hinh-lcd-hp-p22va-g4-1920-x-1080va60hz7-ms'),
       ('PT410', 'Màn hình LCD MSI OPTIX MAG241C (1920 x 1080/VA/144Hz/1 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 23.6\" (1920 x 1080)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền VA\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 144Hz\n          </p><p>Thời gian phản hồi 1 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh: 1 x DisplayPort, 2 x HDMI 1.4</p>',
        7290000.00, 'CY004', 'IN410', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '0676124229',
        'man-hinh-lcd-msi-optix-mag241c-1920-x-1080va144hz1-ms'),
       ('PT411', 'Màn hình LCD MSI MP242v (1920 x 1080/IPS/75Hz/5 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal</p><p>Kích thước: 23.8\" (1920 x 1080)</p><p>Tỷ lệ 16:9</p><p>Tấm nền IPS</p><p>Góc nhìn: 178 (H) / 178 (V)</p><p>Tần số quét: 75Hz</p><p>Thời gian phản hồi 5 ms</p><p>HIển thị màu sắc: 16.7 triệu màu</p><p>Cổng hình ảnh: , 1 x HDMI 1.4, 1 x VGA/D-sub</p>',
        9890000.00, 'CY004', 'IN411', 'Seo6Kxou8F', '2022-04-17 13:22:59', '2022-07-08 22:11:34', '8813619678',
        'man-hinh-lcd-msi-mp242v-1920-x-1080ips75hz5-ms'),
       ('PT412', 'Màn hình LCD MSI Optix G27CQ4 (2560 x 1440/VA/165Hz/1 ms)',
        '<p>Chính hãng, Mới 100%, Nguyên seal\n          </p><p>Kích thước: 27\" (2560 x 1440)\n          </p><p>Tỷ lệ 16:9\n          </p><p>Tấm nền VA\n          </p><p>Góc nhìn: 178 (H) / 178 (V)\n          </p><p>Tần số quét: 165Hz\n          </p><p>Thời gian phản hồi 1 ms\n          </p><p>HIển thị màu sắc: 16.7 triệu màu\n          </p><p>Cổng hình ảnh: 1 x DisplayPort 1.2a, 2 x HDMI 2.0b</p>',
        11990000.00, 'CY004', 'IN412', NULL, '2022-04-17 13:22:59', '2022-07-01 23:03:48', '8216484961',
        'man-hinh-lcd-msi-optix-g27cq4-2560-x-1440va165hz1-ms'),
       ('PT511', 'Laptop Acer Nitro 5 AN515-52-51LW',
        '<p>CPU: Intel Core i5-8300H ( 2.3 GHz - 4.0 GHz / 8MB / 4 nhân, 8 luồng )\n        </p><p>Màn hình: 15.6\" IPS ( 1920 x 1080 ) , không cảm ứng\n        </p><p>RAM: 1 x 8GB DDR4 2666MHz\n        </p><p>Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce GTX 1050Ti 4GB GDDR5\n        </p><p>Lưu trữ: 128GB SSD M.2 SATA / 1TB HDD 5400RPM\n        </p><p>Hệ điều hành: Linux\n        </p><p>Pin: 4 cell 48 Wh Pin liền , khối lượng: 2.4 kg</p>',
        24040000.00, 'CY002', 'IN111', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '8636000832',
        'laptop-acer-nitro-5-an515-52-51lw'),
       ('PT512', 'Laptop Acer Aspire 5 A515-53G-5788 (NX.H7RSV.001) (15.6\" FHD/i5-8265U/4GB/1TB HDD/Free DOS/2.1 kg)',
        '<p>CPU: Intel Core i5-8265U ( 1.6 GHz </p><p>3.9 GHz / 6MB / 4 nhân, 8 luồng )\n        </p><p>Màn hình: 15.6\" ( 1920 x 1080 ) , không cảm ứng\n        </p><p>RAM: 1 x 4GB Onboard DDR4\n        </p><p>Đồ họa: Intel UHD Graphics 620 / NVIDIA GeForce MX130 2GB GDDR5\n        </p><p>Lưu trữ: 1TB HDD 5400RPM\n        </p><p>Hệ điều hành: Free DOS\n        </p><p>Pin: 3 cell 61 Wh Pin liền , khối lượng: 2.1 kg</p>',
        15490000.00, 'CY002', 'IN112', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '3774897806',
        'laptop-acer-aspire-5-a515-53g-5788-nxh7rsv001-156-fhdi5-8265u4gb1tb-hddfree-dos21-kg'),
       ('PT513',
        'Laptop ACER Nitro 5 Eagle AN515-57-54MV NH.QENSV.003 ( 15.6\" Full HD/ 144Hz/Intel Core i5-11400H/8GB/512GB SSD/NVIDIA GeForce RTX 3050/Windows 11/2.2kg)',
        '<p>CPU: Intel Core i5-11400H\n        </p><p>Màn hình: 15.6\" IPS (1920 x 1080), 144Hz\n        </p><p>RAM: 1 x 8GB DDR4 3200MHz\n        </p><p>Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics\n        </p><p>Lưu trữ: 512GB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Windows 11\n        </p><p>Pin: 4 cell 57 Wh Pin liền\n        </p><p>Khối lượng: 2.2 kg</p>',
        25490000.00, 'CY002', 'IN113', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '8412605628',
        'laptop-acer-nitro-5-eagle-an515-57-54mv-nhqensv003--156-full-hd-144hzintel-core-i5-11400h8gb512gb-ssdnvidia-geforce-rtx-3050windows-1122kg'),
       ('PT514',
        'Laptop ACER Swift 3 SF314-43-R4X3 NX.AB1SV.004 ( 14\" Full HD/AMD Ryzen 5 5500U/16GB/512GB SSD/Windows 11 Home/1.1kg)',
        '<p>CPU: AMD Ryzen 5 5500U\n        </p><p>Màn hình: 14\" IPS (1920 x 1080)\n        </p><p>RAM: 16GB Onboard LPDDR4X\n        </p><p>Đồ họa: AMD Radeon Graphics\n        </p><p>Lưu trữ: 512GB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Windows 11 Home\n        </p><p>Pin: 3 cell 48 Wh Pin liền\n        </p><p>Khối lượng: 1.1 kg</p>',
        19990000.00, 'CY002', 'IN114', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '0913347176',
        'laptop-acer-swift-3-sf314-43-r4x3-nxab1sv004--14-full-hdamd-ryzen-5-5500u16gb512gb-ssdwindows-11-home11kg'),
       ('PT515',
        'Laptop ASUS ROG Strix Scar 15 G533QR-HQ098T ( 15.6\" Quad HD (2K)/ 165Hz/AMD Ryzen 9 5900HX/16GB/1TB SSD/NVIDIA GeForce RTX 3070/Windows 10 Home 64-bit/2.3kg)',
        '<p>CPU: AMD Ryzen 9 5900HX\n        </p><p>Màn hình: 15.6\" IPS (2560 x 1440), 165Hz\n        </p><p>RAM: 1 x 16GB DDR4 3200MHz\n        </p><p>Đồ họa: NVIDIA GeForce RTX 3070 8GB GDDR6 / AMD Radeon Graphics\n        </p><p>Lưu trữ: 1TB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Windows 10 Home 64-bit\n        </p><p>Pin: 4 cell 90 Wh Pin liền\n        </p><p>Khối lượng: 2.3 kg</p>',
        57990000.00, 'CY002', 'IN115', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '3243031477',
        'laptop-asus-rog-strix-scar-15-g533qr-hq098t--156-quad-hd-2k-165hzamd-ryzen-9-5900hx16gb1tb-ssdnvidia-geforce-rtx-3070windows-10-home-64-bit23kg'),
       ('PT516',
        'Laptop ASUS TUF Gaming FX706HC-HX003T 90NR0733-M00460 ( 17.3\" Full HD/ 144Hz/Intel Core i5-11400H/8GB/512GB SSD/NVIDIA GeForce RTX 3050/Windows 10 Home 64-bit/2.6kg)',
        '<p>CPU: Intel Core i5-11400H\n        </p><p>Màn hình: 17.3\" IPS (1920 x 1080), 144Hz\n        </p><p>RAM: 1 x 8GB DDR4 2933MHz\n        </p><p>Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics\n        </p><p>Lưu trữ: 512GB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Windows 10 Home 64-bit\n        </p><p>Pin: 3 cell 48 Wh Pin liền\n        </p><p>Khối lượng: 2.6 kg</p>',
        26990000.00, 'CY002', 'IN116', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '0719716368',
        'laptop-asus-tuf-gaming-fx706hc-hx003t-90nr0733-m00460--173-full-hd-144hzintel-core-i5-11400h8gb512gb-ssdnvidia-geforce-rtx-3050windows-10-home-64-bit26kg'),
       ('PT517',
        'Laptop ASUS Zenbook UX363EA//HP130T ( 13.3 inch/Full HD/Intel EVO Core i5-1135G7/8GB/512GB SSD/Windows 10 Home 64-bit/1.3kg)',
        '<p>CPU: Intel Core i5-1135G7\n        </p><p>Màn hình: 13.3\" OLED (1920 x 1080)\n        </p><p>RAM: 1 x 8GB LPDDR4X 4266MHz\n        </p><p>Đồ họa: Intel Iris Xe Graphics\n        </p><p>Lưu trữ: 512GB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Windows 10 Home 64-bit\n        </p><p>Pin: 4 cell 67 Wh Pin liền\n        </p><p>Khối lượng: 1.3 kg\n        </p><p>Chuẩn Intel EVO</p>',
        27490000.00, 'CY002', 'IN117', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '6852919330',
        'laptop-asus-zenbook-ux363eahp130t--133-inchfull-hdintel-evo-core-i5-1135g78gb512gb-ssdwindows-10-home-64-bit13kg'),
       ('PT518', 'Laptop ASUS ROG Zephyrus GX703HS-K4016T 90NR06F1-M00290 ( 17.3',
        '<p>CPU: Intel Core i9-11900H</p><p>Màn hình: 17`.3\" IPS (2560 x 1440), 165Hz</p><p>RAM: 1 x 16GB, 16GB Onboard DDR4 3200MHz</p><p>Đồ họa: NVIDIA GeForce RTX 3080 16GB GDDR6 / Intel UHD Graphics</p><p>Lưu trữ: 2TB SSD M.2 NVMe</p><p>Hệ điều hành: Windows 10 Home 64-bit</p><p>Pin: 4 cell 90 Wh</p><p>Khối lượng: 2.6 kg`</p>',
        98990000.00, 'CY002', 'IN118', 'hXik2G5gJx', '2022-04-17 13:22:59', '2022-07-08 22:13:11', '2042072130',
        'laptop-asus-rog-zephyrus-gx703hs-k4016t-90nr06f1-m00290--173'),
       ('PT519',
        'Laptop MICROSOFT Surface Pro 7 QWT-00001 ( 12.3\" Intel Core i3-1005G1/4GB/128GB SSD/Windows 10/0.8kg)',
        '<p>Thiết kế tinh tế vượt xa mọi giới hạn\n        </p><p>Hiệu suất làm việc ấn tượng Intel Core i3 thế hệ 10 và RAM 4GB\n        </p><p>Màn hình cảm ứng tiện dụng\n        </p><p>Thời lượng pin bền bỉ lên đến 10 giờ và hỗ trợ cổng kết nối đa năng\n        </p><p>Bàn phím và bút thông minh của Surface Pro 7</p>',
        23290000.00, 'CY002', 'IN119', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '7090718497',
        'laptop-microsoft-surface-pro-7-qwt-00001--123-intel-core-i3-1005g14gb128gb-ssdwindows-1008kg'),
       ('PT520',
        'Laptop Doanh Nghiệp Dell Latitude 3520 70251603 ( 15.6inch HD/Intel Core i3-1115G4/4GB/256GB SSD/Fedora/1.8kg)',
        '<p>CPU: Intel Core i3-1115G4\n        </p><p>Màn hình: 15.6\" TN (1366 x 768)\n        </p><p>RAM: 1 x 4GB DDR4 3200MHz\n        </p><p>Đồ họa: Intel UHD Graphics\n        </p><p>Lưu trữ: 256GB SSD M.2 NVMe\n        </p><p>Hệ điều hành: Fedora\n        </p><p>Pin: 3 cell 41 Wh Pin liền\n        </p><p>Khối lượng: 1.8 kg</p>',
        15390000.00, 'CY002', 'IN120', NULL, '2022-04-17 13:22:59', '2022-05-08 21:04:54', '4432574052',
        'laptop-doanh-nghiep-dell-latitude-3520-70251603--156inch-hdintel-core-i3-1115g44gb256gb-ssdfedora18kg'),
       ('PT521', 'Laptop Dell Vostro 5410 V4I5214W ( 14',
        '<p>CPU: Intel Core i5-11320H</p><p>Màn hình: 14\" (1920 x 1080)</p><p>RAM: 1 x 8GB DDR4 3200MHz</p><p>Đồ họa: Intel Iris Xe Graphics</p><p>Lưu trữ: 512GB SSD M.2 NVMe</p><p>Hệ điều hành: Windows 10 Home SL 64-bit + Office Home and Student 2019</p><p>Pin: 4 cell 54 Wh Pin liền</p><p>Khối lượng: 1.4 kg</p>',
        20390000.00, 'FvrL2tlCE3', 'IN121', NULL, '2022-04-17 13:22:59', '2022-07-09 10:53:28', '7021657252',
        'laptop-dell-vostro-5410-v4i5214w--14'),
       ('PT522',
        'Laptop Doanh Nghiệp Dell Latitude 3520 3520-70251594 ( 15.6inch Full HD/Intel Core i5-1135G7/8GB/256GB SSD/Linux/1.8kg)',
        '<p>CPU: Intel Core i5-1135G7</p><p>Màn hình: 15.6\" WVA (1920 x 1080)</p><p>RAM: 1 x 8GB DDR4 3200MHz</p><p>Đồ họa: Intel Iris Xe Graphics</p><p>Lưu trữ: 256GB SSD M.2 NVMe</p><p>Hệ điều hành: Linux</p><p>Pin: 3 cell Pin liền</p><p>Khối lượng: 1.8 kg</p>',
        20390000.00, 'CY002', 'IN122', 'Seo6Kxou8F', '2022-04-17 13:22:59', '2022-07-08 22:13:18', '4613598523',
        'laptop-doanh-nghiep-dell-latitude-3520-3520-70251594--156inch-full-hdintel-core-i5-1135g78gb256gb-ssdlinux18kg');

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`
(
    `image_id`   varchar(10)  NOT NULL,
    `product_id` varchar(10) DEFAULT NULL,
    `image_url`  varchar(255) NOT NULL,
    `createdAt`  timestamp   DEFAULT 0,
    `modifiedAt` timestamp   DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp    NULL,
    PRIMARY KEY (`image_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);
INSERT INTO `image`
VALUES ('8XYZSWsfhd', 'PT521', '/electronic-1.0-SNAPSHOT/assets/uploadFiles/iphone-11-vang-1-2-org.jpg',
        '2022-07-09 10:53:11', '2022-07-09 10:53:11', NULL),
       ('c4AUbiTyFw', 'PT521', '/electronic-1.0-SNAPSHOT/assets/uploadFiles/iphone-11-trang-1-2-org.jpg',
        '2022-07-09 10:53:11', '2022-07-09 10:53:11', NULL),
       ('IMG1332', 'PT107',
        'https://lh3.googleusercontent.com/Bia0JHssxdERtMMQKfWcYVWzFoTVev7Ou2AaUYM-LCo2FEpSBet47IRw_p56t48_Momf7ZOY6PFRj3KKjDs=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1333', 'PT107',
        'https://lh3.googleusercontent.com/FSeZZiBkESQgEHC6BOIfway19id_Jlq3b0rSsxbBN0lzanAJM0a-yZDdb8Qkt4N4KR6f4vG6PhbJWGjwQKUI=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1334', 'PT107',
        'https://lh3.googleusercontent.com/8wEd6j8hFQmspYy5P6bYFFWozgL96mVojqqgWldJxbE7FBq_tF4uxvXaJYquH2M9_t7nYl3L_M-p-SnBlxI=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1338', 'PT109',
        'https://lh3.googleusercontent.com/pG3UofKJsOFKFe98huDSzvpTeFgMJb9nj6gLrsu7Bw8P2mrKIIxH2Vlo9uMhWsr3RMuL_qpbATkA5qd4TCY=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1339', 'PT109',
        'https://lh3.googleusercontent.com/yOSUEeLi9dRWztjBft7v8009GQG8ezR3za9AKfAo8gsUI0rod-7aY5ugOQk6NKvSCcGz1N7txA3p6clQh3U=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1440', 'PT109',
        'https://lh3.googleusercontent.com/oLXooI78lLL0Gpxfcn1Eby1FqzCqp6jqCt2iG97guAGfKu1upqXxEjdZuI4nNaJA9UafFw_yRPYX79ZkQLk=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1441', 'PT110',
        'https://lh3.googleusercontent.com/rSeDccnu2QeAAFxJb7KR5y37D4xYZvEsqOEouen0NiGH0V9TSiwQVwujsfoFgb25i2Y_04fgQBly4B0zd1c=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1442', 'PT110',
        'https://lh3.googleusercontent.com/q0I6e4A7D6iKAJNGgNHmAXJijSU9ZqR93Dm7V7rAo_1JalctR4oLWjBzLUpjXObc1Cn9UitYvMWHnT--8g=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG1443', 'PT110',
        'https://lh3.googleusercontent.com/5flW3-8mNAhIOteDLdibuxO0ID5GXXvTJQ1y-Rm7rjwA8jHgFLIMbhNKSsSgkwpoeVRz2u1DMt86jrbVJxE=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG404', 'PT201',
        'https://lh3.googleusercontent.com/pq1VMxzEDHDw5MUMhsH23Zq4-JOmNZDEble5fLEgT-utZN3oj1ch8DTx7KrSzmDIO7Xif8Nz6l4ZrT7GHv1WMXmDNI1SVHzIZA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG405', 'PT201',
        'https://lh3.googleusercontent.com/WCZhar3ya1px5yNM90Eb6WgY2NWqj1ehBVIxmP8aQ2B9uRRFHJ8t9UfV61aBrFLKXT3g-HmK22v0CW_EPMhTccmcJnVNXV5H=w150-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG406', 'PT201',
        'https://lh3.googleusercontent.com/wykAvJEPX08DHGubDZofjVBYJvGA2x4PCOEhGxkRrurk0OkVw1p71TAEcOjSB0LFamrfFAlkQ3YAoPqop_xWyhOK_iRYqGmn=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG407', 'PT202',
        'https://lh3.googleusercontent.com/GFlSvTcAGD1oHOz9eB8LnUOimyivhmp1zI-euzNZG4XSmxwolEkWbVuIwz_vxW7SYbIgztG1e6hyBJXNbuVuOoPJBHFNCHUQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG408', 'PT202',
        'https://lh3.googleusercontent.com/p82qHXfX-ZrC2QAdKU9C364tVGIH_zqlqiQRbUfClwvJf2jPCGfd7xB-KlJDnlU1iEG1LwNItC5xIsXbeMlLUvRzVd_R3PYo=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG409', 'PT202',
        'https://lh3.googleusercontent.com/0VHqrAj2Jm2-oJ_vD_SCMshOtFO8Bo0AT3dqXTIC1X8rZV9RVV6OzXMJl1xTOY8GczxoGca4esPBqn5r9fBBCga6cHvwJozO=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG410', 'PT203',
        'https://lh3.googleusercontent.com/7-6CQSePTfy73qXCAbDytGIOP5ogO0MVA63IjwwHshmhnjoXxs71i5ueYrOY9Rvv9xOvqLPxkmVIsgl8Nxs=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG411', 'PT203',
        'https://lh3.googleusercontent.com/gFWY0mhfkv1GhKJUjhXLD_oVtJDsq9SV2Z24VDpwYpWYb3ifn4N8UhLV3fdQEzfO-rY-eq-jEetZozlI90Q=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG412', 'PT203',
        'https://lh3.googleusercontent.com/jm_9ph7MQU5hBp3GxvHQ1VVsmnXfupokDRYqIvRpmUYsWWRpti5HfzPRo09_Q4mghaYOBAUXDCl3cZ4fkw=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG413', 'PT204',
        'https://lh3.googleusercontent.com/fwLO0hAhS3AzQp089_xlQUrGxoSuH-gKYpTU3yjmLwcH895fTzCceyz2B4TQKPnpcYrhASzsA_f7lBC495np=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG414', 'PT204',
        'https://lh3.googleusercontent.com/MUOknlqcA572Cv-gl9zua2iKw64DByocNbRaoqsNiDzG7fzmaSrnYJhsxnsz7ZRm0WLP0RrqPk_uivqt7jU=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG415', 'PT204',
        'https://lh3.googleusercontent.com/0NW-1FbNyUp7Kn3lXkzG4vVLOodTbo_usQB3ntE2EcwKSz7qflLFiIMXlka9eD35D1LjcTgaybnchxBJh6o=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG416', 'PT205',
        'https://lh3.googleusercontent.com/AtPqiF64g1VwWvO3MA3HRHrVFCPrtiBftgVzAmu_SO2aOYS37de7H4pUUzDoWnt09OnCYCe52FZ9C6Yx21kbnaHp986qOvnQow=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG417', 'PT205',
        'https://lh3.googleusercontent.com/SUjbgz6MmDMibymHncgSKt7mSEYpXUYZMtMPLOXxCabOq93A7Sa9vWh2h29bpwqLgYs5sH4gqeOKsWvsH_vEdSujcbeSry5a=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG418', 'PT205',
        'https://lh3.googleusercontent.com/zrx64ft9VPZL7CP-LF7r-NDOCqjJ93kg4GFHj2Y-f9AU44USFn7_4nm4pUQ8_0RXH4X8oNPiJSU_ZoKl2m9IUYiJo8KhKLLm=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG419', 'PT206',
        'https://lh3.googleusercontent.com/zc-nPoK5BW0OMhA4L9qROQdWpqX4eC3xwBure62okYp0v0r6orn_B_X0w7kdZHFO46CMDlUNM6JUSRe2wSY=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG422', 'PT207',
        'https://lh3.googleusercontent.com/L8TvYv3WTqIKTvrqpwjbSRN4iZ9m483k363UfbOR88wC2WYOvwd1es33b3ctL_0ZKv1NGYv75cN4TB6zJ4h-au7L1ZNtnJk7=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG423', 'PT207',
        'https://lh3.googleusercontent.com/PlHLQB5tYNsqS7DaZBb-SUJJUGIGFvWXt6_BjX5sSxG6PsMt45qWo8xuyhlsekZQnfpUTLDInWkRQPrq5UPrwyXwyx0B7hM=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG424', 'PT207',
        'https://lh3.googleusercontent.com/0lWKvSwX1iSMBdjp6Eh4zHW_rHy35GSjE8rVIJtuOqRZozamRFXvdG-QZc7RQvLzEuDkp_n-l1rUEFvR01-HDGG7Rz5CuPmVOA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG428', 'PT209',
        'https://lh3.googleusercontent.com/dlXxBaDz1ezPkN6OwOMFi66hG491QUWs4H4E8-gRY_QARhLA47HE6MjzNxCgCCPKPQ6MNZvixgcFS5OE1DT_M41E3-8TIbGJLA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG429', 'PT209',
        'https://lh3.googleusercontent.com/i59jIFoddfzG2OdsilcZAWokVPCmYARLvxJoq_oonf1AksibF_BHWIu94A2Pu2sJGKGf7BOzCNUMHgghcSJslO2s-0UNzn1M=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG430', 'PT209',
        'https://lh3.googleusercontent.com/DnKgIMq49YenpDLzCTr2zqLq8HJh5e1Ugfrp_DxkbGRBFlW1ZxtrEHjqTUyjoyFqnuiF8y1OPIs_cJ6luqbU8MbQh9dJWzE=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG431', 'PT210',
        'https://lh3.googleusercontent.com/ZlmVwDrrXmD99pLa19Q8zs-Afot_mPjR6HSR1pljPMxGvgjhw2gWEEC1_yER6l9Axd5adl5gR8dpFKShws-Ioy5JV5aKca3l=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG432', 'PT210',
        'https://lh3.googleusercontent.com/s9K6pQlWxQwsb1KCp0VnmgvzVzTTjJN-Hv1cYKJaYJqsTx7mxYVmVCKon1eaP-eD5TY7jwOFjP_tokeSCAaHx2Xn8o1bAkuYBw=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG433', 'PT210',
        'https://lh3.googleusercontent.com/D2hlkRXa7Mem4ZHtHyySe2RBrwN2b-3zwz39kxhn030q8bF6V5qRTg8w1F3k9soSZu9od9cDJ7sD8UB7kf3nMJxvr4rvw4q5=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG434', 'PT211',
        'https://lh3.googleusercontent.com/bRlnthS-qPPH_bWe_MDO8W1t8DJ14016asCyTn9cRggXF0QU2H_xShtU3J0jmzO4WBa1gLUYwtQegNOcyBB9Tt_q33p3mOZ_7Q=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG435', 'PT211',
        'https://lh3.googleusercontent.com/it3vj18r6u1Ehnc0-2prjEfA_HIrsVyn13H753CIrE2DTmmhePM6TIgMXgYemEstk8_9tF9xksA3HuQlJ5hopDRnA6igIbMPDQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG436', 'PT211',
        'https://lh3.googleusercontent.com/pgLTJ0c6KB73SJiJuBwGPAQTD0p3eJVkGQcfbsusuwgFwqez-PorjO6IGVovoGFHkgM2eGu41Q1k-h6zg0DC9cCjjY4RsV5IXQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG511', 'PT212',
        'https://lh3.googleusercontent.com/mfZs3jIDpSFV9z9glX4774Rn8ZUxtkxvm_HZpZzg3hh1L9QeVmCvEnJxPjlnDS0sIF-wZsAhRDVPxguqkes=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG512', 'PT212',
        'https://lh3.googleusercontent.com/HSY7LAc4Puo9iTaj4C9ol2sYiQXF1ksqpjeJOOvmu3p0A8OvFDeidL3QgAwJJNUit-rZShUrbiRXPzVJsxw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG513', 'PT212',
        'https://lh3.googleusercontent.com/0fpL64e2iltaF0XFJSWojHjYXJr9u_dI4y7R5w1fkeE2q_RDJTzAZUt0cD12TctmWpCZLJXi-AqN9Z-iqw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG514', 'PT213',
        'https://lh3.googleusercontent.com/CEqPQ4HV9EjbOECnJK5XrcGE82pPUs3l_B62eHU78sB7NvU8SGfCWc6YeHvbZFH2VhooleQsS3eUIyUFDOB4=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG515', 'PT213',
        'https://lh3.googleusercontent.com/5gqoXgxg91p2y3e1on2ORaHpNh3Z6486SoialjueDcwqynLTDbEfhRTHLr9oBIDXg48BfVmpEH0CTbg9uA_Q=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG516', 'PT213',
        'https://lh3.googleusercontent.com/2Xj8F4bI2ZbrzaX0GcYXl-rRoKqNKW8nZ2VvTJE5tySxRU7e6XgnKvBpKK1cBqv9vBPDuqjiKMlVrS9ESIk=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG517', 'PT214',
        'https://lh3.googleusercontent.com/6UoLXa2PDRR3xvhRsQFVFy3vdU7tANUEcHM9MILgUd5ivO8QZlWR5PYhuRpJrHP59SonlvL6dR8lOR5k-HI=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG518', 'PT214',
        'https://lh3.googleusercontent.com/HaYEgRv2aeWutKsYqt2n484sFyKBIPI6FV5ub3g_cfDngNgul8YX_Vyh_w4FZlxtE63D4FDkcWVV2HZ-2n0=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG519', 'PT214',
        'https://lh3.googleusercontent.com/F28FqtLNIFKfDE7YBEdCf_sIG2EI4dJvxi1bW-zVuD3i0vpi7VZ5kEQ8ru5bjjasvMnSHj9LByGI1oKmjg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG520', 'PT215',
        'https://lh3.googleusercontent.com/F_7-u2s_kK5ZHnUpj2docQrlugJ1lU5k3ewdCqsAPt_wlCTu-ulu8lkNpJZYaruzfKBcZKm5zbfbo8Dk3A=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG521', 'PT215',
        'https://lh3.googleusercontent.com/TYq1AQGgETRy5Y1N4U41NZc-Tq1u8OnzcIV4Kj8-P8jDEiM4j0-Rdl4T8nuGeAuRqYfKC4XzRxrJNXWqMLEFAQhP5mIQvpI=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG522', 'PT215',
        'https://lh3.googleusercontent.com/fsURyzIMuWcPnMFX7nFB4XHW2F1BH8svJlMHOQPyfMcTSlXaQFwzdImJIQ2-EWyDR2fO8gz-qyV0d6IwjqMQUdHFrHmclA5w=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5220', 'PT215',
        'https://lh3.googleusercontent.com/dX2IRSTeMFPQgD80WO9D1ZdS2RKLNqzuvWERCecXvziFf-9BNRqXPMqaGgQVX5PKjQqTvIW9ODWIqrWK0sjKXaQQcY75OWU=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5221', 'PT215',
        'https://lh3.googleusercontent.com/AYbwUxqZHUIdCH8HwAXcfiJO1vbVwDh4w2xOt_ObACbubRBlz6w_HLfM62b-2mgJGplg5Qg2EOq3h3D_65GST5nIEyRUxvQE=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG523', 'PT216',
        'https://lh3.googleusercontent.com/g1K1zNStrA7chN3zbeRX-uJD0-zCaeCnpd4ZuYn9SmM2NMXMfySMpI9D0IqP5uYG1Q0GrDXuqzNMWd6taY8h=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG524', 'PT216',
        'https://lh3.googleusercontent.com/9U227h-pFijF1ZGcqmecxN_7vRKa-tT_4gYAk2Jg8lv_32W-l9AP0Y8CmEKC8b8BK3Xzi98Hv5YmenuUyLTV9k_Qgsj9XnE=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG525', 'PT216',
        'https://lh3.googleusercontent.com/d-WVzvx66hiZ9DxxgXFmJMtIcE-6hejFms8mgtGu0pShsluLkFQi-hRjl2TKV8FYIiGAYWbFxBoPR8bsyQjh5tQCUl5bQcvnLg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5253', 'PT216',
        'https://lh3.googleusercontent.com/WR1Vi71EARRMMHcJar8q62HzyxdX53lAL_3E2QhhPuA2jbyo4fHPna0QtTFbTpCGcHKDyJD2g9t5cWchGefHWXkf3OUlH3pOaA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG529', 'PT218',
        'https://lh3.googleusercontent.com/2FmiObbgk0SWsh-K9qXcDyqX5JI8VLZyQsp49m4t7BWePqPD-lrz0zxBeR7NkO3BJ5S0SB76FMk29A16MAtAL38ErN9yOzc=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG530', 'PT218',
        'https://lh3.googleusercontent.com/hNKIBCQ40_i7upbws0zarvFZv-ZqNIR23WxBF1dm93MJXlKtMli0Cku3ERMFuznQoaHRTv1cElciIuJuzpOVFGpSiAy0HUpF=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG531', 'PT218',
        'https://lh3.googleusercontent.com/6bcrahrOObfky9FAqCgyxEH2xbAeoL9gxdGx_rUNujIEVYKr4KqeyIaylOCl9_lRk-tTIfQxjdsovdnG0zTy5m7_r-ZBhZnn=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG532', 'PT219',
        'https://lh3.googleusercontent.com/rWkJjOt5KAovNHKeoiyrViLwuXm7V7oze5Z9iAW-fxhA3zCQT4svuniAQ-DnZsWC2KUwrvF3GE1EvoHGp-A=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG533', 'PT220',
        'https://lh3.googleusercontent.com/u1QKIvDUVTjpUp70egzO_UCNtwZTtQOV3jdaTSr_xe8h36pXxGBlPypF6o00d6JGD-wpYrxK79gvxieYxE7hbotc-N-uhYUT=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG534', 'PT220',
        'https://lh3.googleusercontent.com/D-ZdglDaOPMppYTeEv_zdURcvVTOsQuXMMJ6TnV_-vHw8skMly0UPWyoyCf-xcx5NqMg5u508U0THkRnJ_66B15ZVTG8fY68bw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG535', 'PT220',
        'https://lh3.googleusercontent.com/Dv4iUpSps4xPO2qFri800EdXEahdlFaLw3Ah8narHLP9u09TR2XYSnMke6IxxaWyS9rUbtyqHBchko-KBijwFnmlUOwUdpHh=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG536', 'PT220',
        'https://lh3.googleusercontent.com/fc3FD0nB2AGASBE25Xu4Ga8J08MsK7uv6y7YaDdTkUJcZdHCOOtEy49_B5Nh4cmlsEFN29B-wNFJOobyMARcvQWFYprfGb8=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG537', 'PT220',
        'https://lh3.googleusercontent.com/eag72kfNhigN7wJ_hyx3QY41-RlYuj-GnK8p8AUV-0SM9-ItzfqtIwiLGjxW7SMM0yq-r16BRbzPdRIoCSrZgDfrSDLdpAsC=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG538', 'PT220',
        'https://lh3.googleusercontent.com/KSj0aSdsVVNbYV2O4pZPZiJoyWQIjB0GJ-R4wu4666OHjfZHJ5Nbkl5jOFOhbWztpdZnUPT7c-H3YBulq-gviv9A3p0_I8o=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG539', 'PT221',
        'https://lh3.googleusercontent.com/cyuz1e6ug7IdBLA8N-JJCzO-9jpv0-_-7MXuKo_pGMp0AlTzvSNHfjdGU6OiPSBx2ottX3NZiBYaXwRj0uLxhzPMEbCsNHPyyA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG540', 'PT221',
        'https://lh3.googleusercontent.com/H13cXJEj6NB86TQn2MwXNhUv940QCgj8TDJh19I78s5kkw1QLiMsHJljoF82vdrJA34ehjB4lpFVthFTSyv12jufn_Cm8R6z=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG541', 'PT221',
        'https://lh3.googleusercontent.com/n6i_OH-wTkP_gxlIIOiTVFy4bXXsQa2_Ca209SQsMfKje_JtJ-cY1sKnw6Gf9XcOXITW-3cSGBOvdIfPdxBpGhGYQMeKUG0=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG542', 'PT221',
        'https://lh3.googleusercontent.com/SwoXM4eQIL6EumOkA5ioaJ8EHNbU32ElNmXWf64TTDQkAPKed1tUXUu-6dbt7r6BQ_FnLmrlbkmbYFBetFiE3zzHkK9eRc_M=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG543', 'PT221',
        'https://lh3.googleusercontent.com/fDN-BoI2j7bJ_-igOV_i9RJbRV1a9MAcsBlkde63NMLbJ2xYB6nAl7I8h56ngewpW6H1PJsvNL5xA8BINsD-h3KQmnJbiFxbZw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG544', 'PT221',
        'https://lh3.googleusercontent.com/_TMU6mtzS-LknJv765z5shXl8kZVdm_-ryl-pww65sZ7JXF77acCBb5JxGz-xbuSuKzW7wn5ukkNrJokHQFZL0a9TH_HsbOz=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG545', 'PT222',
        'https://lh3.googleusercontent.com/nlNWdqQ6aV2m3sg081DJdY4AXO5t0JIxkMQL3-3zKXrCFpUburLSGSjsl0nO8B61wxFfAkWi1zdLISNjUoU=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG546', 'PT222',
        'https://lh3.googleusercontent.com/gecI_cAGd0GWuZfOwc1afRvGMoZJgJsBbTzgpTcMZvQsYgmkt-gvXm9sIm6tJDpXj-fCxVPWciS3b2-p7w=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG547', 'PT222',
        'https://lh3.googleusercontent.com/PwWo-HtrzTbDBfNsCuEg87IWEDKf-OVjwXwPtARQNeY8JCqoBSXKoHX8qKnpzbJJU-pK2OdHn-Z8fMaa0A=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG548', 'PT222',
        'https://lh3.googleusercontent.com/q46UOEo-bTjutlA_orBjPXzYuguukOaHrHMj4OigR9frmMsTktLxK8Xty0bk_KStdCZ3uB8A4Oxfg4_0H55G=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG549', 'PT222',
        'https://lh3.googleusercontent.com/1FeQarLQQe0isI9yXc6R3eiB3RhHiH6VRpc7DNOXFaR10J-EjIJ4EZGO7kzgO7qAnFZYitQN3FfvIHZqMveZ=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG550', 'PT222',
        'https://lh3.googleusercontent.com/6xJs2uELTjtPIRhIP5xkRoqStTmpBa8jlKv1Unnw_1AAMfHiudKkllBqc_HQQQRmcWUP3xZrH2Sw3Xozzw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG551', 'PT223',
        'https://lh3.googleusercontent.com/G2xEk3lEDG544ui40LdnWl46CihRdD2DYOwzsz4CveppPV_poCEfPgptoDtHPpbvVmADQcOCwl_IcIBmfmMLofUO86gQFcWI=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG552', 'PT223',
        'https://lh3.googleusercontent.com/rxScip9rGXlMaB4Ze8SxTTSfOqdyZgm_mpCoSDVLqeW1k3i-I6JHZo2Ovfi98cEDMs-QiaGklQsesRKRcKpCapvBmMjYMj4=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG553', 'PT223',
        'https://lh3.googleusercontent.com/6bErpLYZa3b-Mbn6WhheJD4da49AedzApSfJNIcH-dGgNu46LhOJxaqEUS0e-WcWz6-RQHHs0uAL5twdqtjBWAvEA1KFZXMP=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG554', 'PT223',
        'https://lh3.googleusercontent.com/ZAfrjwTUpi-hMAq5ocXEVmG9mBgARhSjmVzk2RxKcwM8yggOvP02BvH00_qb6HoBBL7xl7lYFGyycK4qQW3v7bhc8ccgIwRB=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG555', 'PT223',
        'https://lh3.googleusercontent.com/Qp5n1l_ITzM9_Pi_6yrJYEM0ilpBmHSk5BUJ9yehlntRwn1e-cmjcugnWXNZpDIg2LIjaSeFyo5g4fuNn4_SIn_D93y4OLqz=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5555', 'PT213',
        'https://lh3.googleusercontent.com/LKTXWQqCcxIHTpsq2DlMFzS78Zh0HpB5t-Ptsmt2zWx3ajZ_xnmcVomIcvafJi-pRRlV_wElV966J1yv4Q=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5556', 'PT213',
        'https://lh3.googleusercontent.com/YXdmgmJ_SfCD3TWhlDiN8lZqrsQ6Cc1WjBwQ6uIuW90icYHZBO3807H8oE2TJtUenIXZqnib1q5VpZ_Gc96h=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5557', 'PT213',
        'https://lh3.googleusercontent.com/Y8-ajHqfF8nhYQDdULLOwyxMfc9Jp_6IJ3nKJ0WrYxWMCzohCe4A_PPRYu-SRatvjf5g3fTDTwnEWJ6MTQI=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5558', 'PT214',
        'https://lh3.googleusercontent.com/6yTfN9V1nnf7Uj6EunnmN5P9dSa4h4J6qArd0M_dJkxZVK1jbR1wEe24OE_1v92noZtjN_P4FW6Uxw4PGJY=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG5559', 'PT214',
        'https://lh3.googleusercontent.com/HcwshPcvY8eHui1EvD48P5EFrVpWnMer3tSJXQZMj3dm55vfP_BsqarhMXPTTc-EtZ-LvTt9L3hPBbtf6_M=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG556', 'PT223',
        'https://lh3.googleusercontent.com/Qp5n1l_ITzM9_Pi_6yrJYEM0ilpBmHSk5BUJ9yehlntRwn1e-cmjcugnWXNZpDIg2LIjaSeFyo5g4fuNn4_SIn_D93y4OLqz=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG557', 'PT223',
        'https://lh3.googleusercontent.com/mMRprkTS7GmlPR0t__l3rYg6xz3_ablhRuqrEHjempEYG3uG5XWcEfrt3nsFoIeWnqCIlWe01Fep6OqxDnLITVPVHqkUIy5-=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG575', 'PT212',
        'https://lh3.googleusercontent.com/IgHpYjWYSw8Q4oF_fRUWfywVXeDhD8xWJywloBd-qNXcbdypCXwnEIRZneSoYclJSiP-4FErx2mZjETBw9SN=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG576', 'PT212',
        'https://lh3.googleusercontent.com/BPd2dB4bPbjs4Y_Vf-q00WxUGp6mDWCowqHyMWHwqYXVZBTY0-5Z1tAA_EQ_zUTqwUzZrYOmUia63hkJiNIH=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG577', 'PT212',
        'https://lh3.googleusercontent.com/TGrgWbzp6LGv-_uCyr7XEn04cicMn6ZVfuNc_s_ZB4jt2RzcT9V60i7xN-0yQIkTK3rla54FPMejp51vPKw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG601', 'PT401',
        'https://lh3.googleusercontent.com/vueZTl7dnwegXbiEItqqaIwpCsDUUk_bobAsPKttGM_cVMlP-UZa1_q_5rsEa29r-5mM6VOzO6kd1tKEGk8=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG602', 'PT401',
        'https://lh3.googleusercontent.com/7t1kUYOW2nYWF4zKaEXePZVx4_eAL9ugUSGlFH4wfzLNoh0mSt5dfqNSmErG_AE9BiuElDQZSPQ-O3YuCxc=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG603', 'PT401',
        'https://lh3.googleusercontent.com/WsZ_bvQyaOgDDgUr93JYZYIwPskCkJPHoeI3EK6uWl9V07schJGOIIBYWrWCzRVePhO9fis7yQhqZau0xJw=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG604', 'PT402',
        'https://lh3.googleusercontent.com/pq1VMxzEDHDw5MUMhsH23Zq4-JOmNZDEble5fLEgT-utZN3oj1ch8DTx7KrSzmDIO7Xif8Nz6l4ZrT7GHv1WMXmDNI1SVHzIZA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG605', 'PT402',
        'https://lh3.googleusercontent.com/WCZhar3ya1px5yNM90Eb6WgY2NWqj1ehBVIxmP8aQ2B9uRRFHJ8t9UfV61aBrFLKXT3g-HmK22v0CW_EPMhTccmcJnVNXV5H=w150-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG606', 'PT402',
        'https://lh3.googleusercontent.com/wykAvJEPX08DHGubDZofjVBYJvGA2x4PCOEhGxkRrurk0OkVw1p71TAEcOjSB0LFamrfFAlkQ3YAoPqop_xWyhOK_iRYqGmn=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG607', 'PT403',
        'https://lh3.googleusercontent.com/GFlSvTcAGD1oHOz9eB8LnUOimyivhmp1zI-euzNZG4XSmxwolEkWbVuIwz_vxW7SYbIgztG1e6hyBJXNbuVuOoPJBHFNCHUQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG608', 'PT403',
        'https://lh3.googleusercontent.com/p82qHXfX-ZrC2QAdKU9C364tVGIH_zqlqiQRbUfClwvJf2jPCGfd7xB-KlJDnlU1iEG1LwNItC5xIsXbeMlLUvRzVd_R3PYo=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG609', 'PT403',
        'https://lh3.googleusercontent.com/0VHqrAj2Jm2-oJ_vD_SCMshOtFO8Bo0AT3dqXTIC1X8rZV9RVV6OzXMJl1xTOY8GczxoGca4esPBqn5r9fBBCga6cHvwJozO=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG610', 'PT404',
        'https://lh3.googleusercontent.com/7-6CQSePTfy73qXCAbDytGIOP5ogO0MVA63IjwwHshmhnjoXxs71i5ueYrOY9Rvv9xOvqLPxkmVIsgl8Nxs=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG611', 'PT404',
        'https://lh3.googleusercontent.com/gFWY0mhfkv1GhKJUjhXLD_oVtJDsq9SV2Z24VDpwYpWYb3ifn4N8UhLV3fdQEzfO-rY-eq-jEetZozlI90Q=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG612', 'PT404',
        'https://lh3.googleusercontent.com/jm_9ph7MQU5hBp3GxvHQ1VVsmnXfupokDRYqIvRpmUYsWWRpti5HfzPRo09_Q4mghaYOBAUXDCl3cZ4fkw=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG613', 'PT405',
        'https://lh3.googleusercontent.com/fwLO0hAhS3AzQp089_xlQUrGxoSuH-gKYpTU3yjmLwcH895fTzCceyz2B4TQKPnpcYrhASzsA_f7lBC495np=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG614', 'PT405',
        'https://lh3.googleusercontent.com/MUOknlqcA572Cv-gl9zua2iKw64DByocNbRaoqsNiDzG7fzmaSrnYJhsxnsz7ZRm0WLP0RrqPk_uivqt7jU=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG615', 'PT405',
        'https://lh3.googleusercontent.com/0NW-1FbNyUp7Kn3lXkzG4vVLOodTbo_usQB3ntE2EcwKSz7qflLFiIMXlka9eD35D1LjcTgaybnchxBJh6o=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG616', 'PT406',
        'https://lh3.googleusercontent.com/AtPqiF64g1VwWvO3MA3HRHrVFCPrtiBftgVzAmu_SO2aOYS37de7H4pUUzDoWnt09OnCYCe52FZ9C6Yx21kbnaHp986qOvnQow=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG617', 'PT406',
        'https://lh3.googleusercontent.com/SUjbgz6MmDMibymHncgSKt7mSEYpXUYZMtMPLOXxCabOq93A7Sa9vWh2h29bpwqLgYs5sH4gqeOKsWvsH_vEdSujcbeSry5a=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG618', 'PT406',
        'https://lh3.googleusercontent.com/zrx64ft9VPZL7CP-LF7r-NDOCqjJ93kg4GFHj2Y-f9AU44USFn7_4nm4pUQ8_0RXH4X8oNPiJSU_ZoKl2m9IUYiJo8KhKLLm=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG619', 'PT407',
        'https://lh3.googleusercontent.com/1g90i2mI9XFB3MKsEQMvYBtwTi8RAixBel2jiKhA6Ym7VIvWJz7AUa1k9krwZ3Qy_cp7CgEeBSCA_xjSgt2XgyQkQSZNlOFr=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG620', 'PT407',
        'https://lh3.googleusercontent.com/24Jil-rbhHF1LrcrYayK6BeMKE2oTnZ84__Yve6uwGPcpMv1KbD4XHZBtwLjb0BKwLANldt98RGR_DEQNgtA3QIfg8jcLc_s=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG621', 'PT407',
        'https://lh3.googleusercontent.com/LnhE3IspJPqVa3A2JW266zoQlLXEffuWvfNhblxCJHEyian3OAsgKJkY_YyE3a7KVq1iz-9xtkJCkqGeyCyyBQsgP0z0x0g=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG622', 'PT408',
        'https://lh3.googleusercontent.com/L8TvYv3WTqIKTvrqpwjbSRN4iZ9m483k363UfbOR88wC2WYOvwd1es33b3ctL_0ZKv1NGYv75cN4TB6zJ4h-au7L1ZNtnJk7=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG623', 'PT408',
        'https://lh3.googleusercontent.com/PlHLQB5tYNsqS7DaZBb-SUJJUGIGFvWXt6_BjX5sSxG6PsMt45qWo8xuyhlsekZQnfpUTLDInWkRQPrq5UPrwyXwyx0B7hM=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG624', 'PT408',
        'https://lh3.googleusercontent.com/0lWKvSwX1iSMBdjp6Eh4zHW_rHy35GSjE8rVIJtuOqRZozamRFXvdG-QZc7RQvLzEuDkp_n-l1rUEFvR01-HDGG7Rz5CuPmVOA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG625', 'PT409',
        'https://lh3.googleusercontent.com/Z3lxYzPpjWLxMVQIrksyfC-CNPhB0g5l8CR3I829ylwnqViECVPCQLAUW5ezqRPTlFRQrYDgegeA8N5WJwZx_k6_t7VvyC0=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG626', 'PT409',
        'https://lh3.googleusercontent.com/ZF6K85NxpQ9jJy39k2MEDA24ACcZ73aWBKAKH0f1zjJDsmuz0KR199zmy2CfK4r-HV-xjDQAKa8vhmpctpGjifTVcwoEUnTc=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG627', 'PT409',
        'https://lh3.googleusercontent.com/c7l4oDg8nLOTyI_-TEQsyANOS96q6RLxDSrx300HvBkrrmjKO74AXYr1ENGojQG5Ws518MhCm_Rumgcz_VTwbB6Kg4LSz8cc=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG628', 'PT410',
        'https://lh3.googleusercontent.com/dlXxBaDz1ezPkN6OwOMFi66hG491QUWs4H4E8-gRY_QARhLA47HE6MjzNxCgCCPKPQ6MNZvixgcFS5OE1DT_M41E3-8TIbGJLA=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG629', 'PT410',
        'https://lh3.googleusercontent.com/i59jIFoddfzG2OdsilcZAWokVPCmYARLvxJoq_oonf1AksibF_BHWIu94A2Pu2sJGKGf7BOzCNUMHgghcSJslO2s-0UNzn1M=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG630', 'PT410',
        'https://lh3.googleusercontent.com/DnKgIMq49YenpDLzCTr2zqLq8HJh5e1Ugfrp_DxkbGRBFlW1ZxtrEHjqTUyjoyFqnuiF8y1OPIs_cJ6luqbU8MbQh9dJWzE=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG631', 'PT411',
        'https://lh3.googleusercontent.com/ZlmVwDrrXmD99pLa19Q8zs-Afot_mPjR6HSR1pljPMxGvgjhw2gWEEC1_yER6l9Axd5adl5gR8dpFKShws-Ioy5JV5aKca3l=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG632', 'PT411',
        'https://lh3.googleusercontent.com/s9K6pQlWxQwsb1KCp0VnmgvzVzTTjJN-Hv1cYKJaYJqsTx7mxYVmVCKon1eaP-eD5TY7jwOFjP_tokeSCAaHx2Xn8o1bAkuYBw=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG633', 'PT411',
        'https://lh3.googleusercontent.com/D2hlkRXa7Mem4ZHtHyySe2RBrwN2b-3zwz39kxhn030q8bF6V5qRTg8w1F3k9soSZu9od9cDJ7sD8UB7kf3nMJxvr4rvw4q5=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG634', 'PT412',
        'https://lh3.googleusercontent.com/bRlnthS-qPPH_bWe_MDO8W1t8DJ14016asCyTn9cRggXF0QU2H_xShtU3J0jmzO4WBa1gLUYwtQegNOcyBB9Tt_q33p3mOZ_7Q=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG635', 'PT412',
        'https://lh3.googleusercontent.com/it3vj18r6u1Ehnc0-2prjEfA_HIrsVyn13H753CIrE2DTmmhePM6TIgMXgYemEstk8_9tF9xksA3HuQlJ5hopDRnA6igIbMPDQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG636', 'PT412',
        'https://lh3.googleusercontent.com/pgLTJ0c6KB73SJiJuBwGPAQTD0p3eJVkGQcfbsusuwgFwqez-PorjO6IGVovoGFHkgM2eGu41Q1k-h6zg0DC9cCjjY4RsV5IXQ=rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG701', 'PT520',
        'https://lh3.googleusercontent.com/1CrD2jv6oqwP6Xu_CtTtctUBKJ6b6Ddu-G7ck4cpWCRVGMtNmgjYBhcxxQ2rIh_0U25HHp9wUomPBzA3tChaoevPN_aqx6Q=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG702', 'PT520',
        'https://lh3.googleusercontent.com/IOYnT3wIYB41-VGifO0xgJ1eOrcuJjcHD7qgiWbGJp5361mlFMIEkEjxA0cwvu7X63avyHhN4p2pxxbSlCqeuW-UKUleDgyr_g=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG703', 'PT520',
        'https://lh3.googleusercontent.com/msPyHpAy7yqE81iTI04Ga45JgR5FMEa5pALjVuq0stegZn7eaunEmabozafSCV2FTRmTs-Fq7TxK43W5kmxwNXzIzISgEOWO=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG704', 'PT520',
        'https://lh3.googleusercontent.com/BGSP33CDO2wD3Bit51k4Z8UTaV12OwHkgR23Y6-abCMiViUOpsdWWN4t8lCagWzFpnAq_rOBL4z_uNre4GOsV-KJ1jMoi6V5gg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG705', 'PT520',
        'https://lh3.googleusercontent.com/rw7EIF_KVUT5Sy2gpwhHgDCJLB3NWXb6nNxjLwE4AGAs_E8SW-5TYhE65AEzYzKoqRpI6Q8jLD-rWIDt0pIXYhclD9TTbKySpQ=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG706', 'PT520',
        'https://lh3.googleusercontent.com/B9COYbZzgpezfakkAToTNOC1OylPTky39y2WtdHdglFDj3CWSdYgXlG04TzIo3Qxb_tE4FPKBkvVwhEkEu6evQMKmq55zKEFEQ=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG711', 'PT511',
        'https://lh3.googleusercontent.com/oUobPUzGSekGyL_BguyYTG0KyZWrBYEzqAUIxOGC27jMy1aHLZOx-a7_ctsuER1Q5_1QomtUyiCcYD2PHjk=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG712', 'PT511',
        'https://lh3.googleusercontent.com/r8NT_ji8s48tDH_VYQB3wpr3YPm1nCw65yxMAWszvJbmTYefxPx0-JIJuwkCavh7Pbj5Vb1_M5J4_9tT0hg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG713', 'PT511',
        'https://lh3.googleusercontent.com/kVwoMSIS5sIVfQPdhTL9uqQ69S0EuGlYqtaui_uKkHdqyjL_taudJe_jZRqDfQYZpWWlWrrDzv2CTdjlgVc=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG714', 'PT511',
        'https://lh3.googleusercontent.com/oyQBCPrXn861gO4ZQ69E1dBe0IwUQF1Lh_7xyAienXg8StBFJJ3E0iJ-SaNr1c8OExI5F3y_4PGd4XddYl4=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG715', 'PT511',
        'https://lh3.googleusercontent.com/dJqpRi3xDO78W-KYUQquGfskCFfo-ykgIxXLFdPYYVnG_SILgfkMrUWDn8WjRYRGHtXDzIVOXQ-sQ-sho0s=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG721', 'PT512',
        'https://lh3.googleusercontent.com/FQB8KSD64Zo9b4JocjiFwQGbHDjRnJaldnj8hboyxK8fb2ON8E7kKUAH2-HMzZPcmXl0tJVvHXGgV-ABIFr-=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG722', 'PT512',
        'https://lh3.googleusercontent.com/BjbJSKPwy1jrFdRNu7QCBWGnAE2VsGZMJcRIMvNZNBqtiVhZP1-cao5goR5c7NwqzoD3AsU_hXv-GlU2Inc1=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG723', 'PT512',
        'https://lh3.googleusercontent.com/-BPAj09fjtFPY9LuyxhE-sJ2nA0uejNtbctcLPuYwqPCcrdEDmu7gtmw1Lz_Rdf8VQAK5T60qx8pCOTS_6pQ=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG724', 'PT512',
        'https://lh3.googleusercontent.com/_pvaru-vsLyRMl6olWvaLrcSv_4IllALt33H_WFGwzZtqF3yomODARRz8G-7xB_0DFbLvT6YsadTlUUU_7c=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG725', 'PT512',
        'https://lh3.googleusercontent.com/SGBe9eyFqs6peTW61xHau9H2TV7ABIosJoPCaBFv1vLW6TSw1pSn8-sjgcZFFPs9PtmCQkbPmPGtN6KiN6A=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG731', 'PT513',
        'https://lh3.googleusercontent.com/c7VuA4P8sHHJCilfzRVp50AQmgZEkJOyOCuh4vvkcT9jxfqTzZVd2gepUFSSqzXVSEljnYlAN319sJD-H1IztNcxPT3UypA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG732', 'PT513',
        'https://lh3.googleusercontent.com/VpJgldxtdddsmBwMTP0iqPG4-W0WAKCTFE3iYe7XUaXUhvFvePH514GCSoH2TDLHiMOYxKSzRh7hCsmdM1429r-tk_8haRUr3Q=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG733', 'PT513',
        'https://lh3.googleusercontent.com/kpxJEY3p1mLKsaiQdUuL8gK_JPyrawmy_oxRXlU9b_p9TrrPo3hQOBhlXXutOyDABYTmxgnuuDkutPg0VgbUls42ctkH5WXY=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG734', 'PT513',
        'https://lh3.googleusercontent.com/_8W1EMpxpcb_lDJ-nhGMxsqP-ja6GW8iZHwREklHxrkkHcZxEKJTEyaRq817_McgSwXR0e0dQpvl2DxrjumLjU8-3L6u4xpI=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG735', 'PT513',
        'https://lh3.googleusercontent.com/eOT1uNpQy6j-EBoWZTZfelVhvIppYxHOUv27da3RWHyZAj89Wtf1p-qxmVNZnrnkyE8-k9mXQB_r3f19Z1dA5Oy2fgM3lOws=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG741', 'PT514',
        'https://lh3.googleusercontent.com/h7RblTdeSp9EQ5cLOnhNRlEdkuEBFOzIZGfwucEjjfW20VoCpm7mYj-3JB3jY5m7zdhX0XxmnVzgyZ_BxkYY9-d9sqe1Jkva=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG742', 'PT514',
        'https://lh3.googleusercontent.com/mFpCHSY5TlV1mAfkn-2_l5cF_iCJc_XJRa1PraTqil9YOGVkFoqO2aJYbZ8BnXqe02YUvqcwsbj95Il2Dfm3Fw8U391YytMu=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG743', 'PT514',
        'https://lh3.googleusercontent.com/KPYHExmciei7t6HMnMCVpVNRymDvvUAwZ_xJuDOtO-LEWffIfvbe-3afO7zekl032EokeRsUOty49mCSEphHQFEhI1osY1w=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG744', 'PT514',
        'https://lh3.googleusercontent.com/gT5ex0y0T9P1A2YB1daxWXFCnfSvx5r3TKtRe91cAv2CEq0-ZeK3aetPRoBk78Y3BwW1Al26P3-UgRdq6RlUibXhPUrVSDSX=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG745', 'PT514',
        'https://lh3.googleusercontent.com/6Nn_XTjlLgBmIPZ1FUKr7VlZzQRWJLz4nJXAj6E12TV2L7_psrtlv7tY0f0iZormzqUK9623ycR2ZC1IlvUgvpXiuX8DAIRRwA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG746', 'PT514',
        'https://lh3.googleusercontent.com/Eol4-QlqiMU1nVtmttG_UNSeOlYULWjWwWcJoEz3X26-LZbxDi8f6d_MuzoGJOJzyqRp14vcNquws8zQ85JuuGdvFgUmJ-XKUQ=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG751', 'PT515',
        'https://lh3.googleusercontent.com/LFgX6gRnHYEBcxikfBN-QlQF2vpQY7XZi623LEUyJO5IXTaeDtLHUitIVHAPwLmHbeski-Q9jVVwN7E8jUy1e1LexvdDocQ=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG752', 'PT515',
        'https://lh3.googleusercontent.com/t6uJcir69EBQI7tjtFVoEi-70eLw72avafza1TSg5Q_9NSHYWgycI8pBA2OPZ-Xf5j8oOidndqdZgJUEMpm8SB7nlsqA8ljv=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG753', 'PT515',
        'https://lh3.googleusercontent.com/K-pDDupEfeCdqoISzMg340Zy55AZEMuXEHzOaWk6xabTRrRAdPR2wPHIYz5WHb9xO3Sj5QZvy_kHZFonvii6BuV5uP7Li3A=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG754', 'PT515',
        'https://lh3.googleusercontent.com/9lSJcdgvpNL9EKGhzSqKDBre2tQV0C30wvs2FhRG23Xmcx0-xyMnUIBeYZJh4u9ho4Q6mWlMN_fb42b_KEMnxZohMnlzQjV_=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG755', 'PT515',
        'https://lh3.googleusercontent.com/k-pLl2TTdUwecc00M-ebcXLD-Cabcbl_B2oOE7jyb5pxveSiRIFYbw6IIiuemTXm0Ppvu_h98yvCTNh9MEAJUZAtphv4bGSW=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG756', 'PT515',
        'https://lh3.googleusercontent.com/zfQFqYXpedtNDOe50A0dYjaFxVXBeBPabE82xNGcRfuAMIWlB2F4EVh_lY970omC0lLX95EZuMfrbNUqqn9nHSWg0ucJSng=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG761', 'PT516',
        'https://lh3.googleusercontent.com/LtHMKWNRQy_iPvfhVosxPf4l2oCRomIkLw9gdFmyaTRaf0b3MW_LXbjfPLLXi8rSUYmp2QLos2Kr9E2t4vdofPx_KKUB4sf9zw=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG762', 'PT516',
        'https://lh3.googleusercontent.com/3oBhPWrNIdR66sd3jaLujCsFri4kapkooI13yI6iBh_IrjCcLCgbewTWBRQzaCgR0eDdPXiUHpiuElhq8BIYFE4K3bVah7LD=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG763', 'PT516',
        'https://lh3.googleusercontent.com/-lbAjJ7D9RrDXm1gqFn43OXgGY3hfov2ofMfRuiTxumYSc5y7-Vb623d_Jll9JBlCixP0JFPhhyOfk9Ohn0hOOjk8LhMzD2_=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG764', 'PT516',
        'https://lh3.googleusercontent.com/vMaU3MVDdmL-h-U-S4h4PhaZ7314GouQ97wQH6jSBNHtVL20jxhbTJ3ddXKqMfCFYALd8Eo-eOgYddhEFai9RMq-1t3mFAQrpA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG765', 'PT516',
        'https://lh3.googleusercontent.com/PmwUC-OKrThaNEYcsXImLOTBQ_oMGM1kkK4k3HEieuibVtEEaUz8EJCHu40DcUa6_3w-i5Tunh56iwE1yUW9PrCvZSORTow=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG766', 'PT516',
        'https://lh3.googleusercontent.com/gm7KEr6jb0iM8SGoqMp1tBb7tWxQFZZSrqE7C5_Pw78jRLpW2I4A7o7W0U_mKLXGP4oiW2IVZT_G6GiTc5M_5FIZlI3EH4CvIw=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG771', 'PT517',
        'https://lh3.googleusercontent.com/Fuq0U3tS6kLgZ1B0aMlLuHkxsXvaztB3kl8WFzmFQ2n1wbxiGDOtm9IfTlF1k2QnnLOJdf7E-a_515Lf2rxM4fxfAI6OOnsW=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG772', 'PT517',
        'https://lh3.googleusercontent.com/UEDFD0sWgBbct6deTzEEaIiFakDt5ApEaBvqdLtGtMc-8GtzpGXs4SNK_2qYiOT2UnkfC8HyQvLIRmn_lFXD0rtal22mD7SD=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG773', 'PT517',
        'https://lh3.googleusercontent.com/DhXngV93zEToItq09FNMiMXw2pbBo4TQN1tXUYlm-EL-OT5mgGZVoTjl_sd1UPdxGnMOEc_Kiriq0Ai0dW1SwfMUISMHiZiu=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG774', 'PT517',
        'https://lh3.googleusercontent.com/wdtYSzqLi23aITKQdU7VW4JL5-hkoVe63mYICEhSFKfdqN6bbFh3wyCKEmzTJiv6s4LZ0OMuPoZolvzRHAD1t8lEeQYuUxg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG775', 'PT517',
        'https://lh3.googleusercontent.com/sTzbU5xgKphNHPOAAqxoUViIANLkI06SFmzh82DMGqDRzCr1jJyp72dCDOKBfvoiyvwsyCZRb7F1B-lC8rNLxn6WjZiRYMl04Q=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG776', 'PT517',
        'https://lh3.googleusercontent.com/EMLEFMnAVOQkXsxUoAJf7vXtnxMqrZj23cqRiIHfH1Gox4w_lRFE79fSLSKq5kn5tXGff6IO_pbDxfo_DX9eWYsJKLm2GdWY=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG777', 'PT517',
        'https://lh3.googleusercontent.com/aKuM176LHTIiLm0UfM2bZ0vHEszgDtYBnk5H9If6wpJX92yUksBnAuSyqGL1fT9CSbYbB51Z3T0RmmwCdyQzWePr4CgRuBEx=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG781', 'PT518',
        'https://lh3.googleusercontent.com/zly735rSqM-dAG9tfzU5K55sLJuRK8DZbvIFvf6FvW7S7LQColkG3fFVO4KJwweKYeDb2EjSEBtF7vn8LV8uUoOXn7jnOS0e3g=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG782', 'PT518',
        'https://lh3.googleusercontent.com/Tcn9yyrpMOJvOW_-bA-GTzQ7lmdhzPaExzwRy0QmkSGBHfNGAKS8BhLTOkynmG9gu8A-zhjta4ihw2yDK3Le4g_jaso3mWSS=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG783', 'PT518',
        'https://lh3.googleusercontent.com/tFFT5Ywo-TfmJZHimY57KJBIeb49Q_21Y0xaSEn9CPRCdoj5FQUTyJmoeEElLvFkOpiTOCkyYMGtmv5-L52f66JpxvpJ0iqy=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG784', 'PT518',
        'https://lh3.googleusercontent.com/kvNXoWpjUusTGZWI8MJg3wPy7OMgXUfpH_26WwvymZfPa57DaJUTwZ_pB8GybpXTzrShXcIlyJkr6Nm0yPX9l_rwshScaP0=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG785', 'PT518',
        'https://lh3.googleusercontent.com/IjfkZZtnvPI5qbv29cLJW6BKv2GUqacYwoFtzYJiY-ZLfPMN7PBYLrcITKMjlMs1_D-9MAM1Zj1kUoGGRXp1MD4F0EMrhdJU=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG786', 'PT518',
        'https://lh3.googleusercontent.com/DLNpNdbBPd_Qz-2huLNYwF_2mWWt1s8gjHHDujYyrmcSkajID_KnILX3CnjmkT8cpuuAWq0ozYhVNxYCpWCBOv0OCQdMt9H6Ow=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG791', 'PT519',
        'https://lh3.googleusercontent.com/Z3_SK9nE4XHLcCMOzhpjV8_WjFL-_ugIfXa5ZyrfEY2AdNEH-wh5q1qoX-y_JANDrS71I4-kqxd9HmXkm-Hb=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG792', 'PT519',
        'https://lh3.googleusercontent.com/sMyzfheiWorTnU7ZP2rTCuZk2hBEJG5zWRexITv-6PEApL26MnXgAj4h8t7lYLc0U6gGWwO39_pkq7SuLH4=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG793', 'PT519',
        'https://lh3.googleusercontent.com/qx4y8se2G5pGw6hcKD4WlI7VKQqm-fFGcwetC9HbNyxWe6GKgl2b2yi8N60t4cNE8B5mjVtsgabIGph6zAi1=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG794', 'PT519',
        'https://lh3.googleusercontent.com/HzhbW4HZm2ONrlm6CbuQShms5A1tq8mvIyZ9NRxSV0tFCNe9yAr5HXsyUEnHzIeCufTWaAEV0J0ue47uUg=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG795', 'PT519',
        'https://lh3.googleusercontent.com/qWA8Yu93j1NY39SXK_SUJ_uBZjaj29aIM-wowx4RaSoqOCfxR-76hgbsA-_FKSYq0Xkm6IW7HgjzPruCYtA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG811', 'PT521',
        'https://lh3.googleusercontent.com/pCbuCP7kviJ4bpLx79wTnYQx-GcTnT32qADk3W5dK_egzaKmlHti3LI0xn6B08po7jlW3x9DhAZdZuIuKekF04_fn3-GQFgB=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG812', 'PT521',
        'https://lh3.googleusercontent.com/VlnoghjPeNEafuA7Tz3pIsUry6xqMt8iQmgV6nN9Gvbos09PJepta542y1P1JGS4cD7qHdnT139YoBEkiLq6F3vQBiOBBOIXfQ=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG813', 'PT521',
        'https://lh3.googleusercontent.com/Rh5iZxrhMT__3j4Mff-WG9c8rHoNqq3UVrEZCuEe1YX7Jo3OUGonmFSefAt3zeBw2wY2HZpXHl4modCAVeBx-V2rpN141Oz1BA=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG814', 'PT521',
        'https://lh3.googleusercontent.com/BPTgk8-au2oU7OtOHuL_G40DBAe3XJ72lYtV28FIWNxBatfKCFP4wmXSjdsS8FafYB0cD4YCB0MjukyAorp7TjOjCqBA9iY=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG815', 'PT521',
        'https://lh3.googleusercontent.com/dnrH17pYrPu5VZfvxLY9xcTNJ4GFFLbmyu-ldJrOoRtigP-b9xwZIxB6F6vcxGrUzV8zL5wErInUOJQcK-cmZe2AnbU934nIew=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG816', 'PT521',
        'https://lh3.googleusercontent.com/fW3JaEYdpau2NmABEweU_etB1Fh-MwAPd-ShYDdDEa9Ir-rUi9nGScPeokR5Pmdah9gH9DMrw-Cn9Rita1QWmtg3clnmgQrM=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG821', 'PT522',
        'https://lh3.googleusercontent.com/a_cwUDsg6kL8SazRnGzLb9OHNyrKUaQ0NV96FeQcoxICQyXTeih4vUmf6NEy7WbGehf3Avl7TfBwgXXgaqda1EAt_oQLsz_t=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG822', 'PT522',
        'https://lh3.googleusercontent.com/YPOT2FClA7pW13ei1-fdM8PfdAe0hT3KFh876s_GCZT6QGCTOi_62HqDKm6qC2dbgLhVM5cHbLXizJYaooLeOec61XNTsWU-=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG823', 'PT522',
        'https://lh3.googleusercontent.com/6Hfvki1PzhRLwy89M-CNxtG68a5sYVWNLTS1NWhnztNmKoXaZ709q1kWML0o9PwHmQymorRq2sFA_9VR52BKVP0Hhfifve0v=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG824', 'PT522',
        'https://lh3.googleusercontent.com/LldV3jaBpdH2hUOg23dtnMOyxs7ew42rBCzMat-M5CDxnIG7cmxXDECyNPPbwID9VtLq_UNgp2RpUwhBcXJFvAwSHj3oxSeC=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG825', 'PT522',
        'https://lh3.googleusercontent.com/HpwdxNPqJDtZR83RGDJcpw7UTiwpL4Pp-SVtwRPOenX7RHqqENZguswoZ2l77FAXax11Uco81Q7wFccFcPw97njnKw-1Sic=w500-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL),
       ('IMG826', 'PT522',
        'https://lh3.googleusercontent.com/HihSZQhT_MzKcgXDsnkQU8uzU5TeC2Hl2DiI2DgM5VUbKKqhzuCR3NJwKojBRTLnXqzYa40lQ-_NdJuVrieixJji4YVBwOpbeg=w1000-rw',
        '2022-04-17 13:22:59', '2022-04-17 13:22:59', NULL);

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`
(
    `cart_id`    varchar(10)    NOT NULL,
    `user_id`    varchar(10)    NOT NULL,
    `cart_total` decimal(10, 2) NOT NULL,
    `createdAt`  timestamp DEFAULT 0,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp      NULL,
    PRIMARY KEY (`cart_id`, `user_id`)
);
INSERT INTO `cart`
VALUES ('0jfGWHJKWS', 'US01', 0.00, '2023-01-02 03:27:46', '2023-01-02 03:27:46', NULL),
       ('BzhyUCW9zk', 'OfHEehhBxX', 0.00, '2022-07-08 17:57:11', '2022-07-08 17:57:11', NULL),
       ('COuY7gBnsj', 'qXuQr5x2TX', 0.00, '2023-01-02 20:42:21', '2023-01-02 20:42:21', NULL),
       ('iShcHK7yTW', 'aZAx3DdFfq', 0.00, '2023-01-02 14:00:31', '2023-01-02 14:00:31', NULL),
       ('lQAGHd6KkT', '1zWkMOGItV', 0.00, '2022-06-20 10:55:24', '2022-06-20 10:55:24', NULL),
       ('MnRIw1uc7W', 'XcdtueGFss', 0.00, '2023-01-03 08:36:37', '2023-01-03 08:36:37', NULL),
       ('p3sDiAOAFc', 'e40cqUMxWQ', 0.00, '2022-07-01 19:21:49', '2022-07-01 19:21:49', NULL),
       ('TbR2PPETpL', 'z9OMq6ZMOs', 2792000.04, '2022-06-19 14:39:43', '2022-06-19 14:52:49', NULL),
       ('uGU5Nfq8Nl', '96BhitTAhy', 0.00, '2023-01-02 18:16:38', '2023-01-02 18:16:38', NULL),
       ('WmJ5Q9yOHf', 'US03', 0.00, '2022-06-19 14:53:07', '2022-06-19 14:53:07', NULL);

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`
(
    `item_id`    varchar(10) NOT NULL,
    `cart_id`    varchar(10) NOT NULL,
    `product_id` varchar(10) NOT NULL,
    `quantity`   int         NOT NULL,
    `createdAt`  timestamp DEFAULT 0,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `cart_id` (`cart_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
    CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);
INSERT INTO `cart_item`
VALUES ('95KxSVrt2D', 'TbR2PPETpL', 'PT403', 1, '2022-06-19 14:39:55', '2022-06-19 14:39:55', NULL);

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`
(
    `id`   varchar(5) NOT NULL,
    `desc` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `order_status`
VALUES ('OS01', 'Chưa xác nhận'),
       ('OS02', 'Đã xác nhận'),
       ('OS03', 'Đã hoàn tất');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `order_id`     varchar(10)    NOT NULL,
    `user_id`      varchar(10)    NOT NULL,
    `order_total`  decimal(24, 2) NOT NULL,
    `createdAt`    timestamp               DEFAULT 0,
    `modifiedAt`   timestamp               DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`    timestamp      NULL,
    `order_status` varchar(10)    NOT NULL DEFAULT 'OS01',
    PRIMARY KEY (`order_id`, `user_id`),
    KEY `orders_order_status_id_fk` (`order_status`),
    CONSTRAINT `orders_order_status_id_fk` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`)
);
INSERT INTO `orders`
VALUES ('10FRkbPqF8', 'qXuQr5x2TX', 24040000.00, '2023-01-02 15:12:06', '2023-01-02 15:29:09', NULL, 'OS02'),
       ('1FMImOdTN2', 'US01', 26990000.00, '2023-01-02 03:20:40', '2023-01-02 14:08:21', NULL, 'OS02'),
       ('2ARdSL6Ii3', 'US01', 68592001.02, '2022-07-08 21:31:37', '2023-01-02 02:37:04', NULL, 'OS02'),
       ('5AdG4DlYAk', 'qXuQr5x2TX', 50600999.89, '2023-01-02 15:39:49', '2023-01-02 16:14:25', NULL, 'OS02'),
       ('5aZraW3nDq', 'aZAx3DdFfq', 26990000.00, '2023-01-01 17:29:12', '2023-01-02 14:09:15', NULL, 'OS02'),
       ('874FfPjwAz', '96BhitTAhy', 4220999.89, '2023-01-02 18:16:35', '2023-01-02 18:16:35', NULL, 'OS01'),
       ('AJWIytN1Nn', 'hADJi98tF6', 26990000.00, '2023-01-02 20:44:47', '2023-01-02 20:44:47', NULL, 'OS01'),
       ('bANHup1tT7', 'qXuQr5x2TX', 50600999.89, '2023-01-02 15:38:18', '2023-01-02 15:38:18', NULL, 'OS01'),
       ('bSijQxaeSx', 'US01', 24040000.00, '2023-01-02 03:03:09', '2023-01-02 14:11:42', NULL, 'OS02'),
       ('CUbHwVYXFN', 'aZAx3DdFfq', 26990000.00, '2023-01-02 13:36:22', '2023-01-02 13:37:42', NULL, 'OS02'),
       ('drVkoZYIkt', 'qXuQr5x2TX', 0.00, '2023-01-02 15:39:30', '2023-01-02 15:39:30', NULL, 'OS01'),
       ('dx2reKx6p2', 'US01', 25690000.00, '2023-01-02 03:09:01', '2023-01-02 14:14:15', NULL, 'OS02'),
       ('E7UI6YZN04', 'US01', 0.00, '2022-11-16 19:31:21', '2022-11-16 19:31:21', NULL, 'OS01'),
       ('Efw7HNsft7', 'US01', 0.00, '2022-11-16 19:31:33', '2022-11-16 19:31:33', NULL, 'OS01'),
       ('fG8kBd5ZUF', 'US01', 26990000.00, '2023-01-02 03:24:05', '2023-01-02 03:24:05', NULL, 'OS01'),
       ('fnoFxeRsYx', 'qXuQr5x2TX', 52800999.89, '2023-01-02 16:07:38', '2023-01-02 18:32:03', NULL, 'OS02'),
       ('Fp8XQuwrqx', 'US01', 30980000.00, '2022-12-28 23:39:51', '2022-12-28 23:39:51', NULL, 'OS01'),
       ('giQyPPCOgc', 'qXuQr5x2TX', 15490000.00, '2023-01-02 19:31:22', '2023-01-02 19:31:22', NULL, 'OS01'),
       ('gsAYdtK7Jk', 'su6q9PWjdm', 9980000.00, '2023-01-02 18:46:25', '2023-01-02 18:48:56', NULL, 'OS02'),
       ('hy0M79vLGH', 'US01', 0.00, '2022-11-16 19:31:39', '2022-11-16 19:31:39', NULL, 'OS01'),
       ('IBe2oCunu4', 'US01', 48080000.00, '2022-12-29 17:34:56', '2022-12-29 17:34:56', NULL, 'OS01'),
       ('igRBVrOwSN', 'DHQOb5vbWI', 67970000.00, '2023-01-03 08:38:45', '2023-01-03 08:42:06', NULL, 'OS02'),
       ('jkYzCA39yB', 'qXuQr5x2TX', 125960000.00, '2023-01-02 15:48:49', '2023-01-02 15:48:49', NULL, 'OS01'),
       ('KfVrNvjjCI', 'aZAx3DdFfq', 26990000.00, '2023-01-02 13:50:08', '2023-01-02 13:53:30', NULL, 'OS02'),
       ('LWuKqt3ArM', 'DHQOb5vbWI', 42480000.00, '2023-01-03 08:42:18', '2023-01-03 08:42:18', NULL, 'OS01'),
       ('m1IBwzEma1', 'US01', 37690000.00, '2023-01-02 03:01:01', '2023-01-02 03:01:01', NULL, 'OS01'),
       ('mbp0HBetbA', 'qXuQr5x2TX', 133040000.00, '2023-01-02 15:42:59', '2023-01-02 15:45:11', NULL, 'OS02'),
       ('mCtX16hmCZ', 'US01', 53980000.00, '2022-07-08 21:20:42', '2022-07-08 21:20:42', NULL, 'OS01'),
       ('Nrjzr89JWf', 'US01', 49926000.35, '2022-07-08 11:50:38', '2022-07-08 14:32:40', NULL, 'OS02'),
       ('ocUDfon0Vd', 'US01', 4220999.89, '2023-01-01 02:33:23', '2023-01-01 02:33:23', NULL, 'OS01'),
       ('oLyS17n4Nu', 'US01', 26990000.00, '2022-11-16 19:30:51', '2022-11-16 19:30:51', NULL, 'OS01'),
       ('P4vLZwY0Lv', 'US01', 26990000.00, '2022-12-29 17:31:37', '2022-12-29 17:31:37', NULL, 'OS01'),
       ('pfoRh6BJxg', 'qXuQr5x2TX', 43490000.00, '2023-01-02 15:33:58', '2023-01-02 15:33:58', NULL, 'OS01'),
       ('QJVXwAN18r', 'US01', 4690000.00, '2022-07-08 02:50:42', '2022-07-08 02:50:42', NULL, 'OS01'),
       ('QTVBWzcUWe', 'US01', 53340000.00, '2022-07-08 11:29:55', '2022-07-08 14:32:35', NULL, 'OS02'),
       ('rjtZdjgi61', 'US01', 46380000.00, '2023-01-02 02:49:44', '2023-01-02 02:49:44', NULL, 'OS01'),
       ('sOUQ8N927Z', 'US01', 23256000.35, '2022-07-08 15:29:20', '2022-07-08 15:29:20', NULL, 'OS01'),
       ('Uo6UCzYbm4', 'qXuQr5x2TX', 51030000.00, '2023-01-02 14:47:19', '2023-01-02 14:48:15', NULL, 'OS02'),
       ('VaMPDWu24w', 'US01', 4220999.89, '2023-01-01 02:28:01', '2023-01-01 02:28:01', NULL, 'OS01'),
       ('VewyIVCmHB', 'qXuQr5x2TX', 73980000.00, '2023-01-02 20:40:23', '2023-01-02 20:40:23', NULL, 'OS01'),
       ('VT15dIlvlH', '96BhitTAhy', 8720999.77, '2023-01-02 18:06:29', '2023-01-02 18:09:38', NULL, 'OS02'),
       ('wsPyumTtjn', 'US01', 81630000.58, '2022-07-08 14:28:40', '2022-07-08 14:28:40', NULL, 'OS01'),
       ('x46tlV7rT7', 'qXuQr5x2TX', 26990000.00, '2023-01-02 14:44:51', '2023-01-02 14:45:38', NULL, 'OS02'),
       ('xxrrdN6XoX', 'US01', 80830000.00, '2022-07-08 02:33:44', '2022-07-08 02:33:44', NULL, 'OS01'),
       ('YHrMiVNKqw', '96BhitTAhy', 50600999.89, '2023-01-02 18:03:20', '2023-01-02 18:04:37', NULL, 'OS02'),
       ('yQGe971zrk', 'US01', 4220999.89, '2023-01-01 02:35:52', '2023-01-01 02:35:52', NULL, 'OS01'),
       ('yX5dj9yIMa', 'US01', 4220999.89, '2023-01-02 03:24:47', '2023-01-02 03:24:47', NULL, 'OS01'),
       ('zxwZM8lUuO', 'qXuQr5x2TX', 67970000.00, '2023-01-02 15:23:08', '2023-01-02 15:26:26', NULL, 'OS02');

DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`
(
    `item_id`    varchar(10) NOT NULL,
    `order_id`   varchar(10) NOT NULL,
    `product_id` varchar(10) NOT NULL,
    `quantity`   int         NOT NULL,
    `createdAt`  timestamp DEFAULT 0,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `order_id` (`order_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `orders_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
    CONSTRAINT `orders_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);
INSERT INTO `orders_item`
VALUES ('04RLHD7rjI', 'bANHup1tT7', 'PT213', 1, '2023-01-02 15:38:18', '2023-01-02 15:38:18', NULL),
       ('1ODud4PtBg', 'wsPyumTtjn', 'PT107', 5, '2022-07-08 14:28:40', '2022-07-08 14:28:40', NULL),
       ('1phwRDAQgS', 'rjtZdjgi61', 'PT213', 1, '2023-01-02 02:49:44', '2023-01-02 02:49:44', NULL),
       ('3eWJGwekCY', 'fnoFxeRsYx', 'PT206', 1, '2023-01-02 16:07:38', '2023-01-02 16:07:38', NULL),
       ('3wjpLWTGjw', 'LWuKqt3ArM', 'PT202', 1, '2023-01-03 08:42:18', '2023-01-03 08:42:18', NULL),
       ('4mhzih80dg', 'zxwZM8lUuO', 'PT202', 1, '2023-01-02 15:23:08', '2023-01-02 15:23:08', NULL),
       ('4ozEOvcGAS', 'IBe2oCunu4', 'PT511', 2, '2022-12-29 17:34:56', '2022-12-29 17:34:56', NULL),
       ('5Q8I1qqI6h', 'jkYzCA39yB', 'PT512', 1, '2023-01-02 15:48:49', '2023-01-02 15:48:49', NULL),
       ('5W4qmD8mkT', 'zxwZM8lUuO', 'PT513', 1, '2023-01-02 15:23:08', '2023-01-02 15:23:08', NULL),
       ('6J03s42Gio', 'jkYzCA39yB', 'PT515', 1, '2023-01-02 15:48:49', '2023-01-02 15:48:49', NULL),
       ('7GweOgGTdc', '2ARdSL6Ii3', 'PT109', 6, '2022-07-08 21:31:37', '2022-07-08 21:31:37', NULL),
       ('94ksTd0fWA', 'Uo6UCzYbm4', 'PT202', 1, '2023-01-02 14:47:19', '2023-01-02 14:47:19', NULL),
       ('9ErmQKTu0g', '5aZraW3nDq', 'PT202', 1, '2023-01-01 17:29:12', '2023-01-01 17:29:12', NULL),
       ('9Wgg2ZrXHY', 'zxwZM8lUuO', 'PT512', 1, '2023-01-02 15:23:08', '2023-01-02 15:23:08', NULL),
       ('BdOsQIKqiu', 'Uo6UCzYbm4', 'PT511', 1, '2023-01-02 14:47:19', '2023-01-02 14:47:19', NULL),
       ('bOmXyMTFlH', '5AdG4DlYAk', 'PT214', 1, '2023-01-02 15:39:49', '2023-01-02 15:39:49', NULL),
       ('BQ00JSFZRP', 'VT15dIlvlH', 'PT107', 1, '2023-01-02 18:06:29', '2023-01-02 18:06:29', NULL),
       ('dGx5uZ4VEM', 'AJWIytN1Nn', 'PT202', 1, '2023-01-02 20:44:47', '2023-01-02 20:44:47', NULL),
       ('E8PhPcMWa8', 'fG8kBd5ZUF', 'PT202', 1, '2023-01-02 03:24:05', '2023-01-02 03:24:05', NULL),
       ('e9wZRKhJVH', 'ocUDfon0Vd', 'PT206', 1, '2023-01-01 02:33:23', '2023-01-01 02:33:23', NULL),
       ('EYIjqjwSIq', 'bANHup1tT7', 'PT214', 1, '2023-01-02 15:38:18', '2023-01-02 15:38:18', NULL),
       ('fSipbKh3Ef', 'xxrrdN6XoX', 'PT206', 4, '2022-07-08 02:33:44', '2022-07-08 02:33:44', NULL),
       ('gcaSyPxjrO', 'YHrMiVNKqw', 'PT213', 1, '2023-01-02 18:03:20', '2023-01-02 18:03:20', NULL),
       ('gER7Jf0dTW', 'igRBVrOwSN', 'PT513', 1, '2023-01-03 08:38:45', '2023-01-03 08:38:45', NULL),
       ('GfSRoUCq29', 'YHrMiVNKqw', 'PT206', 1, '2023-01-02 18:03:20', '2023-01-02 18:03:20', NULL),
       ('hVP6A43tH7', 'VewyIVCmHB', 'PT201', 2, '2023-01-02 20:40:23', '2023-01-02 20:40:23', NULL),
       ('iJgGfGR6SF', 'P4vLZwY0Lv', 'PT202', 1, '2022-12-29 17:31:37', '2022-12-29 17:31:37', NULL),
       ('ImP348m1po', 'x46tlV7rT7', 'PT202', 1, '2023-01-02 14:44:51', '2023-01-02 14:44:51', NULL),
       ('IO4KqJExgS', 'Nrjzr89JWf', 'PT107', 3, '2022-07-08 11:50:38', '2022-07-08 11:50:38', NULL),
       ('JLrAVZxZlm', 'm1IBwzEma1', 'PT215', 1, '2023-01-02 03:01:01', '2023-01-02 03:01:01', NULL),
       ('khyUuUmqXO', '10FRkbPqF8', 'PT511', 1, '2023-01-02 15:12:06', '2023-01-02 15:12:06', NULL),
       ('lBDGLeINAp', 'igRBVrOwSN', 'PT202', 1, '2023-01-03 08:38:45', '2023-01-03 08:38:45', NULL),
       ('lFuCKOrzXl', 'bSijQxaeSx', 'PT511', 1, '2023-01-02 03:03:09', '2023-01-02 03:03:09', NULL),
       ('M6t22A20pO', 'xxrrdN6XoX', 'PT213', 3, '2022-07-08 02:33:44', '2022-07-08 02:33:44', NULL),
       ('N7vHWBKywi', 'mbp0HBetbA', 'PT511', 2, '2023-01-02 15:42:59', '2023-01-02 15:42:59', NULL),
       ('NKT7T3pfT5', 'igRBVrOwSN', 'PT512', 1, '2023-01-03 08:38:45', '2023-01-03 08:38:45', NULL),
       ('OBK4xPF1cC', 'gsAYdtK7Jk', 'PT402', 1, '2023-01-02 18:46:25', '2023-01-02 18:46:25', NULL),
       ('OguHfU3hCU', '1FMImOdTN2', 'PT202', 1, '2023-01-02 03:20:40', '2023-01-02 03:20:40', NULL),
       ('oSkRcbYrFj', 'CUbHwVYXFN', 'PT202', 1, '2023-01-02 13:36:22', '2023-01-02 13:36:22', NULL),
       ('ovwtWvMLbH', 'mbp0HBetbA', 'PT512', 2, '2023-01-02 15:42:59', '2023-01-02 15:42:59', NULL),
       ('pfGu29X226', 'mCtX16hmCZ', 'PT202', 2, '2022-07-08 21:20:42', '2022-07-08 21:20:42', NULL),
       ('PIKliFlJ9L', 'fnoFxeRsYx', 'PT223', 1, '2023-01-02 16:07:38', '2023-01-02 16:07:38', NULL),
       ('PlTmZgBNlY', 'Fp8XQuwrqx', 'PT512', 2, '2022-12-28 23:39:51', '2022-12-28 23:39:51', NULL),
       ('q6wfajtNgq', '5AdG4DlYAk', 'PT206', 1, '2023-01-02 15:39:49', '2023-01-02 15:39:49', NULL),
       ('q9pU2TsASS', 'VaMPDWu24w', 'PT206', 1, '2023-01-01 02:28:01', '2023-01-01 02:28:01', NULL),
       ('QfAUxvqho5', 'bANHup1tT7', 'PT206', 1, '2023-01-02 15:38:18', '2023-01-02 15:38:18', NULL),
       ('qPt97Wf8ev', 'mbp0HBetbA', 'PT202', 2, '2023-01-02 15:42:59', '2023-01-02 15:42:59', NULL),
       ('RZqMHq4kAc', 'dx2reKx6p2', 'PT214', 1, '2023-01-02 03:09:01', '2023-01-02 03:09:01', NULL),
       ('si1ixeFROa', 'fnoFxeRsYx', 'PT213', 1, '2023-01-02 16:07:38', '2023-01-02 16:07:38', NULL),
       ('T0fIU6oz5S', 'jkYzCA39yB', 'PT513', 1, '2023-01-02 15:48:49', '2023-01-02 15:48:49', NULL),
       ('tfytryGPbq', 'sOUQ8N927Z', 'PT107', 3, '2022-07-08 15:29:20', '2022-07-08 15:29:20', NULL),
       ('tjDid0YVVR', '874FfPjwAz', 'PT206', 1, '2023-01-02 18:16:35', '2023-01-02 18:16:35', NULL),
       ('TsxcFMClJS', 'wsPyumTtjn', 'PT109', 3, '2022-07-08 14:28:40', '2022-07-08 14:28:40', NULL),
       ('uO6ICeFfTp', 'yQGe971zrk', 'PT206', 1, '2023-01-01 02:35:52', '2023-01-01 02:35:52', NULL),
       ('uTVaNM4S2Q', 'QJVXwAN18r', 'PT206', 1, '2022-07-08 02:50:42', '2022-07-08 02:50:42', NULL),
       ('uWVrXp2PjK', 'yX5dj9yIMa', 'PT206', 1, '2023-01-02 03:24:47', '2023-01-02 03:24:47', NULL),
       ('vCYsPTXMNc', '5AdG4DlYAk', 'PT213', 1, '2023-01-02 15:39:49', '2023-01-02 15:39:49', NULL),
       ('vlUAm2rMjT', 'LWuKqt3ArM', 'PT512', 1, '2023-01-03 08:42:18', '2023-01-03 08:42:18', NULL),
       ('vM5G8y6WU1', 'rjtZdjgi61', 'PT214', 1, '2023-01-02 02:49:44', '2023-01-02 02:49:44', NULL),
       ('vn1OZx0mLv', 'gsAYdtK7Jk', 'PT401', 1, '2023-01-02 18:46:25', '2023-01-02 18:46:25', NULL),
       ('WaZXdsdhP7', 'oLyS17n4Nu', 'PT202', 1, '2022-11-16 19:30:51', '2022-11-16 19:30:51', NULL),
       ('WBuoCuuun8', 'jkYzCA39yB', 'PT516', 1, '2023-01-02 15:48:49', '2023-01-02 15:48:49', NULL),
       ('wZaWjYiOZN', 'YHrMiVNKqw', 'PT214', 1, '2023-01-02 18:03:20', '2023-01-02 18:03:20', NULL),
       ('X3xnts0FYE', 'giQyPPCOgc', 'PT512', 1, '2023-01-02 19:31:22', '2023-01-02 19:31:22', NULL),
       ('XFX5FBhKWo', 'pfoRh6BJxg', 'PT216', 1, '2023-01-02 15:33:58', '2023-01-02 15:33:58', NULL),
       ('ZHGhocr0d0', 'KfVrNvjjCI', 'PT202', 1, '2023-01-02 13:50:08', '2023-01-02 13:50:08', NULL);

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`
(
    `wishlist_id` varchar(10) NOT NULL,
    `user_id`     varchar(10) NOT NULL,
    `createdAt`   timestamp DEFAULT 0,
    `modifiedAt`  timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`   timestamp   NULL,
    PRIMARY KEY (`wishlist_id`, `user_id`)
);
INSERT INTO `wishlist`
VALUES ('1SSRHQJcgH', 'XcdtueGFss', '2023-01-03 08:36:37', '2023-01-03 08:36:37', NULL),
       ('229uV3QQwb', '96BhitTAhy', '2023-01-02 18:03:08', '2023-01-02 18:03:08', NULL),
       ('3w8xWVFQAR', 'z9OMq6ZMOs', '2022-06-19 14:39:43', '2022-06-19 14:39:43', NULL),
       ('bS3MBuQqPn', '1zWkMOGItV', '2022-06-20 10:55:24', '2022-06-20 10:55:24', NULL),
       ('DEMKcrtTOS', 'su6q9PWjdm', '2023-01-02 18:46:15', '2023-01-02 18:46:15', NULL),
       ('HoIy60WEBi', 'DHQOb5vbWI', '2023-01-03 08:37:28', '2023-01-03 08:37:28', NULL),
       ('IElyH63mr5', 'US03', '2022-06-19 14:53:07', '2022-06-19 14:53:07', NULL),
       ('j5LsQK4Lml', 'e40cqUMxWQ', '2022-07-01 19:21:49', '2022-07-01 19:21:49', NULL),
       ('KmXcjWuM5u', 'qXuQr5x2TX', '2023-01-02 14:33:21', '2023-01-02 14:33:21', NULL),
       ('lFNUOaKpmn', 'hADJi98tF6', '2023-01-02 20:44:35', '2023-01-02 20:44:35', NULL),
       ('N5GZTfiffr', 'OfHEehhBxX', '2022-07-08 17:57:11', '2022-07-08 17:57:11', NULL),
       ('QWHqbQn12d', 'US01', '2022-06-17 14:50:17', '2022-06-17 14:50:17', NULL),
       ('UUfPeBcpmq', 'aZAx3DdFfq', '2023-01-01 16:51:45', '2023-01-01 16:51:45', NULL);

DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item`
(
    `item_id`     varchar(10) NOT NULL,
    `wishlist_id` varchar(10) NOT NULL,
    `product_id`  varchar(10) NOT NULL,
    `createdAt`   timestamp DEFAULT 0,
    `modifiedAt`  timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`   timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `wishlist_id` (`wishlist_id`),
    CONSTRAINT `wishlist_item_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`)
);
INSERT INTO `wishlist_item`
VALUES ('Nb4xEWVsEj', 'QWHqbQn12d', 'PT109', '2022-07-09 09:40:31', '2022-07-09 09:40:31', NULL);

