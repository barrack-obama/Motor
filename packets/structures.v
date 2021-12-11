module packets

import io

pub struct UserID {
	id int
}

pub fn login_reply(u UserID) []byte {
	return io.make_packet<UserID>(.cho_user_id, u)
}

pub struct Announce {
	msg string
}

pub fn announce(a Announce) []byte {
	return io.make_packet<Announce>(.cho_notification, a)
}

pub struct Protocol {
	version int
}

pub fn protocol() []byte {
	return io.make_packet<Protocol>(.cho_protocol_version, Protocol{ version: 19 })
}

pub struct UserStats {
	id          int
	status      u8
	status_text string
	map_md5     string
	cur_mods    u32
	play_mode   i8
	map_id      int
	r_score     i64
	accuracy    f32
	playcount   int
	t_score     i64
	rank        int
	pp          i16
}

pub fn user_stats(u UserStats) []byte {
	return io.make_packet<UserStats>(.cho_user_stats, u)
}

struct Empty {}

pub fn chan_info_end() []byte {
	return io.make_packet<Empty>(.cho_channel_info_end, Empty{})
}

pub struct ServerRestart {
	ms int
}

pub fn server_restart(s ServerRestart) []byte {
	return io.make_packet<ServerRestart>(.cho_restart, s)
}

pub struct Friends {
	ids []int
}

pub fn friends_list(friends Friends) []byte {
	return io.make_packet<Friends>(.cho_friends_list, friends)
}

pub struct ChanJoin {
	name string
}

pub fn chan_join(c ChanJoin) []byte {
	return io.make_packet<ChanJoin>(.cho_channel_join_success, c)
}

pub struct ChanInfo {
	name        string
	description string
	connected   int
}

pub fn chan_info(c ChanInfo) []byte {
	return io.make_packet<ChanInfo>(.cho_channel_info, c)
}
