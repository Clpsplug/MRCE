//////////////////////////////////////////////////////////////////////////
// HSP Simple Multiple Resolution Compatibility Extention (MRCE)        //
// Coded by Collapsed Plug, 2015.                                       //
//////////////////////////////////////////////////////////////////////////

/*

�����𑜓x�ւ̑Ή����s���܂��B
initDrawing�����s���AstartDrawing��endDrawing��g�ݍ��킹��repeat�ɓ˂����߂΂ǂ�ȉ𑜓x�ł������B
���̊g���@�\�́A�S��ʕ\������O�Ɉ�x��\���̃o�b�t�@�ɉ�ʂ�`�悵�Ă����ό`�R�s�[����d�g�݂��Ƃ��Ă���̂ŁA
���摜�̕`��p��ID255�Ԃ̃E�B���h�E���\�����������܂��B�摜�ȂǁA�ق��̃A�Z�b�g�ŏ㏑�����Ă��܂���
���������삵�Ȃ��Ȃ�܂��̂Œ��ӂ��Ă��������B

Protip:
gsel 0�ŁA�S��ʉ������E�B���h�E�ɒ��ڕ`��ł���悤�ɂȂ�܂��Bgsel 0���g������́Agsel 255��ł���startDrawing�ɔC�����ق����m���ł��B
*/
title "HSP Multiple Resolution Compatibility Extention V1.0"
mes "HSP Multiple Resolution Compatibility Extention V1.0�����탍�[�h����܂����B"
/*
���̃X�N���v�g�͒P�̂ŋN���������̂ł͂���܂���B�ق��̃X�N���v�g�ɑg�ݍ��ނƁA�S��ʕ\�����s�����߂̖��߂��g�p�ł���悤�ɂȂ�܂��B
��L�̃��b�Z�[�W�������ɂ́A���Ȃ��̃X�N���v�g�̑O��cls��ł��AinitDrawing���g�p���ĉ�ʂ��t�H�[�}�b�g���Ă��������B
initDrawing���g�p����܂ł͂����ʂ�E�B���h�E�������܂��̂ŁA���[�h���Ȃǂ̃R���\�[���\�����ł��܂��B
*/

































#module

//�������p�̏����Bgsel�ŗ��p����255�ԃE�B���h�E���\���ŏ���������B���̉�ʂ̓T�C�Y���������̋������莩�R�ɐݒ�ł��A�����̍D���ȉ𑜓x�ŃR�[�f�B���O�ł���B
#define global initDrawing(%1 = 640, %2 = 480) 	buffer 255, %1, %2 : MRAE_Origin_X = %1: MRAE_Origin_Y = %2

//�S��ʕ\���p�̃E�B���h�E��\��(������)����B������ID�O�ԁB
#deffunc setWindow
/*	screen 0,ginfo_dispx, ginfo_dispy, 2 //��x��\���ō���Ă݂�
	dox = -(ginfo(10) - ginfo_dispx) //Display Offset X
	doy = -(ginfo(11) - ginfo_dispy) //Display Offset Y
	screen 0,ginfo_dispx, ginfo_dispy, 0, dox / 2, doy - dox / 2*/
	bgscr  0, ginfo_dispx, ginfo_dispy, 0, 0, 0
return

//startDrawing�ɑ����ď������F�̃J���[�R�[�h(R, G, B)���w�肷�邱�Ƃ��ł���
#define global startDrawing(%1 = 0, %2 = 0, %3 = 0) redraw 0 : gsel 255 : color %1,%2,%3 : boxf

// %1 -> await�A %2 -> 1�ɂ���ƃA���`�G�C���A�V���O�L��(�������A��قǂ̃X�y�b�N���Ȃ��ƈ�u��FPS�ቺ�ɂȂ���B
//�f�t�H���g�ł�%1 = 24, %2 = 0�B�����̌�͂����Ă�"Loop"
#define global endDrawing(%1 = 24, %2 = 0) : gsel 0, 0 : pos 0,0 : gzoom ginfo(26), ginfo(27), 255, 0, 0, MRAE_Origin_X, MRAE_Origin_Y, %2 : redraw 1 : await %1

#global
