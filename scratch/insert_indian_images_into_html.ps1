$jsonText = [System.IO.File]::ReadAllText('scratch/indian_menu_data.json', [System.Text.Encoding]::UTF8)
$items = $jsonText | ConvertFrom-Json

$imageMap = @{
    "Tandoori Chicken" = "assets/menu_tandoori_chicken.webp"
    "Chicken Reshmi Kabab" = "assets/menu_chicken_reshmi_kabab.webp"
    "Chicken Tikka Kabab" = "assets/menu_chicken_tikka_kabab.webp"
    "Chicken Hariyali" = "assets/menu_chicken_hariyali.webp"
    "Tandoori Pomfret" = "assets/menu_tandoori_pomfret.webp"
    "Paneer Tikka (6 pcs)" = "assets/menu_paneer_tikka.webp"
    "Tandoori Roti [Butter]" = "assets/menu_tandoori_roti_butter.webp"
    "Tandoori Roti [Plain]" = "assets/menu_tandoori_roti_plain.webp"
    "Butter Naan" = "assets/menu_butter_naan.webp"
    "Plain Naan" = "assets/menu_plain_naan.webp"
    "Masala Kulcha" = "assets/menu_masala_kulcha.webp"
    "Paneer Kulcha" = "assets/menu_paneer_kulcha.webp"
    "Laccha Paratha" = "assets/menu_laccha_paratha.webp"
    "Garlic Naan" = "assets/menu_garlic_naan.webp"
    "Veg Pulao" = "assets/menu_veg_pulao.webp"
    "Jeera Rice" = "assets/menu_jeera_rice.webp"
    "Shahi Pulao" = "assets/menu_shahi_pulao.webp"
    "Peas Pulao" = "assets/menu_peas_pulao.webp"
    "Steamed Rice / Polao" = "assets/menu_steamed_rice_polao.webp"
    "Aloo Biryani" = "assets/menu_aloo_biryani.webp"
    "Egg Biryani" = "assets/menu_egg_biryani.webp"
    "Chicken Biryani" = "assets/menu_chicken_biryani.webp"
    "Mutton Biryani" = "assets/menu_mutton_biryani.webp"
    "Papad Fry [Roast]" = "assets/menu_papad_fry.webp"
    "Masala Papad (3 pcs)" = "assets/menu_masala_papad.webp"
    "Green Salad" = "assets/menu_green_salad.webp"
    "Onion Salad" = "assets/menu_onion_salad.webp"
    "Cucumber Salad" = "assets/menu_cucumber_salad.webp"
    "Paneer Butter Masala" = "assets/menu_paneer_butter_masala.webp"
    "Kadai Paneer" = "assets/menu_kadai_paneer.webp"
    "Shahi Paneer" = "assets/menu_shahi_paneer.webp"
    "Dal Makhani" = "assets/menu_dal_makhani.webp"
    "Yellow Dal" = "assets/menu_yellow_dal.webp"
    "Chicken Tikka Masala" = "assets/menu_chicken_tikka_masala.webp"
    "Chicken Butter Masala" = "assets/menu_chicken_butter_masala.webp"
    "Chicken Reshmi Butter Masala" = "assets/menu_chicken_reshmi_butter_masala.webp"
    "Kadai Chicken" = "assets/menu_kadai_chicken.webp"
    "Chana Masala" = "assets/menu_chana_masala.webp"
    "Chicken Bharta" = "assets/menu_chicken_bharta.webp"
    "Chicken Handi Tadka" = "assets/menu_chicken_handi_tadka.webp"
    "The Carnival Rice Combo" = "assets/menu_the_carnival_rice_combo.webp"
    "The Carnival Noodles Combo" = "assets/menu_the_carnival_noodles_combo.webp"
    "Carnival Special Rice" = "assets/menu_carnival_special_rice.webp"
    "Cold Drinks" = "assets/menu_cold_drinks.webp"
    "Strawberry Frost" = "assets/menu_strawberry_frost.webp"
    "Litchi High Ball" = "assets/menu_litchi_high_ball.webp"
    "Ice Tea" = "assets/menu_ice_tea.webp"
    "Lassi" = "assets/menu_lassi.webp"
    "Pineapple Blossom" = "assets/menu_pineapple_blossom.webp"
    "Orange Blossom" = "assets/menu_orange_blossom.webp"
}

$cardsBuilder = New-Object System.Text.StringBuilder

foreach ($item in $items) {
    $imgSrc = $imageMap[$item.title]
    if (-not $imgSrc) {
        Write-Warning "Missing image mapping for $($item.title)"
        $imgSrc = "assets/menu_tandoori_chicken.webp"
    }

    $encodedTitle = [System.Uri]::EscapeDataString("Hi The Carnival Restaurant, I want to order " + $item.title + " (" + $item.price + ")")
    
    [void]$cardsBuilder.AppendLine("")
    [void]$cardsBuilder.AppendLine("                        <!-- Indian Item: $($item.title) -->")
    [void]$cardsBuilder.AppendLine("                        <div class=`"food-menu-card`" data-cuisine=`"indian`" data-category=`"$($item.cat)`" data-keywords=`"$($item.kw)`">")
    [void]$cardsBuilder.AppendLine("                            <div class=`"food-card-badge $($item.badge)`">$($item.badgeText)</div>")
    [void]$cardsBuilder.AppendLine("                            <div class=`"food-card-img-box`">")
    [void]$cardsBuilder.AppendLine("                                <img src=`"$imgSrc`" alt=`"$($item.title)`" loading=`"lazy`">")
    [void]$cardsBuilder.AppendLine("                            </div>")
    [void]$cardsBuilder.AppendLine("                            <div class=`"food-card-body`">")
    [void]$cardsBuilder.AppendLine("                                <h3 class=`"food-title`">$($item.title)</h3>")
    [void]$cardsBuilder.AppendLine("                                <span class=`"bengali-title`">$($item.b)</span>")
    [void]$cardsBuilder.AppendLine("                                <span class=`"food-price`">$($item.price)</span>")
    [void]$cardsBuilder.AppendLine("                                <a href=`"https://wa.me/919732714412?text=$encodedTitle`" target=`"_blank`" class=`"food-order-btn`">")
    [void]$cardsBuilder.AppendLine("                                    <i class=`"fab fa-whatsapp`"></i> Order")
    [void]$cardsBuilder.AppendLine("                                </a>")
    [void]$cardsBuilder.AppendLine("                            </div>")
    [void]$cardsBuilder.AppendLine("                        </div>")
}

$newIndianCards = $cardsBuilder.ToString()

# Read index.html
$html = [System.IO.File]::ReadAllText('index.html', [System.Text.Encoding]::UTF8)

# Find first Indian Item in modal-full-menu-grid
$indianCommentTag = "<!-- Indian Item: Tandoori Chicken -->"
$indianStart = $html.IndexOf($indianCommentTag)
$noResultsTag = "<!-- No Results Fallback -->"
$gridEnd = $html.IndexOf($noResultsTag)

if ($indianStart -ge 0 -and $gridEnd -gt $indianStart) {
    # Find the closing </div> of modal-full-menu-grid before $noResultsTag
    $beforeIndian = $html.Substring(0, $indianStart)
    $afterGrid = $html.Substring($gridEnd)

    $updatedHtml = $beforeIndian + $newIndianCards + "`n                    </div>`n`n                    " + $afterGrid
    [System.IO.File]::WriteAllText('index.html', $updatedHtml, [System.Text.Encoding]::UTF8)
    Write-Host "SUCCESS: index.html updated with 50 cropped Indian Menu images!"
} else {
    Write-Error "Could not locate Indian items block in index.html ($indianStart, $gridEnd)"
}
