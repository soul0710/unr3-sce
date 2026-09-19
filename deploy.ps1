# deploy.ps1 - day 3 skill unr3 len GitHub repo private (SSH)
# Chay trong PowerShell: mo thu muc trong, roi:  .\deploy.ps1
$ErrorActionPreference = 'Stop'
$repo = 'unr3-sce'

Write-Host "==> Tao thu muc + file SKILL.md" -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path 'unr3_writing','unr3_scene','unr3_storyboard' | Out-Null

$writing = @'
---
name: unr3_writing
description: Dùng khi người dùng đưa một ý tưởng và muốn tạo KỊCH BẢN video kể chuyện dạng chill/relax để phủ nhạc piano (dạo phố, phong cảnh, hoài niệm). Là bước 1 của quy trình, tạo trước khi sinh prompt ảnh/video bằng unr3_scene.
---

# unr3_writing — Ý tưởng → Kịch bản

## Overview
Biến một ý tưởng thành kịch bản video dạng câu chuyện, tông chill/relax để phủ nhạc
piano. Mục tiêu: khán giả hứng thú và cảm động, KHÔNG giật gân. Output là 1 file
`kich_ban.md` tiếng Việt, chia thành các SHOT 8 giây, có khối STYLE ANCHOR ở đầu — đúng
chuẩn để skill `unr3_scene` đọc và sinh prompt ảnh/video.

## Khi nào dùng
- Người dùng đưa ý tưởng (bối cảnh, mood) và muốn kịch bản video relax.
- Bước 1 của quy trình 2 skill: unr3_writing (kịch bản) → unr3_scene (prompt ảnh + video).
- KHÔNG dùng để sinh prompt ảnh/video — đó là việc của unr3_scene.

## Input
1. Ý tưởng: bối cảnh, mùa, thời điểm, cảm xúc mong muốn.
2. Số shot `N` HOẶC thời lượng. Quy đổi: N = thời lượng_giây ÷ 8 (làm tròn).
   - Nếu người dùng KHÔNG cung cấp N/thời lượng: hỏi đúng MỘT lần rồi làm. Không tự bịa độ dài.

## Bố cục file kịch bản (BẮT BUỘC đúng format này)
File `kich_ban.md`:

    # [Tên video]

    ## STYLE ANCHOR
    - Mùa / thời điểm: [vd: thu, hoàng hôn]
    - Bảng màu: [vd: ấm, cam-nâu, nắng nghiêng]
    - Chất phim: [vd: 35mm, grain nhẹ, điện ảnh]
    - Ống kính / mood: [vd: 35–50mm, hoài niệm, chill]
    - Nhân vật / motif cố định: [vd: cô gái áo len be — hoặc "không có nhân vật"]

    ## SHOT 01
    - Cảnh: [mô tả hình ảnh cụ thể]
    - Cảm xúc: [mood của cảnh]
    - Máy quay: [gợi ý MỘT chuyển động cam chậm]
    - Nhạc: [nhịp piano / cường độ lúc này]

    ## SHOT 02
    ...

Quy tắc:
- STYLE ANCHOR viết MỘT lần, áp cho cả video → giữ mọi cảnh cùng một "bộ phim".
- Đánh số shot liên tục, mỗi shot tương ứng một cảnh 8 giây (KHÔNG ghi mốc thời gian).
- Mỗi shot = MỘT khoảnh khắc/một cú máy. Không nhồi nhiều hành động vào 8s.

## Mạch cảm xúc (chill, chạm, không giật gân)
Chia N shot theo 4 đoạn:
1. Mở đầu gợi mở — thiết lập không gian, mời gọi (~10–15%).
2. Dạo bước — chuỗi cảnh quan sát, chi tiết đời thường đẹp (~55–65%).
3. Lắng đọng — 1–2 khoảnh khắc chậm lại, chạm cảm xúc (~15–20%).
4. Kết ấm — đóng lại nhẹ nhàng, để dư vị (~10%).

## Nguyên tắc "chill"
- Cảnh tĩnh hoặc chuyển động chậm; không rượt đuổi, không cao trào kịch tính.
- Ưu tiên chi tiết gợi cảm giác: ánh sáng, lá rơi, hơi nước cà phê, bước chân.
- Ngôn từ kịch bản gợi hình, gọn, dễ hình dung để bước sau chuyển thành prompt.

## Output
- Ghi ra `kich_ban.md` và present cho người dùng.
- Nhắc: "Xem lại, sửa STYLE ANCHOR / thêm bớt shot tuỳ ý; xong đưa file này cho unr3_scene."

## Tự kiểm trước khi giao
- [ ] Có STYLE ANCHOR đủ 5 dòng.
- [ ] Đúng N shot (không ghi mốc thời gian).
- [ ] Mỗi shot chỉ một nhịp/một cú máy.
- [ ] Có đủ 4 đoạn cảm xúc, có kết ấm.
- [ ] Không có yếu tố giật gân.
'@
Set-Content -Path 'unr3_writing/SKILL.md' -Value $writing -Encoding utf8

$scene = @'
---
name: unr3_scene
description: Dùng khi người dùng đưa một KỊCH BẢN dạng SHOT có STYLE ANCHOR (thường từ unr3_writing) và muốn sinh PROMPT tạo ảnh và PROMPT tạo video. Là bước 2 của quy trình. Không dùng để viết kịch bản.
---

# unr3_scene — Kịch bản → Prompt ảnh + Prompt video

## Overview
Đọc kịch bản đã duyệt và sinh 2 file prompt tiếng Anh: `image_prompts.md` (khung hình
tĩnh) và `video_prompts.md` (animate đúng khung đó 8 giây bằng Veo 3.1). Người dùng tạo
ảnh trước rồi dùng ảnh làm frame cho video, nên ảnh và video PHẢI khớp theo thứ tự.

## Khi nào dùng
- Có sẵn kịch bản dạng SHOT + STYLE ANCHOR (thường do unr3_writing tạo).
- Bước 2 của quy trình 2 skill.
- KHÔNG dùng để viết kịch bản — đó là unr3_writing.

## Input
- File kịch bản (hoặc dán nội dung). Nếu thiếu STYLE ANCHOR hoặc không tách được SHOT:
  báo và hỏi, KHÔNG tự bịa.

## Cách đọc kịch bản
1. Trích STYLE ANCHOR (mùa, màu, chất phim, ống kính, nhân vật/motif).
2. Đếm số SHOT = N.
3. Sinh đúng N dòng ở MỖI file. **Số dòng 2 file BẰNG NHAU tuyệt đối.**

## Khớp theo dòng (BẤT BIẾN)
Dòng k của `image_prompts.md` ⇄ dòng k của `video_prompts.md` ⇄ SHOT k.
- KHÔNG đánh số, KHÔNG bullet, KHÔNG dòng trống xen giữa.
- Mỗi dòng là MỘT prompt hoàn chỉnh, tự đứng độc lập (copy nguyên dòng là chạy được).

## Prompt ẢNH — công thức (mỗi shot = 1 dòng, tiếng Anh)
Mô tả một KHUNG HÌNH TĨNH. Nhét sẵn STYLE ANCHOR vào từng dòng:
`[subject & trạng thái tĩnh], [bối cảnh cụ thể], [bố cục & ống kính vd 35mm], [ánh sáng & thời điểm], [bảng màu & chất phim/grain], [mood], cinematic, 16:9`

Ví dụ (1 dòng):
`A young woman in a beige knit sweater standing at a quiet old-town street corner, autumn leaves on wet cobblestone, medium shot 35mm, soft morning light from the left, amber-brown palette with gentle 35mm film grain, nostalgic and calm, cinematic, 16:9`

## Prompt VIDEO — công thức (mỗi shot = 1 dòng, Veo 3.1, tiếng Anh)
Chỉ ANIMATE đúng khung ảnh đó trong 8 giây. KHÔNG đổi sang cảnh khác.
`[một chuyển động cam chậm: slow push-in / gentle pan / subtle parallax], [chủ thể chuyển động nhẹ], [chuyển động nền: lá rơi, hơi nước, người xa xa], [ánh sáng giữ nguyên mood], minimal ambient sound, slow calm pacing, 8s, 16:9`

Ví dụ (1 dòng):
`Slow push-in on the woman as she gently turns her head, autumn leaves drifting past and faint steam rising from a coffee cup, soft morning light holding steady, minimal ambient sound, slow calm pacing, 8s, 16:9`

## Kỷ luật "frame → animate"
- Video prompt phải mô tả CÙNG khung ảnh, chỉ thêm chuyển động. CẤM mô tả cảnh mới,
  cắt cảnh, hay nhân vật mới trong 8s.
- Một cú cam + world motion nhẹ. Không nhồi nhiều hành động.
- Âm thanh: để `minimal ambient sound` (hoặc bỏ) vì người dùng phủ nhạc piano lên.
  Không thêm nhạc/giọng đọc trong prompt.

## Giữ nhất quán
- Nhân vật/trang phục/địa điểm giữ y hệt qua các dòng (lấy từ STYLE ANCHOR + motif).
- Cùng ống kính/bảng màu/chất phim ở mọi dòng.

## Output
- Ghi `image_prompts.md` và `video_prompts.md`, present cả hai.

## Tự kiểm trước khi giao
- [ ] Số dòng 2 file bằng nhau và bằng N shot.
- [ ] Không đánh số, không dòng trống, mỗi dòng tự đứng độc lập.
- [ ] Mỗi dòng có `16:9`; video có `8s` + `minimal ambient sound` + nhịp chậm.
- [ ] Video animate đúng khung ảnh cùng dòng, không đổi cảnh.
- [ ] STYLE ANCHOR (màu/ống kính/chất phim) xuất hiện nhất quán ở mọi dòng.
'@
Set-Content -Path 'unr3_scene/SKILL.md' -Value $scene -Encoding utf8

$storyboard = @'
---
name: unr3_storyboard
description: Dùng khi người dùng đưa một KỊCH BẢN (dạng SHOT có STYLE ANCHOR, thường từ unr3_writing) và muốn sinh PROMPT ẢNH dạng STORYBOARD nhiều khung (kèm chú thích từng shot) cùng PROMPT VIDEO 8 giây có mốc thời gian, đậm chất điện ảnh. Là nhánh thay thế cho unr3_scene. Không dùng để viết kịch bản.
---

# unr3_storyboard — Kịch bản → Storyboard ảnh + Prompt video 8s

## Overview
Đọc kịch bản đã duyệt và sinh 2 file prompt tiếng Anh, đậm chất điện ảnh:
- `storyboard_prompts.md` — mỗi dòng là 1 prompt tạo MỘT ảnh storyboard nhiều khung (panel), mỗi panel kèm chú thích shot.
- `video_prompts.md` — mỗi dòng là 1 prompt video 8 giây, chia mốc thời gian theo từng panel sao cho TỔNG = 8s.

Khác `unr3_scene` (1 shot = 1 ảnh = 1 video 8s): ở đây nhiều shot gộp vào 1 storyboard,
và cả storyboard đó dựng thành 1 clip 8 giây có nhịp cắt điện ảnh.

## Khi nào dùng
- Có kịch bản dạng SHOT + STYLE ANCHOR (thường do unr3_writing tạo).
- Muốn workflow storyboard: gom nhiều shot vào 1 bảng và 1 clip 8s có nhịp cắt điện ảnh.
- KHÔNG dùng để viết kịch bản (unr3_writing) hay để làm 1 shot = 1 clip (unr3_scene).

## Input
- File kịch bản (hoặc dán nội dung).
- Số shot mỗi storyboard `P` (panels/board). Không nhập → mặc định P = 3. Hỏi đúng 1 lần nếu cần.
- Thiếu STYLE ANCHOR hoặc không tách được SHOT: báo và hỏi, KHÔNG tự bịa.

## Cách gộp storyboard
1. Trích STYLE ANCHOR.
2. Đếm SHOT = N. Gom liên tiếp mỗi P shot thành 1 STORYBOARD → số storyboard = ceil(N ÷ P).
   Storyboard cuối có thể ít panel hơn.
3. Sinh đúng (số storyboard) dòng ở MỖI file. **Số dòng 2 file BẰNG NHAU.**

## Khớp theo dòng (BẤT BIẾN)
Dòng k của `storyboard_prompts.md` ⇄ dòng k của `video_prompts.md` ⇄ STORYBOARD k.
- KHÔNG đánh số, KHÔNG dòng trống xen giữa. Mỗi dòng là 1 prompt hoàn chỉnh, tự đứng độc lập.

## Prompt STORYBOARD (ảnh) — công thức (mỗi storyboard = 1 dòng, tiếng Anh)
Một ảnh chứa các panel, mỗi panel có nhãn/chú thích shot. Nhét STYLE ANCHOR vào dòng:
`Cinematic hand-drawn storyboard on a single 16:9 frame, [P] panels in a [row / 2x2] layout, each panel with a short caption label; Panel 1 — [shot 1: cảnh + góc máy]; Panel 2 — [shot 2]; Panel 3 — [shot 3]; [STYLE ANCHOR: mùa, bảng màu, ống kính, mood], anamorphic cinematic look, filmic grain`

Ví dụ:
`Cinematic hand-drawn storyboard on a single 16:9 frame, 3 panels in a row, each panel with a short caption label; Panel 1 — wide of a misty old-town corner at dawn, low angle; Panel 2 — medium of a flower vendor passing a wooden door; Panel 3 — close-up of a steaming coffee cup; autumn amber-brown palette, 35mm nostalgic mood, anamorphic cinematic look, filmic grain`

## Prompt VIDEO — công thức (mỗi storyboard = 1 dòng, tiếng Anh, TỔNG = 8s)
Chia 8 giây cho các panel bằng mốc thời gian; mỗi đoạn animate đúng panel đó; cắt cảnh mượt.
`Cinematic 8-second sequence, 16:9 anamorphic, filmic grain, [ánh sáng]; 0–3s [panel 1: chuyển cam + hành động nhẹ]; 3–6s [panel 2]; 6–8s [panel 3]; smooth match-cut transitions, shallow depth of field, cinematic color grade, minimal ambient sound`

Ví dụ:
`Cinematic 8-second sequence, 16:9 anamorphic, filmic grain, soft dawn light; 0–3s slow push-in on a misty old-town corner as leaves drift; 3–6s gentle pan following a flower vendor past a wooden door; 6–8s slow rack focus onto a steaming coffee cup; smooth match-cut transitions, shallow depth of field, cinematic color grade, minimal ambient sound`

Quy tắc mốc thời gian:
- Chia đều 8s cho P panel (P=3 → ~0–3 / 3–6 / 6–8; P=2 → 0–4 / 4–8; P=4 → 0–2 / 2–4 / 4–6 / 6–8).
- Có thể lệch nhẹ để tạo nhịp, nhưng đoạn cuối LUÔN kết thúc đúng ở 8s.
- Storyboard cuối ít panel hơn thì chia lại cho vừa 8s.

## Đậm chất điện ảnh (bắt buộc ở MỌI dòng)
- Anamorphic / ống kính điện ảnh, filmic grain, cinematic color grade, shallow depth of field.
- Ánh sáng có chủ đích (motivated light), chuyển cảnh match-cut mượt, nhịp chậm có hơi thở.
- Giữ nhất quán nhân vật / bảng màu / ống kính qua mọi storyboard (lấy từ STYLE ANCHOR).

## Âm thanh
- Để `minimal ambient sound` (người dùng phủ nhạc piano lên). Không thêm nhạc / giọng đọc.

## Output
- Ghi `storyboard_prompts.md` và `video_prompts.md`, present cả hai.

## Tự kiểm trước khi giao
- [ ] Số dòng 2 file bằng nhau và bằng số storyboard = ceil(N ÷ P).
- [ ] Mỗi dòng storyboard nêu đủ P panel, mỗi panel có chú thích shot.
- [ ] Mỗi dòng video có các mốc thời gian TỔNG đúng 8s, đoạn cuối kết ở 8s.
- [ ] Panel trong video khớp panel trong storyboard cùng dòng.
- [ ] Mọi dòng có yếu tố điện ảnh (anamorphic / grain / color grade) + 16:9 + minimal ambient sound.
'@
Set-Content -Path 'unr3_storyboard/SKILL.md' -Value $storyboard -Encoding utf8

Write-Host "==> Khoi tao git + commit" -ForegroundColor Cyan
git init | Out-Null
git add .
git commit -m "Add unr3 skills: writing, scene, storyboard" | Out-Null
git branch -M main

$hasGh = Get-Command gh -ErrorAction SilentlyContinue
if ($hasGh) {
    Write-Host "==> Tao repo private '$repo' + push bang GitHub CLI" -ForegroundColor Cyan
    gh repo create $repo --private --source=. --remote=origin --push
    Write-Host "XONG. Repo private da len GitHub." -ForegroundColor Green
} else {
    Write-Host "Chua co GitHub CLI (gh)." -ForegroundColor Yellow
    Write-Host "1) Vao https://github.com/new tao repo PRIVATE ten: $repo (khong tick README)."
    Write-Host "2) Roi chay 2 lenh sau (thay <username>):" -ForegroundColor Yellow
    Write-Host "   git remote add origin git@github.com:<username>/$repo.git"
    Write-Host "   git push -u origin main"
}
