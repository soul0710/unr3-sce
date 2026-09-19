---
name: unr3_writing
description: DÃ¹ng khi ngÆ°á»i dÃ¹ng Ä‘Æ°a má»™t Ã½ tÆ°á»Ÿng vÃ  muá»‘n táº¡o Ká»ŠCH Báº¢N video ká»ƒ chuyá»‡n dáº¡ng chill/relax Ä‘á»ƒ phá»§ nháº¡c piano (dáº¡o phá»‘, phong cáº£nh, hoÃ i niá»‡m). LÃ  bÆ°á»›c 1 cá»§a quy trÃ¬nh, táº¡o trÆ°á»›c khi sinh prompt áº£nh/video báº±ng unr3_scene.
---

# unr3_writing â€” Ã tÆ°á»Ÿng â†’ Ká»‹ch báº£n

## Overview
Biáº¿n má»™t Ã½ tÆ°á»Ÿng thÃ nh ká»‹ch báº£n video dáº¡ng cÃ¢u chuyá»‡n, tÃ´ng chill/relax Ä‘á»ƒ phá»§ nháº¡c
piano. Má»¥c tiÃªu: khÃ¡n giáº£ há»©ng thÃº vÃ  cáº£m Ä‘á»™ng, KHÃ”NG giáº­t gÃ¢n. Output lÃ  1 file
`kich_ban.md` tiáº¿ng Viá»‡t, chia thÃ nh cÃ¡c SHOT 8 giÃ¢y, cÃ³ khá»‘i STYLE ANCHOR á»Ÿ Ä‘áº§u â€” Ä‘Ãºng
chuáº©n Ä‘á»ƒ skill `unr3_scene` Ä‘á»c vÃ  sinh prompt áº£nh/video.

## Khi nÃ o dÃ¹ng
- NgÆ°á»i dÃ¹ng Ä‘Æ°a Ã½ tÆ°á»Ÿng (bá»‘i cáº£nh, mood) vÃ  muá»‘n ká»‹ch báº£n video relax.
- BÆ°á»›c 1 cá»§a quy trÃ¬nh 2 skill: unr3_writing (ká»‹ch báº£n) â†’ unr3_scene (prompt áº£nh + video).
- KHÃ”NG dÃ¹ng Ä‘á»ƒ sinh prompt áº£nh/video â€” Ä‘Ã³ lÃ  viá»‡c cá»§a unr3_scene.

## Input
1. Ã tÆ°á»Ÿng: bá»‘i cáº£nh, mÃ¹a, thá»i Ä‘iá»ƒm, cáº£m xÃºc mong muá»‘n.
2. Sá»‘ shot `N` HOáº¶C thá»i lÆ°á»£ng. Quy Ä‘á»•i: N = thá»i lÆ°á»£ng_giÃ¢y Ã· 8 (lÃ m trÃ²n).
   - Náº¿u ngÆ°á»i dÃ¹ng KHÃ”NG cung cáº¥p N/thá»i lÆ°á»£ng: há»i Ä‘Ãºng Má»˜T láº§n rá»“i lÃ m. KhÃ´ng tá»± bá»‹a Ä‘á»™ dÃ i.

## Bá»‘ cá»¥c file ká»‹ch báº£n (Báº®T BUá»˜C Ä‘Ãºng format nÃ y)
File `kich_ban.md`:

    # [TÃªn video]

    ## STYLE ANCHOR
    - MÃ¹a / thá»i Ä‘iá»ƒm: [vd: thu, hoÃ ng hÃ´n]
    - Báº£ng mÃ u: [vd: áº¥m, cam-nÃ¢u, náº¯ng nghiÃªng]
    - Cháº¥t phim: [vd: 35mm, grain nháº¹, Ä‘iá»‡n áº£nh]
    - á»ng kÃ­nh / mood: [vd: 35â€“50mm, hoÃ i niá»‡m, chill]
    - NhÃ¢n váº­t / motif cá»‘ Ä‘á»‹nh: [vd: cÃ´ gÃ¡i Ã¡o len be â€” hoáº·c "khÃ´ng cÃ³ nhÃ¢n váº­t"]

    ## SHOT 01
    - Cáº£nh: [mÃ´ táº£ hÃ¬nh áº£nh cá»¥ thá»ƒ]
    - Cáº£m xÃºc: [mood cá»§a cáº£nh]
    - MÃ¡y quay: [gá»£i Ã½ Má»˜T chuyá»ƒn Ä‘á»™ng cam cháº­m]
    - Nháº¡c: [nhá»‹p piano / cÆ°á»ng Ä‘á»™ lÃºc nÃ y]

    ## SHOT 02
    ...

Quy táº¯c:
- STYLE ANCHOR viáº¿t Má»˜T láº§n, Ã¡p cho cáº£ video â†’ giá»¯ má»i cáº£nh cÃ¹ng má»™t "bá»™ phim".
- ÄÃ¡nh sá»‘ shot liÃªn tá»¥c, má»—i shot tÆ°Æ¡ng á»©ng má»™t cáº£nh 8 giÃ¢y (KHÃ”NG ghi má»‘c thá»i gian).
- Má»—i shot = Má»˜T khoáº£nh kháº¯c/má»™t cÃº mÃ¡y. KhÃ´ng nhá»“i nhiá»u hÃ nh Ä‘á»™ng vÃ o 8s.

## Máº¡ch cáº£m xÃºc (chill, cháº¡m, khÃ´ng giáº­t gÃ¢n)
Chia N shot theo 4 Ä‘oáº¡n:
1. Má»Ÿ Ä‘áº§u gá»£i má»Ÿ â€” thiáº¿t láº­p khÃ´ng gian, má»i gá»i (~10â€“15%).
2. Dáº¡o bÆ°á»›c â€” chuá»—i cáº£nh quan sÃ¡t, chi tiáº¿t Ä‘á»i thÆ°á»ng Ä‘áº¹p (~55â€“65%).
3. Láº¯ng Ä‘á»ng â€” 1â€“2 khoáº£nh kháº¯c cháº­m láº¡i, cháº¡m cáº£m xÃºc (~15â€“20%).
4. Káº¿t áº¥m â€” Ä‘Ã³ng láº¡i nháº¹ nhÃ ng, Ä‘á»ƒ dÆ° vá»‹ (~10%).

## NguyÃªn táº¯c "chill"
- Cáº£nh tÄ©nh hoáº·c chuyá»ƒn Ä‘á»™ng cháº­m; khÃ´ng rÆ°á»£t Ä‘uá»•i, khÃ´ng cao trÃ o ká»‹ch tÃ­nh.
- Æ¯u tiÃªn chi tiáº¿t gá»£i cáº£m giÃ¡c: Ã¡nh sÃ¡ng, lÃ¡ rÆ¡i, hÆ¡i nÆ°á»›c cÃ  phÃª, bÆ°á»›c chÃ¢n.
- NgÃ´n tá»« ká»‹ch báº£n gá»£i hÃ¬nh, gá»n, dá»… hÃ¬nh dung Ä‘á»ƒ bÆ°á»›c sau chuyá»ƒn thÃ nh prompt.

## Output
- Ghi ra `kich_ban.md` vÃ  present cho ngÆ°á»i dÃ¹ng.
- Nháº¯c: "Xem láº¡i, sá»­a STYLE ANCHOR / thÃªm bá»›t shot tuá»³ Ã½; xong Ä‘Æ°a file nÃ y cho unr3_scene."

## Tá»± kiá»ƒm trÆ°á»›c khi giao
- [ ] CÃ³ STYLE ANCHOR Ä‘á»§ 5 dÃ²ng.
- [ ] ÄÃºng N shot (khÃ´ng ghi má»‘c thá»i gian).
- [ ] Má»—i shot chá»‰ má»™t nhá»‹p/má»™t cÃº mÃ¡y.
- [ ] CÃ³ Ä‘á»§ 4 Ä‘oáº¡n cáº£m xÃºc, cÃ³ káº¿t áº¥m.
- [ ] KhÃ´ng cÃ³ yáº¿u tá»‘ giáº­t gÃ¢n.
