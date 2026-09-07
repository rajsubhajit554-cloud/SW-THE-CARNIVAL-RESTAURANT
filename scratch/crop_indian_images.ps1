$ErrorActionPreference = 'Continue'

$crops = @(
    # Sheet 1: Starter (6)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_tandoori_chicken.webp"; crop="470:360:25:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_chicken_reshmi_kabab.webp"; crop="470:360:533:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_chicken_tikka_kabab.webp"; crop="470:360:1041:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_chicken_hariyali.webp"; crop="470:360:25:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_tandoori_pomfret.webp"; crop="470:360:533:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_58_51 AM.png"; out="assets/menu_paneer_tikka.webp"; crop="470:360:1041:535" },

    # Sheet 2: Roti & Naan (8)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_tandoori_roti_butter.webp"; crop="350:360:20:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_tandoori_roti_plain.webp"; crop="350:360:405:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_butter_naan.webp"; crop="350:360:788:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_plain_naan.webp"; crop="350:360:1170:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_masala_kulcha.webp"; crop="350:360:20:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_paneer_kulcha.webp"; crop="350:360:405:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_laccha_paratha.webp"; crop="350:360:788:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_00 AM.png"; out="assets/menu_garlic_naan.webp"; crop="350:360:1170:535" },

    # Sheet 3: Rice & Pulao (5)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_31 AM.png"; out="assets/menu_veg_pulao.webp"; crop="320:420:30:210" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_31 AM.png"; out="assets/menu_jeera_rice.webp"; crop="320:420:380:210" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_31 AM.png"; out="assets/menu_shahi_pulao.webp"; crop="320:420:730:210" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_31 AM.png"; out="assets/menu_peas_pulao.webp"; crop="320:420:1080:210" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_31 AM.png"; out="assets/menu_steamed_rice_polao.webp"; crop="320:420:1430:210" },

    # Sheet 4: Biryani (4)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_37 AM.png"; out="assets/menu_aloo_biryani.webp"; crop="405:500:25:165" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_37 AM.png"; out="assets/menu_egg_biryani.webp"; crop="405:500:465:165" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_37 AM.png"; out="assets/menu_chicken_biryani.webp"; crop="405:500:905:165" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_37 AM.png"; out="assets/menu_mutton_biryani.webp"; crop="405:500:1345:165" },

    # Sheet 5: Side Order (5)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_44 AM.png"; out="assets/menu_papad_fry.webp"; crop="360:450:28:175" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_44 AM.png"; out="assets/menu_masala_papad.webp"; crop="360:450:420:175" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_44 AM.png"; out="assets/menu_green_salad.webp"; crop="360:450:812:175" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_44 AM.png"; out="assets/menu_onion_salad.webp"; crop="360:450:1204:175" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_44 AM.png"; out="assets/menu_cucumber_salad.webp"; crop="360:450:1596:175" },

    # Sheet 6: Main Course (12)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_paneer_butter_masala.webp"; crop="350:235:20:20" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_kadai_paneer.webp"; crop="350:235:405:20" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_shahi_paneer.webp"; crop="350:235:788:20" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_dal_makhani.webp"; crop="350:235:1170:20" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_yellow_dal.webp"; crop="350:235:20:360" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chicken_tikka_masala.webp"; crop="350:235:405:360" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chicken_butter_masala.webp"; crop="350:235:788:360" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chicken_reshmi_butter_masala.webp"; crop="350:235:1170:360" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_kadai_chicken.webp"; crop="350:235:20:700" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chana_masala.webp"; crop="350:235:405:700" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chicken_bharta.webp"; crop="350:235:788:700" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_51 AM.png"; out="assets/menu_chicken_handi_tadka.webp"; crop="350:235:1170:700" },

    # Sheet 7: Carnival Specials (3)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_57 AM.png"; out="assets/menu_the_carnival_rice_combo.webp"; crop="610:520:30:75" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_57 AM.png"; out="assets/menu_the_carnival_noodles_combo.webp"; crop="610:520:695:75" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 09_59_57 AM.png"; out="assets/menu_carnival_special_rice.webp"; crop="610:520:1365:75" },

    # Sheet 8: Soft Drinks & Mocktails (7)
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_cold_drinks.webp"; crop="470:360:25:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_strawberry_frost.webp"; crop="470:360:533:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_litchi_high_ball.webp"; crop="470:360:1041:25" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_ice_tea.webp"; crop="350:360:20:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_lassi.webp"; crop="350:360:405:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_pineapple_blossom.webp"; crop="350:360:788:535" },
    @{ src="assets/ChatGPT Image Sep 7, 2026, 10_02_03 AM.png"; out="assets/menu_orange_blossom.webp"; crop="350:360:1170:535" }
)

Write-Host "Starting crop of $($crops.Count) items..."

$success = 0
foreach ($c in $crops) {
    $src = $c.src
    $out = $c.out
    $crop = $c.crop

    $p = Start-Process -FilePath "ffmpeg" -ArgumentList "-y", "-i", "`"$src`"", "-vf", "crop=$crop", "-q:v", "85", "`"$out`"" -NoNewWindow -PassThru -Wait
    
    if (Test-Path $out) {
        $success++
    } else {
        Write-Warning "Failed to crop $out"
    }
}

Write-Host "Successfully cropped $success / $($crops.Count) Indian menu images!"
