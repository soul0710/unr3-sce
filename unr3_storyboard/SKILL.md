---
name: unr3_storyboard
description: DÃ¹ng khi ngÆ°á»i dÃ¹ng Ä‘Æ°a má»™t Ká»ŠCH Báº¢N (dáº¡ng SHOT cÃ³ STYLE ANCHOR, thÆ°á»ng tá»« unr3_writing) vÃ  muá»‘n sinh PROMPT áº¢NH dáº¡ng STORYBOARD nhiá»u khung (kÃ¨m chÃº thÃ­ch tá»«ng shot) cÃ¹ng PROMPT VIDEO 8 giÃ¢y cÃ³ má»‘c thá»i gian, Ä‘áº­m cháº¥t Ä‘iá»‡n áº£nh. LÃ  nhÃ¡nh thay tháº¿ cho unr3_scene. KhÃ´ng dÃ¹ng Ä‘á»ƒ viáº¿t ká»‹ch báº£n.
---

# unr3_storyboard â€” Ká»‹ch báº£n â†’ Storyboard áº£nh + Prompt video 8s

## Overview
Äá»c ká»‹ch báº£n Ä‘Ã£ duyá»‡t vÃ  sinh 2 file prompt tiáº¿ng Anh, Ä‘áº­m cháº¥t Ä‘iá»‡n áº£nh:
- `storyboard_prompts.md` â€” má»—i dÃ²ng lÃ  1 prompt táº¡o Má»˜T áº£nh storyboard nhiá»u khung (panel), má»—i panel kÃ¨m chÃº thÃ­ch shot.
- `video_prompts.md` â€” má»—i dÃ²ng lÃ  1 prompt video 8 giÃ¢y, chia má»‘c thá»i gian theo tá»«ng panel sao cho Tá»”NG = 8s.

KhÃ¡c `unr3_scene` (1 shot = 1 áº£nh = 1 video 8s): á»Ÿ Ä‘Ã¢y nhiá»u shot gá»™p vÃ o 1 storyboard,
vÃ  cáº£ storyboard Ä‘Ã³ dá»±ng thÃ nh 1 clip 8 giÃ¢y cÃ³ nhá»‹p cáº¯t Ä‘iá»‡n áº£nh.

## Khi nÃ o dÃ¹ng
- CÃ³ ká»‹ch báº£n dáº¡ng SHOT + STYLE ANCHOR (thÆ°á»ng do unr3_writing táº¡o).
- Muá»‘n workflow storyboard: gom nhiá»u shot vÃ o 1 báº£ng vÃ  1 clip 8s cÃ³ nhá»‹p cáº¯t Ä‘iá»‡n áº£nh.
- KHÃ”NG dÃ¹ng Ä‘á»ƒ viáº¿t ká»‹ch báº£n (unr3_writing) hay Ä‘á»ƒ lÃ m 1 shot = 1 clip (unr3_scene).

## Input
- File ká»‹ch báº£n (hoáº·c dÃ¡n ná»™i dung).
- Sá»‘ shot má»—i storyboard `P` (panels/board). KhÃ´ng nháº­p â†’ máº·c Ä‘á»‹nh P = 3. Há»i Ä‘Ãºng 1 láº§n náº¿u cáº§n.
- Thiáº¿u STYLE ANCHOR hoáº·c khÃ´ng tÃ¡ch Ä‘Æ°á»£c SHOT: bÃ¡o vÃ  há»i, KHÃ”NG tá»± bá»‹a.

## CÃ¡ch gá»™p storyboard
1. TrÃ­ch STYLE ANCHOR.
2. Äáº¿m SHOT = N. Gom liÃªn tiáº¿p má»—i P shot thÃ nh 1 STORYBOARD â†’ sá»‘ storyboard = ceil(N Ã· P).
   Storyboard cuá»‘i cÃ³ thá»ƒ Ã­t panel hÆ¡n.
3. Sinh Ä‘Ãºng (sá»‘ storyboard) dÃ²ng á»Ÿ Má»–I file. **Sá»‘ dÃ²ng 2 file Báº°NG NHAU.**

## Khá»›p theo dÃ²ng (Báº¤T BIáº¾N)
DÃ²ng k cá»§a `storyboard_prompts.md` â‡„ dÃ²ng k cá»§a `video_prompts.md` â‡„ STORYBOARD k.
- KHÃ”NG Ä‘Ã¡nh sá»‘, KHÃ”NG dÃ²ng trá»‘ng xen giá»¯a. Má»—i dÃ²ng lÃ  1 prompt hoÃ n chá»‰nh, tá»± Ä‘á»©ng Ä‘á»™c láº­p.

## Prompt STORYBOARD (áº£nh) â€” cÃ´ng thá»©c (má»—i storyboard = 1 dÃ²ng, tiáº¿ng Anh)
Má»™t áº£nh chá»©a cÃ¡c panel, má»—i panel cÃ³ nhÃ£n/chÃº thÃ­ch shot. NhÃ©t STYLE ANCHOR vÃ o dÃ²ng:
`Cinematic hand-drawn storyboard on a single 16:9 frame, [P] panels in a [row / 2x2] layout, each panel with a short caption label; Panel 1 â€” [shot 1: cáº£nh + gÃ³c mÃ¡y]; Panel 2 â€” [shot 2]; Panel 3 â€” [shot 3]; [STYLE ANCHOR: mÃ¹a, báº£ng mÃ u, á»‘ng kÃ­nh, mood], anamorphic cinematic look, filmic grain`

VÃ­ dá»¥:
`Cinematic hand-drawn storyboard on a single 16:9 frame, 3 panels in a row, each panel with a short caption label; Panel 1 â€” wide of a misty old-town corner at dawn, low angle; Panel 2 â€” medium of a flower vendor passing a wooden door; Panel 3 â€” close-up of a steaming coffee cup; autumn amber-brown palette, 35mm nostalgic mood, anamorphic cinematic look, filmic grain`

## Prompt VIDEO â€” cÃ´ng thá»©c (má»—i storyboard = 1 dÃ²ng, tiáº¿ng Anh, Tá»”NG = 8s)
Chia 8 giÃ¢y cho cÃ¡c panel báº±ng má»‘c thá»i gian; má»—i Ä‘oáº¡n animate Ä‘Ãºng panel Ä‘Ã³; cáº¯t cáº£nh mÆ°á»£t.
`Cinematic 8-second sequence, 16:9 anamorphic, filmic grain, [Ã¡nh sÃ¡ng]; 0â€“3s [panel 1: chuyá»ƒn cam + hÃ nh Ä‘á»™ng nháº¹]; 3â€“6s [panel 2]; 6â€“8s [panel 3]; smooth match-cut transitions, shallow depth of field, cinematic color grade, minimal ambient sound`

VÃ­ dá»¥:
`Cinematic 8-second sequence, 16:9 anamorphic, filmic grain, soft dawn light; 0â€“3s slow push-in on a misty old-town corner as leaves drift; 3â€“6s gentle pan following a flower vendor past a wooden door; 6â€“8s slow rack focus onto a steaming coffee cup; smooth match-cut transitions, shallow depth of field, cinematic color grade, minimal ambient sound`

Quy táº¯c má»‘c thá»i gian:
- Chia Ä‘á»u 8s cho P panel (P=3 â†’ ~0â€“3 / 3â€“6 / 6â€“8; P=2 â†’ 0â€“4 / 4â€“8; P=4 â†’ 0â€“2 / 2â€“4 / 4â€“6 / 6â€“8).
- CÃ³ thá»ƒ lá»‡ch nháº¹ Ä‘á»ƒ táº¡o nhá»‹p, nhÆ°ng Ä‘oáº¡n cuá»‘i LUÃ”N káº¿t thÃºc Ä‘Ãºng á»Ÿ 8s.
- Storyboard cuá»‘i Ã­t panel hÆ¡n thÃ¬ chia láº¡i cho vá»«a 8s.

## Äáº­m cháº¥t Ä‘iá»‡n áº£nh (báº¯t buá»™c á»Ÿ Má»ŒI dÃ²ng)
- Anamorphic / á»‘ng kÃ­nh Ä‘iá»‡n áº£nh, filmic grain, cinematic color grade, shallow depth of field.
- Ãnh sÃ¡ng cÃ³ chá»§ Ä‘Ã­ch (motivated light), chuyá»ƒn cáº£nh match-cut mÆ°á»£t, nhá»‹p cháº­m cÃ³ hÆ¡i thá»Ÿ.
- Giá»¯ nháº¥t quÃ¡n nhÃ¢n váº­t / báº£ng mÃ u / á»‘ng kÃ­nh qua má»i storyboard (láº¥y tá»« STYLE ANCHOR).

## Ã‚m thanh
- Äá»ƒ `minimal ambient sound` (ngÆ°á»i dÃ¹ng phá»§ nháº¡c piano lÃªn). KhÃ´ng thÃªm nháº¡c / giá»ng Ä‘á»c.

## Output
- Ghi `storyboard_prompts.md` vÃ  `video_prompts.md`, present cáº£ hai.

## Tá»± kiá»ƒm trÆ°á»›c khi giao
- [ ] Sá»‘ dÃ²ng 2 file báº±ng nhau vÃ  báº±ng sá»‘ storyboard = ceil(N Ã· P).
- [ ] Má»—i dÃ²ng storyboard nÃªu Ä‘á»§ P panel, má»—i panel cÃ³ chÃº thÃ­ch shot.
- [ ] Má»—i dÃ²ng video cÃ³ cÃ¡c má»‘c thá»i gian Tá»”NG Ä‘Ãºng 8s, Ä‘oáº¡n cuá»‘i káº¿t á»Ÿ 8s.
- [ ] Panel trong video khá»›p panel trong storyboard cÃ¹ng dÃ²ng.
- [ ] Má»i dÃ²ng cÃ³ yáº¿u tá»‘ Ä‘iá»‡n áº£nh (anamorphic / grain / color grade) + 16:9 + minimal ambient sound.
