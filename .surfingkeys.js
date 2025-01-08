// vi: ft=javascript

const {
	Clipboard,
	Front,
	Hints,
	RUNTIME,
	Visual,
	aceVimMap,
	addSearchAlias,
	cmap,
	getClickableElements,
	imap,
	imapkey,
	iunmap,
	map,
	mapkey,
	readText,
	removeSearchAlias,
	tabOpenLink,
	unmap,
	vmapkey,
	vunmap
} = api;

map(',f',  'C');   // Trigger by hint
map(',to', 'gxx'); // Close other tabs
map('H',   'E');   // Switch to the left  tab
map('L',   'R');   // Switch to the right tab
map('J',   'S');   // History backward
map('K',   'D');   // History forward
map('gt',  'T');   // Go to the next tab

// Ignore the current URL
unmap('<ctrl-i>');
map('<Ctrl-i>', '<Alt-s>');

// Replace ACE editor with neovim
iunmap('<Ctrl-i>');
imap('<Ctrl-i>', '<Ctrl-Alt-i>');

mapkey(',,,',  '打开 Surfingkeys 设置',         openSurfingkeysSettings);
mapkey(';ai',  '打开 ChatGPTBox',               openChatGPTBox);
mapkey(';ces', '修改扩展快捷键',                openChromeExtensionShortcuts);
mapkey(';hp',  '打开Hypothesis',                openHypothesis);
mapkey(';v',   '打开Neovim',                    openNeovim);
mapkey('ge',   '打开应用商店',                  openChromeExtensionStore);
mapkey('gm',   '打开Matter',                    openMatterQueue);
mapkey('of',   '打开Flomo',                     openFlomo);
mapkey('ok',   '打开Google Keep',               openGoogleKeep);
mapkey('op',   '打开Pocket',                    openPocket);
mapkey('or',   '打开ReadWise Reader',           openReadwiseReader);
mapkey('os',   '打开简悦稍后读',                openSimpReadHtml);
mapkey('yM',   'Yank page as markdown link.',   yankPageAsMarkdownLink)
mapkey('yO',   'Copy OmniFocus sensible info.', yankOmniFocusSensibleInfo);

mapkey('<Meta-k>', '点击新聊天按钮', function() {
    var button = document.querySelector('button[aria-label="新聊天"]');
    if (button) {
        button.click();
    } else {
        console.log("未找到新聊天按钮");
    }
}, { domain: /x\.com/ });

function openChatGPTBox() {
	tabOpenLink("chrome-extension://eobbhoofkanlmddnplfhnmkfbnlhpbbo/IndependentPanel.html");
}

function openChromeExtensionShortcuts() {
	tabOpenLink("chrome://extensions/shortcuts");
}

function openHypothesis() {
    api.insertJS(function(){
        window.hypothesisConfig=function(){return{showHighlights:true,appType:'bookmarklet'};};
        var d=document,s=d.createElement('script');s.setAttribute('src','https://hypothes.is/embed.js');d.body.appendChild(s)
    }, function(){
        api.Front.showBanner('Loaded hypothes.is!');
    });
}

function openSurfingkeysSettings() {
	tabOpenLink("/pages/options.html");
}

function openNeovim() {
	tabOpenLink("/pages/neovim.html");
}

function openChromeExtensionStore() {
	tabOpenLink("https://chrome.google.com/webstore/category/extensions?hl=zh-CN");
}

function openSimpReadHtml() {
	tabOpenLink("chrome-extension://ijllcpnolfcooahcekpamkbidhejabll/unreader/main.html");
}

function openPocket() {
	tabOpenLink("https://getpocket.com/my-list");
}

function openMatterQueue() {
	tabOpenLink("https://web.getmatter.com/list/queue");
}

function openReadwiseReader() {
	tabOpenLink("https://read.readwise.io/new");
}

function openGoogleKeep() {
	tabOpenLink("https://keep.google.com/u/0/");
}

function openFlomo() {
	tabOpenLink("https://v.flomoapp.com/mine");
}

function yankPageAsMarkdownLink() {
    var getMarkdownLink = ({ title = document.title, href = window.location.href } = {}) => `[${title}](${href})`
    Clipboard.write(getMarkdownLink())
}

function yankOmniFocusSensibleInfo() {
    var info_arr = [];
    
    info_arr.push("#omnifocus_sensible");
    info_arr.push(document.title);
    info_arr.push(window.location.href);
    
    Clipboard.write(info_arr.join("\n"));
}

removeSearchAlias('b')

addSearchAlias(
    'bd',
    '百度',
    'https://www.baidu.com/s?wd=',
    's',
)

addSearchAlias(
    'bb',
    'Bilibili',
    'https://search.bilibili.com/all?keyword=',
    's',
)

removeSearchAlias('d')

addSearchAlias(
    'jd',
    '京东',
    'http://search.jd.com/Search?enc=utf-8&keyword=',
    's',
)

addSearchAlias(
    'dbb',
    '豆瓣图书',
    'https://search.douban.com/book/subject_search?cat=1001&search_text=',
    's',
)

addSearchAlias(
    'dbm',
    '豆瓣电影',
    'https://search.douban.com/movie/subject_search?cat=1002&search_text=',
    's',
)

addSearchAlias(
    'tb',
    '淘宝',
    'https://s.taobao.com/search?q=',
    's',
    'https://suggest.taobao.com/sug?code=utf-8&q=',
    function (response) {
        var res = []
        try {
            res = JSON.parse(response.text).result.map(function (it) {
                return it[0]
            })
        } catch (e) {}
        return res
    },
)

removeSearchAlias('g')
addSearchAlias(
    'gg',
    'Google',
    'https://www.google.com/search?q=',
    's',
)
addSearchAlias(
    'gd',
    '高德地图',
    'https://ditu.amap.com/search?query=',
    's',
)

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;

settings.blocklistPattern = /.*inoreader\.com.*/i;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
