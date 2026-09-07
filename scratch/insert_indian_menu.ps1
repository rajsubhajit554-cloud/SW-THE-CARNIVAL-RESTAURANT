$ErrorActionPreference = 'Stop'

$indianDishes = @(
    # 1. Starter (Non-Veg & Tandoor)
    @{ cat="indian-starter"; title="Tandoori Chicken"; b="তন্দুরি চিকেন"; price="Full ₹420 / Half ₹220"; badge="chef"; badgeText="Chef Special"; icon="fa-drumstick-bite"; kw="tandoori chicken tandoor starter non veg indian" },
    @{ cat="indian-starter"; title="Chicken Reshmi Kabab"; b="চিকেন রেশমি কাবাব"; price="₹200"; badge="popular"; badgeText="Popular"; icon="fa-drumstick-bite"; kw="chicken reshmi kabab kebab starter non veg indian" },
    @{ cat="indian-starter"; title="Chicken Tikka Kabab"; b="চিকেন টিক্কা কাবাব"; price="₹200"; badge="bestseller"; badgeText="Bestseller"; icon="fa-drumstick-bite"; kw="chicken tikka kabab kebab starter non veg indian" },
    @{ cat="indian-starter"; title="Chicken Hariyali"; b="চিকেন হরিয়ালি"; price="₹200"; badge="special"; badgeText="Special"; icon="fa-drumstick-bite"; kw="chicken hariyali kabab starter non veg indian" },
    @{ cat="indian-starter"; title="Tandoori Pomfret"; b="তন্দুরি পমফ্রেট"; price="₹220"; badge="chef"; badgeText="Special Fish"; icon="fa-fish"; kw="tandoori pomfret fish starter non veg indian" },
    @{ cat="indian-starter"; title="Paneer Tikka (6 pcs)"; b="পনির টিক্কা (৬ পিস)"; price="₹180"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-cheese"; kw="paneer tikka starter veg indian pure veg" },

    # 2. Roti & Naan
    @{ cat="indian-roti"; title="Tandoori Roti [Butter]"; b="তন্দুরি বাটার রুটি"; price="₹30"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="tandoori roti butter bread indian roti naan" },
    @{ cat="indian-roti"; title="Tandoori Roti [Plain]"; b="তন্দুরি প্লেন রুটি"; price="₹35"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="tandoori roti plain bread indian roti naan" },
    @{ cat="indian-roti"; title="Butter Naan"; b="বাটার নান"; price="₹40"; badge="pure-veg"; badgeText="Popular"; icon="fa-bread-slice"; kw="butter naan bread indian roti naan" },
    @{ cat="indian-roti"; title="Plain Naan"; b="প্লেন নান"; price="₹35"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="plain naan bread indian roti naan" },
    @{ cat="indian-roti"; title="Masala Kulcha"; b="মশলা কুলচা"; price="₹60"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="masala kulcha bread indian roti naan" },
    @{ cat="indian-roti"; title="Paneer Kulcha"; b="পনির কুলচা"; price="₹70"; badge="pure-veg"; badgeText="Special"; icon="fa-cheese"; kw="paneer kulcha bread indian roti naan" },
    @{ cat="indian-roti"; title="Laccha Paratha"; b="লাচ্ছা পরোটা"; price="₹60"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="laccha paratha paratha indian roti naan" },
    @{ cat="indian-roti"; title="Garlic Naan"; b="গার্লিক নান"; price="₹50"; badge="pure-veg"; badgeText="Veg"; icon="fa-bread-slice"; kw="garlic naan bread indian roti naan" },

    # 3. Rice & Pulao
    @{ cat="indian-rice"; title="Veg Pulao"; b="ভেজ পোলাও"; price="₹140"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="veg pulao polao rice indian" },
    @{ cat="indian-rice"; title="Jeera Rice"; b="জিরা রাইস"; price="₹110"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="jeera rice cumin rice indian" },
    @{ cat="indian-rice"; title="Shahi Pulao"; b="শাহি পোলাও"; price="₹150"; badge="pure-veg"; badgeText="Special"; icon="fa-bowl-rice"; kw="shahi pulao polao royal rice indian" },
    @{ cat="indian-rice"; title="Peas Pulao"; b="মটর পোলাও"; price="₹170"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="peas pulao matar polao rice indian" },
    @{ cat="indian-rice"; title="Steamed Rice / Polao"; b="স্টিমড রাইস / পোলাও"; price="₹80"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="steamed rice plain rice polao indian" },

    # 4. Biryani
    @{ cat="indian-biryani"; title="Aloo Biryani"; b="আলু বিরিয়ানি"; price="₹100"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-fire"; kw="aloo biryani potato biryani veg indian" },
    @{ cat="indian-biryani"; title="Egg Biryani"; b="এগ বিরিয়ানি"; price="₹110"; badge="popular"; badgeText="Popular"; icon="fa-egg"; kw="egg biryani dim biryani indian" },
    @{ cat="indian-biryani"; title="Chicken Biryani"; b="চিকেন বিরিয়ানি"; price="₹150"; badge="bestseller"; badgeText="Bestseller"; icon="fa-drumstick-bite"; kw="chicken biryani biriyani bestseller indian" },
    @{ cat="indian-biryani"; title="Mutton Biryani"; b="মাটন বিরিয়ানি"; price="₹200"; badge="chef"; badgeText="Chef Special"; icon="fa-fire"; kw="mutton biryani biriyani special indian" },

    # 5. Side Order
    @{ cat="indian-side"; title="Papad Fry [Roast]"; b="পাঁপড় ফ্রাই [রোস্ট]"; price="₹30"; badge="pure-veg"; badgeText="Veg"; icon="fa-cookie"; kw="papad fry roast papad side order indian" },
    @{ cat="indian-side"; title="Masala Papad (3 pcs)"; b="মশলা পাঁপড় (৩ পিস)"; price="₹70"; badge="pure-veg"; badgeText="Veg"; icon="fa-cookie"; kw="masala papad side order indian" },
    @{ cat="indian-side"; title="Green Salad"; b="গ্রিন সালাড"; price="₹70"; badge="pure-veg"; badgeText="Fresh"; icon="fa-carrot"; kw="green salad fresh salad side order" },
    @{ cat="indian-side"; title="Onion Salad"; b="অনিয়ন সালাড"; price="₹70"; badge="pure-veg"; badgeText="Fresh"; icon="fa-carrot"; kw="onion salad pyaj salad side order" },
    @{ cat="indian-side"; title="Cucumber Salad"; b="কিউকাম্বার সালাড"; price="₹70"; badge="pure-veg"; badgeText="Fresh"; icon="fa-carrot"; kw="cucumber salad shosa salad side order" },

    # 6. Main Course (Veg & Non-Veg)
    @{ cat="indian-main"; title="Paneer Butter Masala"; b="পনির বাটার মশলা"; price="₹200"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-cheese"; kw="paneer butter masala main course veg indian" },
    @{ cat="indian-main"; title="Kadai Paneer"; b="কড়াই পনির"; price="₹200"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-cheese"; kw="kadai paneer main course veg indian" },
    @{ cat="indian-main"; title="Shahi Paneer"; b="শাহি পনির"; price="₹200"; badge="pure-veg"; badgeText="Special"; icon="fa-cheese"; kw="shahi paneer main course veg indian" },
    @{ cat="indian-main"; title="Dal Makhani"; b="ডাল মাখানি"; price="₹170"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="dal makhani daal main course veg indian" },
    @{ cat="indian-main"; title="Yellow Dal"; b="ইয়েলো ডাল"; price="₹160"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="yellow dal daal fry tadka veg indian" },
    @{ cat="indian-main"; title="Chicken Tikka Masala"; b="চিকেন টিক্কা মশলা"; price="₹200"; badge="bestseller"; badgeText="Bestseller"; icon="fa-drumstick-bite"; kw="chicken tikka masala gravy main course non veg indian" },
    @{ cat="indian-main"; title="Chicken Butter Masala"; b="চিকেন বাটার মশলা"; price="₹200"; badge="popular"; badgeText="Popular"; icon="fa-drumstick-bite"; kw="chicken butter masala murgh butter main course non veg indian" },
    @{ cat="indian-main"; title="Chicken Reshmi Butter Masala"; b="চিকেন রেশমি বাটার মশলা"; price="₹220"; badge="chef"; badgeText="Chef Special"; icon="fa-drumstick-bite"; kw="chicken reshmi butter masala main course non veg indian" },
    @{ cat="indian-main"; title="Kadai Chicken"; b="কড়াই চিকেন"; price="₹230"; badge="special"; badgeText="Special"; icon="fa-drumstick-bite"; kw="kadai chicken spicy main course non veg indian" },
    @{ cat="indian-main"; title="Chana Masala"; b="চানা মশলা"; price="₹100"; badge="pure-veg"; badgeText="Pure Veg"; icon="fa-bowl-rice"; kw="chana masala chole veg indian" },
    @{ cat="indian-main"; title="Chicken Bharta"; b="চিকেন ভর্তা"; price="₹180"; badge="bestseller"; badgeText="Bestseller"; icon="fa-drumstick-bite"; kw="chicken bharta popular main course non veg indian" },
    @{ cat="indian-main"; title="Chicken Handi Tadka"; b="চিকেন হাঁড়ি তড়কা"; price="₹240"; badge="chef"; badgeText="Chef Special"; icon="fa-drumstick-bite"; kw="chicken handi tadka royal main course non veg indian" },

    # 7. Carnival Specials (Combos)
    @{ cat="indian-combos"; title="The Carnival Rice Combo"; b="কার্নিভাল রাইস কম্বো (Rice + French Fry + Chilli Chicken 2pcs)"; price="₹119"; badge="bestseller"; badgeText="Combo ₹119"; icon="fa-star"; kw="the carnival rice combo french fry chilli chicken carnival specials" },
    @{ cat="indian-combos"; title="The Carnival Noodles Combo"; b="কার্নিভাল নুডলস কম্বো (Noodles + Chicken + French Fry + Cold Drinks)"; price="₹119"; badge="bestseller"; badgeText="Combo ₹119"; icon="fa-star"; kw="the carnival noodles combo chicken french fry cold drinks carnival specials" },
    @{ cat="indian-combos"; title="Carnival Special Rice"; b="কার্নিভাল স্পেশাল রাইস"; price="₹230"; badge="chef"; badgeText="Chef Special"; icon="fa-star"; kw="carnival special rice signature dish" },

    # 8. Soft Drinks & Mocktails
    @{ cat="indian-drinks"; title="Cold Drinks"; b="কোল্ড ড্রিংকস"; price="MRP"; badge="popular"; badgeText="Chilled"; icon="fa-glass-water"; kw="cold drinks soft drinks beverage" },
    @{ cat="indian-drinks"; title="Strawberry Frost"; b="স্ট্রবেরি ফ্রস্ট"; price="₹120"; badge="special"; badgeText="Mocktail"; icon="fa-cocktail"; kw="strawberry frost mocktail drink beverage" },
    @{ cat="indian-drinks"; title="Litchi High Ball"; b="লিচু হাই বল"; price="₹120"; badge="special"; badgeText="Mocktail"; icon="fa-cocktail"; kw="litchi high ball mocktail drink beverage" },
    @{ cat="indian-drinks"; title="Ice Tea"; b="আইস টি"; price="₹120"; badge="special"; badgeText="Mocktail"; icon="fa-glass-martini-alt"; kw="ice tea lemon tea mocktail drink beverage" },
    @{ cat="indian-drinks"; title="Lassi"; b="লাচ্ছি"; price="₹100"; badge="popular"; badgeText="Refreshing"; icon="fa-glass-water"; kw="lassi sweet lassi beverage drink" },
    @{ cat="indian-drinks"; title="Pineapple Blossom"; b="পাইনঅ্যাপেল ব্লসম"; price="₹140"; badge="special"; badgeText="Mocktail"; icon="fa-cocktail"; kw="pineapple blossom mocktail drink beverage" },
    @{ cat="indian-drinks"; title="Orange Blossom"; b="অরেঞ্জ ব্লসম"; price="₹140"; badge="special"; badgeText="Mocktail"; icon="fa-cocktail"; kw="orange blossom mocktail drink beverage" }
)

Write-Host "Total Indian Dishes to inject: $($indianDishes.Count)"

$cardsHtml = ""
foreach ($item in $indianDishes) {
    $encodedTitle = [System.Web.HttpUtility]::UrlEncode("Hi The Carnival Restaurant, I want to order " + $item.title + " (" + $item.price + ")")
    $cardsHtml += @"

                        <!-- Indian Item: $($item.title) -->
                        <div class="food-menu-card" data-cuisine="indian" data-category="$($item.cat)" data-keywords="$($item.kw)">
                            <div class="food-card-badge $($item.badge)">$($item.badgeText)</div>
                            <div class="food-card-img-box placeholder-img-box">
                                <div class="food-placeholder-icon">
                                    <i class="fas $($item.icon)"></i>
                                </div>
                            </div>
                            <div class="food-card-body">
                                <h3 class="food-title">$($item.title)</h3>
                                <span class="bengali-title">$($item.b)</span>
                                <span class="food-price">$($item.price)</span>
                                <a href="https://wa.me/919732714412?text=$encodedTitle" target="_blank" class="food-order-btn">
                                    <i class="fab fa-whatsapp"></i> Order
                                </a>
                            </div>
                        </div>
"@
}

# Read index.html
$filePath = "d:\Dripza Water Business\all Clint\THE CARNIVAL RESTAURANT\websites\SW  THE CARNIVAL RESTAURANT\index.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Update Chinese category tabs wrapper with ID and add Indian category tabs wrapper
$oldTabsPattern = '(?s)<div class="menu-category-tabs" id="modal-menu-category-tabs">.*?</div>\s*</div>\s*</div>\s*<div class="full-menu-modal-body">'

$newTabsHtml = @"
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
                </div>
            </div>

            <div class="full-menu-modal-body">
"@

$content = [regex]::Replace($content, $oldTabsPattern, $newTabsHtml)

# 2. Tag all Chinese cards in modal-full-menu-grid with data-cuisine="chinese"
# We can find all modal food cards inside modal-full-menu-grid and ensure data-cuisine="chinese" is present
$modalGridStart = $content.IndexOf('<div class="compact-grid" id="modal-full-menu-grid">')
$modalGridEnd = $content.IndexOf('<!-- No Results Fallback -->')

if ($modalGridStart -ge 0 -and $modalGridEnd -gt $modalGridStart) {
    $gridContent = $content.Substring($modalGridStart, $modalGridEnd - $modalGridStart)
    
    # Add data-cuisine="chinese" if not already present
    $updatedGrid = $gridContent -replace '<div class="food-menu-card" data-category=', '<div class="food-menu-card" data-cuisine="chinese" data-category='
    
    # Append Indian Cards before the end of the grid (before the closing </div> of modal-full-menu-grid)
    $lastDiv = $updatedGrid.LastIndexOf('</div>')
    $finalGrid = $updatedGrid.Substring(0, $lastDiv) + $cardsHtml + "`n                    </div>"
    
    $content = $content.Substring(0, $modalGridStart) + $finalGrid + $content.Substring($modalGridEnd)
    [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Successfully updated index.html with Chinese tags and 50 Indian Menu items!"
} else {
    Write-Error "Could not locate modal-full-menu-grid boundaries."
}
