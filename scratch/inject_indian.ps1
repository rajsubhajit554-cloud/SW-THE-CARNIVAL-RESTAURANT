$jsonText = [System.IO.File]::ReadAllText('scratch/indian_menu_data.json', [System.Text.Encoding]::UTF8)
$items = $jsonText | ConvertFrom-Json

Write-Host "Read $($items.Count) Indian menu items."

$cardsBuilder = New-Object System.Text.StringBuilder

foreach ($item in $items) {
    $encodedTitle = [System.Uri]::EscapeDataString("Hi The Carnival Restaurant, I want to order " + $item.title + " (" + $item.price + ")")
    
    [void]$cardsBuilder.AppendLine("")
    [void]$cardsBuilder.AppendLine("                        <!-- Indian Item: $($item.title) -->")
    [void]$cardsBuilder.AppendLine("                        <div class=`"food-menu-card`" data-cuisine=`"indian`" data-category=`"$($item.cat)`" data-keywords=`"$($item.kw)`">")
    [void]$cardsBuilder.AppendLine("                            <div class=`"food-card-badge $($item.badge)`">$($item.badgeText)</div>")
    [void]$cardsBuilder.AppendLine("                            <div class=`"food-card-img-box placeholder-img-box`">")
    [void]$cardsBuilder.AppendLine("                                <div class=`"food-placeholder-icon`">")
    [void]$cardsBuilder.AppendLine("                                    <i class=`"fas $($item.icon)`"></i>")
    [void]$cardsBuilder.AppendLine("                                </div>")
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

$cardsHtml = $cardsBuilder.ToString()

# Read index.html
$html = [System.IO.File]::ReadAllText('index.html', [System.Text.Encoding]::UTF8)

# Tag Chinese cards in modal-full-menu-grid
$modalStart = $html.IndexOf('<div class="compact-grid" id="modal-full-menu-grid">')
$modalEnd = $html.IndexOf('<!-- No Results Fallback -->')

if ($modalStart -ge 0 -and $modalEnd -gt $modalStart) {
    $grid = $html.Substring($modalStart, $modalEnd - $modalStart)
    $gridUpdated = $grid -replace '<div class="food-menu-card" data-category=', '<div class="food-menu-card" data-cuisine="chinese" data-category='
    
    # Append Indian Cards before closing div of grid
    $lastDiv = $gridUpdated.LastIndexOf('</div>')
    $finalGrid = $gridUpdated.Substring(0, $lastDiv) + $cardsHtml + "`n                    </div>`n`n                    "
    
    $html = $html.Substring(0, $modalStart) + $finalGrid + $html.Substring($modalEnd)
}

# Update tabs
$oldTabsTarget = '<div class="menu-category-tabs" id="modal-menu-category-tabs">'
if ($html.Contains($oldTabsTarget)) {
    $newTabs = @"
<div class="menu-category-tabs" id="modal-chinese-category-tabs">
                        <button class="menu-tab-btn active" data-category="all">
                            <i class="fas fa-utensils"></i> All Items
                        </button>
                        <button class="menu-tab-btn" data-category="starter-veg">
                            <i class="fas fa-leaf"></i> Starter (Veg)
                        </button>
                        <button class="menu-tab-btn" data-category="starter-nonveg">
                            <i class="fas fa-drumstick-bite"></i> Starter (Non-Veg)
                        </button>
                        <button class="menu-tab-btn" data-category="soup">
                            <i class="fas fa-bowl-hot"></i> Soups
                        </button>
                        <button class="menu-tab-btn" data-category="rice">
                            <i class="fas fa-bowl-rice"></i> Fried Rice
                        </button>
                        <button class="menu-tab-btn" data-category="chowmin">
                            <i class="fas fa-utensils"></i> Chowmin & Noodles
                        </button>
                        <button class="menu-tab-btn" data-category="main-veg">
                            <i class="fas fa-carrot"></i> Main Course (Veg)
                        </button>
                        <button class="menu-tab-btn" data-category="main-nonveg">
                            <i class="fas fa-fire-burner"></i> Main Course (Non-Veg)
                        </button>
                        <button class="menu-tab-btn" data-category="desserts">
                            <i class="fas fa-ice-cream"></i> Desserts
                        </button>
                    </div>

                    <div class="menu-category-tabs" id="modal-indian-category-tabs" style="display: none;">
                        <button class="menu-tab-btn active" data-category="all">
                            <i class="fas fa-utensils"></i> All Items
                        </button>
                        <button class="menu-tab-btn" data-category="indian-starter">
                            <i class="fas fa-drumstick-bite"></i> Starter (Tandoor)
                        </button>
                        <button class="menu-tab-btn" data-category="indian-roti">
                            <i class="fas fa-bread-slice"></i> Roti & Naan
                        </button>
                        <button class="menu-tab-btn" data-category="indian-rice">
                            <i class="fas fa-bowl-rice"></i> Rice & Pulao
                        </button>
                        <button class="menu-tab-btn" data-category="indian-biryani">
                            <i class="fas fa-fire"></i> Biryani
                        </button>
                        <button class="menu-tab-btn" data-category="indian-side">
                            <i class="fas fa-carrot"></i> Side Order
                        </button>
                        <button class="menu-tab-btn" data-category="indian-main">
                            <i class="fas fa-fire-burner"></i> Main Course
                        </button>
                        <button class="menu-tab-btn" data-category="indian-combos">
                            <i class="fas fa-star"></i> Carnival Specials
                        </button>
                        <button class="menu-tab-btn" data-category="indian-drinks">
                            <i class="fas fa-cocktail"></i> Drinks & Mocktails
                        </button>
                    </div>
"@
    $html = $html.Replace($oldTabsTarget, $newTabs)
}

[System.IO.File]::WriteAllText('index.html', $html, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: index.html updated with Indian menu!"
