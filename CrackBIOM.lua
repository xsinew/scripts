return function(mainScript)
    local function editText(default, change)
        mainScript:gsub(default, change)
    end

    editText([[v7("\57\20\151\212\175", "\202Xn\226\166")]], [["cracked by xsinew"]])
    editText([[이 스크립트는 BIOM에 의해 작성되었습니다.]], [[이 스크립트는 BIOM에 의?#$+X)* --! 크시에 의해 수정되었습니다냥.]])
    editText([[키를 입력해주세요.]], [[키: cracked by xsinew]])
    editText([[BIOM Script Hub가 정상적으로 실행되었습니다.]], [[BIO#+3#^( --! Xsi Cracked Hub가 정상적으로 크랙되었다냥]])
    editText([[v7("\22\158f;\252\21E&\190Y\2\252\14S\54\247\127G\242v", "&T\215)v\220F")]], [[Xsi Cracked Hub v1.0?]])
    editText([[v7("\137\13?\27\51\150\216\153\13\32\2\51\141\206\137d&g=\245", "\155\203DpV\19\197")]], [[Xsi Cracked Hub]])
    editText([[v7("\179\205VM\13\225\150\13Y\23\168\218MO\26\245\222E\18&\172\253oh:\154\200`w", "~\219\185\34=")]], [[nil]])
    editText([[v7("\158\234\248\39B\3\137\225", "K\220\163\183jb")]], [["XsiCHub"]])
    editText([[-BIOM HUB]], [[-Xsi Cracked Hub]])

    return mainScript
end
