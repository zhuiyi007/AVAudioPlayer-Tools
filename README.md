AVAudioPlayer-Tools
===================

音效的分类,根据名称来控制音乐音效


播放指定名称的音效
+ (void)playSystemSound:(NSString *)soundName;

销毁指定名称的音效(内存警告时使用)
+ (void)disposeSystemSound:(NSString *)soundName;


播放指定名称的音乐
+ (AVAudioPlayer *)playMusic:(NSString *)musicName;

暂停指定名称的音乐
+ (void)pauseMusic:(NSString *)musicName;

停止指定名称的音乐
+ (void)stopMusic:(NSString *)musicName;
