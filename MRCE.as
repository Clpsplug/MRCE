//////////////////////////////////////////////////////////////////////////
// HSP Simple Multiple Resolution Compatibility Extention (MRCE)        //
// Coded by Collapsed Plug, 2015.                                       //
//////////////////////////////////////////////////////////////////////////

/*

複数解像度への対応を行います。
initDrawingを実行し、startDrawingとendDrawingを組み合わせてrepeatに突っ込めばどんな解像度でもおｋ。
この拡張機能は、全画面表示する前に一度非表示のバッファに画面を描画してそれを変形コピーする仕組みをとっているので、
元画像の描画用にID255番のウィンドウを非表示初期化します。画像など、ほかのアセットで上書きしてしまうと
正しく動作しなくなりますので注意してください。

Protip:
gsel 0で、全画面化したウィンドウに直接描画できるようになります。gsel 0を使った後は、gsel 255を打つよりはstartDrawingに任せたほうが確実です。
*/
title "HSP Multiple Resolution Compatibility Extention V1.0"
mes "HSP Multiple Resolution Compatibility Extention V1.0が正常ロードされました。"
/*
このスクリプトは単体で起動されるものではありません。ほかのスクリプトに組み込むと、全画面表示を行うための命令が使用できるようになります。
上記のメッセージを消すには、あなたのスクリプトの前にclsを打つか、initDrawingを使用して画面をフォーマットしてください。
initDrawingを使用するまではいつも通りウィンドウを扱えますので、ロード中などのコンソール表示ができます。
*/

































#module

//初期化用の処理。gselで利用する255番ウィンドウを非表示で初期化する。この画面はサイズをメモリの許す限り自由に設定でき、自分の好きな解像度でコーディングできる。
#define global initDrawing(%1 = 640, %2 = 480) 	buffer 255, %1, %2 : MRAE_Origin_X = %1: MRAE_Origin_Y = %2

//全画面表示用のウィンドウを表示(初期化)する。こいつはID０番。
#deffunc setWindow
/*	screen 0,ginfo_dispx, ginfo_dispy, 2 //一度非表示で作ってみる
	dox = -(ginfo(10) - ginfo_dispx) //Display Offset X
	doy = -(ginfo(11) - ginfo_dispy) //Display Offset Y
	screen 0,ginfo_dispx, ginfo_dispy, 0, dox / 2, doy - dox / 2*/
	bgscr  0, ginfo_dispx, ginfo_dispy, 0, 0, 0
return

//startDrawingに続けて初期化色のカラーコード(R, G, B)を指定することもできる
#define global startDrawing(%1 = 0, %2 = 0, %3 = 0) redraw 0 : gsel 255 : color %1,%2,%3 : boxf

// %1 -> await、 %2 -> 1にするとアンチエイリアシング有効(ただし、よほどのスペックがないと一瞬でFPS低下につながる。
//デフォルトでは%1 = 24, %2 = 0。こいつの後はたいてい"Loop"
#define global endDrawing(%1 = 24, %2 = 0) : gsel 0, 0 : pos 0,0 : gzoom ginfo(26), ginfo(27), 255, 0, 0, MRAE_Origin_X, MRAE_Origin_Y, %2 : redraw 1 : await %1

#global
