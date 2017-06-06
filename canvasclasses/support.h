/**
 * 新規に追加した内部(一部プラグイン公開)関数やクラスについて
 */

/**
 * RGBAからBGRA(もしくは逆)へdestをlen幅変換する。
 * 変換の性質上、BRGAからRGBAに変換するのも同じ処理なので両方で使用できる。
 * 処理としては赤と青を入れ替えるのみで、他はそのままなので。
 */
void TVPRedBlueSwap(tjs_uint32 *dest, tjs_int len);


/**
 * RGBAからBGRA(もしくは逆)へsrcを変換したものをdestへlen幅コピーする。
 * 変換の性質上、BRGAからRGBAに変換するのも同じ処理なので両方で使用できる。
 * 処理としては赤と青を入れ替えるのみで、他はそのままなので。
 */
void TVPRedBlueSwapCopy(tjs_uint8 *dest, const tjs_uint8 *src, tjs_int len);




