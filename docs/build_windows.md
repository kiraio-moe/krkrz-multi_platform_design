---
layout: default
title: Windowsでのビルド方法
---

現在のところ従来から変更はありません(将来的にCMakeからvcxproj/slnファイル生成に切り替える可能性はあります)。
vcprojフォルダ内のtvpwin32.slnを開いてソリューションエクスプローラーでtvpwin32が選択された状態でビルドするだけです。
ただ、通常ビルドではANGLEのDLLが生成されないため、ANGLE/libEGLとANGLE/libGLESv2が選択された状態でそれぞれのDLLをビルドする必要があります。
ANGLEのDLLの再ビルドは基本的には必要ありません。
配布されているDLLをそのまま使用してください。
