PRAGMA synchronous = 0;
PRAGMA page_size = 4096;
PRAGMA journal_mode = wal;
PRAGMA journal_size_limit = 1073741824;


CREATE TABLE IF NOT EXISTS `web_logs` (
    `time` INTEGER,
    `ip` TEXT,
    `domain` TEXT,
    `server_name` TEXT,
    `method` TEXT,
    `status_code` INTEGER,
    `uri` TEXT,
    `body_length` INTEGER,
    `referer` TEXT DEFAULT "",
    `user_agent` TEXT,
    `is_spider` INTEGER DEFAULT 0,
    `protocol` TEXT,
    `request_time` INTEGER,
    `request_headers` TEXT DEFAULT "",
    `ip_list` TEXT DEFAULT "",
    `client_port` INTEGER DEFAULT -1
);

CREATE INDEX time_idx ON web_logs(`time`);
CREATE INDEX uri_idx ON web_logs (`uri`);
CREATE INDEX ip_idx ON web_logs (`ip`);
CREATE INDEX referer_idx ON web_logs (`referer`);
CREATE INDEX method_idx ON web_logs (`method`);
CREATE INDEX status_code_idx ON web_logs (`status_code`);
CREATE INDEX request_time_idx ON web_logs (`request_time`);
CREATE INDEX is_spider_idx ON web_logs (`is_spider`);
CREATE INDEX all_union_idx ON web_logs (`time`,`ip`,`method`,`status_code`,`request_time`,`is_spider`);


CREATE TABLE IF NOT EXISTS `client_stat`(
    `time` INTEGER PRIMARY KEY,
    `weixin` INTEGER DEFAULT 0,
    `android` INTEGER DEFAULT 0,
    `iphone` INTEGER DEFAULT 0,
    `mac` INTEGER DEFAULT 0,
    `windows` INTEGER DEFAULT 0,
    `linux` INTEGER DEFAULT 0,
    `edeg` INTEGER DEFAULT 0,
    `firefox` INTEGER DEFAULT 0,
    `msie` INTEGER DEFAULT 0,
    `metasr` INTEGER DEFAULT 0,
    `qh360` INTEGER DEFAULT 0,
    `theworld` INTEGER DEFAULT 0,
    `tt` INTEGER DEFAULT 0,
    `maxthon` INTEGER DEFAULT 0,
    `opera` INTEGER DEFAULT 0,
    `qq` INTEGER DEFAULT 0,
    `uc` INTEGER DEFAULT 0,
    `pc2345` INTEGER DEFAULT 0, 
    `safari` INTEGER DEFAULT 0,
    `chrome` INTEGER DEFAULT 0,
    `machine` INTEGER DEFAULT 0,
    `mobile` INTEGER DEFAULT 0,
    `other` INTEGER DEFAULT 0
);

CREATE TABLE `request_stat`(
    `time` INTEGER PRIMARY KEY,
    `req` INTEGER DEFAULT 0,
    `pv` INTEGER DEFAULT 0,
    `uv` INTEGER DEFAULT 0,
    `ip` INTEGER DEFAULT 0,
    `length` INTEGER DEFAULT 0,
    `spider` INTEGER DEFAULT 0,
    `status_500` INTEGER DEFAULT 0,
    `status_501` INTEGER DEFAULT 0,
    `status_502` INTEGER DEFAULT 0,
    `status_503` INTEGER DEFAULT 0,
    `status_504` INTEGER DEFAULT 0,
    `status_505` INTEGER DEFAULT 0,
    `status_506` INTEGER DEFAULT 0,
    `status_507` INTEGER DEFAULT 0,
    `status_509` INTEGER DEFAULT 0,
    `status_510` INTEGER DEFAULT 0,
    `status_400` INTEGER DEFAULT 0,
    `status_401` INTEGER DEFAULT 0,
    `status_402` INTEGER DEFAULT 0,
    `status_403` INTEGER DEFAULT 0,
    `status_404` INTEGER DEFAULT 0,
    `http_get` INTEGER DEFAULT 0,
    `http_post` INTEGER DEFAULT 0,
    `http_put` INTEGER DEFAULT 0,
    `http_patch` INTEGER DEFAULT 0,
    `http_delete` INTEGER DEFAULT 0
);

CREATE TABLE `spider_stat`(
    `time` INTEGER PRIMARY KEY,
    `bytes` INTEGER DEFAULT 0,
    `bing` INTEGER DEFAULT 0,
    `soso` INTEGER DEFAULT 0,
    `yahoo` INTEGER DEFAULT 0,
    `sogou` INTEGER DEFAULT 0,
    `google` INTEGER DEFAULT 0,
    `baidu` INTEGER DEFAULT 0,
    `qh360` INTEGER DEFAULT 0,
    `youdao` INTEGER DEFAULT 0,
    `yandex` INTEGER DEFAULT 0,
    `dnspod` INTEGER DEFAULT 0,
    `yisou` INTEGER DEFAULT 0,
    `mpcrawler` INTEGER DEFAULT 0,
    `duckduckgo` INTEGER DEFAULT 0,
    `bytes_flow` INTEGER DEFAULT 0, 
    `bing_flow` INTEGER DEFAULT 0, 
    `soso_flow` INTEGER DEFAULT 0, 
    `yahoo_flow` INTEGER DEFAULT 0, 
    `sogou_flow` INTEGER DEFAULT 0, 
    `google_flow` INTEGER DEFAULT 0, 
    `baidu_flow` INTEGER DEFAULT 0, 
    `qh360_flow` INTEGER DEFAULT 0, 
    `youdao_flow` INTEGER DEFAULT 0, 
    `yandex_flow` INTEGER DEFAULT 0, 
    `dnspod_flow` INTEGER DEFAULT 0, 
    `yisou_flow` INTEGER DEFAULT 0, 
    `other_flow` INTEGER DEFAULT 0, 
    `mpcrawler_flow` INTEGER DEFAULT 0, 
    `duckduckgo_flow` INTEGER DEFAULT 0,
    `other` INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `uri_stat` (
    `uri_md5` CHAR(32) PRIMARY KEY,
    `uri` TEXT,
    `day1` INTEGER DEFAULT 0,
    `day2` INTEGER DEFAULT 0,
    `day3` INTEGER DEFAULT 0,
    `day4` INTEGER DEFAULT 0,
    `day5` INTEGER DEFAULT 0,
    `day6` INTEGER DEFAULT 0,
    `day7` INTEGER DEFAULT 0,
    `day8` INTEGER DEFAULT 0,
    `day9` INTEGER DEFAULT 0,
    `day10` INTEGER DEFAULT 0,
    `day11` INTEGER DEFAULT 0,
    `day12` INTEGER DEFAULT 0,
    `day13` INTEGER DEFAULT 0,
    `day14` INTEGER DEFAULT 0,
    `day15` INTEGER DEFAULT 0,
    `day16` INTEGER DEFAULT 0,
    `day17` INTEGER DEFAULT 0,
    `day18` INTEGER DEFAULT 0,
    `day19` INTEGER DEFAULT 0,
    `day20` INTEGER DEFAULT 0,
    `day21` INTEGER DEFAULT 0,
    `day22` INTEGER DEFAULT 0,
    `day23` INTEGER DEFAULT 0,
    `day24` INTEGER DEFAULT 0,
    `day25` INTEGER DEFAULT 0,
    `day26` INTEGER DEFAULT 0,
    `day27` INTEGER DEFAULT 0,
    `day28` INTEGER DEFAULT 0,
    `day29` INTEGER DEFAULT 0,
    `day30` INTEGER DEFAULT 0,
    `day31` INTEGER DEFAULT 0
);

ALTER TABLE `uri_stat` ADD COLUMN `flow1` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow2` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow3` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow4` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow5` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow6` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow7` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow8` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow9` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow10` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow11` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow12` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow13` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow14` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow15` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow16` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow17` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow18` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow19` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow20` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow21` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow22` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow23` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow24` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow25` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow26` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow27` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow28` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow29` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow30` INTEGER DEFAULT 0;
ALTER TABLE `uri_stat` ADD COLUMN `flow31` INTEGER DEFAULT 0;

CREATE TABLE IF NOT EXISTS `ip_stat` (
    `ip` CHAR(15) PRIMARY KEY,
    `area` CHAR(8) DEFAULT "",
    `day1` INTEGER DEFAULT 0,
    `day2` INTEGER DEFAULT 0,
    `day3` INTEGER DEFAULT 0,
    `day4` INTEGER DEFAULT 0,
    `day5` INTEGER DEFAULT 0,
    `day6` INTEGER DEFAULT 0,
    `day7` INTEGER DEFAULT 0,
    `day8` INTEGER DEFAULT 0,
    `day9` INTEGER DEFAULT 0,
    `day10` INTEGER DEFAULT 0,
    `day11` INTEGER DEFAULT 0,
    `day12` INTEGER DEFAULT 0,
    `day13` INTEGER DEFAULT 0,
    `day14` INTEGER DEFAULT 0,
    `day15` INTEGER DEFAULT 0,
    `day16` INTEGER DEFAULT 0,
    `day17` INTEGER DEFAULT 0,
    `day18` INTEGER DEFAULT 0,
    `day19` INTEGER DEFAULT 0,
    `day20` INTEGER DEFAULT 0,
    `day21` INTEGER DEFAULT 0,
    `day22` INTEGER DEFAULT 0,
    `day23` INTEGER DEFAULT 0,
    `day24` INTEGER DEFAULT 0,
    `day25` INTEGER DEFAULT 0,
    `day26` INTEGER DEFAULT 0,
    `day27` INTEGER DEFAULT 0,
    `day28` INTEGER DEFAULT 0,
    `day29` INTEGER DEFAULT 0,
    `day30` INTEGER DEFAULT 0,
    `day31` INTEGER DEFAULT 0
);

ALTER TABLE `ip_stat` ADD COLUMN `flow1` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow2` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow3` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow4` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow5` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow6` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow7` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow8` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow9` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow10` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow11` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow12` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow13` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow14` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow15` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow16` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow17` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow18` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow19` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow20` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow21` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow22` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow23` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow24` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow25` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow26` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow27` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow28` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow29` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow30` INTEGER DEFAULT 0;
ALTER TABLE `ip_stat` ADD COLUMN `flow31` INTEGER DEFAULT 0;


CREATE TABLE `referer_stat`(
    `time` INTEGER,
    `domain` TEXT,
    `count` INTEGER DEFAULT 0
);
