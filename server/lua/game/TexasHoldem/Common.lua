-- region *.lua
-- Date 2017-03-07
-- ���ļ���[BabeLua]����Զ�����


Common = { }


function Common:printCardSet(text, cards, desc)
    local len = table.getn(cards)
    local str = ""

    if text ~= nil then
        str = str .. text
    end
    str = str .. " ===> size=" .. len

    local strCardSuit = ""
    local strCardId = ""


    for i = 1, len, 1 do
        if (1 == i) then
            strCardSuit = " ["
            strCardId = " ["
        end

        strCardSuit = strCardSuit .. cards[i].cardSuit
        strCardId = strCardId .. cards[i].cardId

        if (i ~= len) then
            strCardSuit = strCardSuit .. ","
            strCardId = strCardId .. ","
        else
            strCardSuit = strCardSuit .. "] "
            strCardId = strCardId .. "] "
        end
    end
    str = str .. strCardSuit .. strCardId
    if desc ~= nil then
        str = str .. desc
    end
    print(str)
end


-- �ʼ�ͬ��˳(royal flush)����AKQJ10������ɣ�������5���ƻ�ɫ��ͬ ����
-- ͬ��˳(straight flush)������������ͬ��ɫ������� ����
-- 4��(four of a kind)��4��ͬ��ֵ���Ƽ���һ�������κ��� ����
-- ���ú�(full house)���ֳơ���«������3��ͬ��ֵ��������һ�� ����
-- ͬ��(flush)��5���ƻ�ɫ��ͬ�����ǲ���˳�� ����
-- ˳��(straight)�����������ţ�����һ�Ż�ɫ��ͬ ����
-- 3��(three of a kind)�������Ƶ�ֵ��ͬ���������Ÿ��� ����
-- ����(two pairs)�����Լ���һ������ ����
-- һ��(one pair)��һ�Լ���3������ ����
-- ����(high card)�������������κ�һ�����͵����ͣ��ɵ����Ҳ�������ͬ�������
function Common:getCardDesc(typeId)
    if 1 == typeId then
        return "����(high card)�������������κ�һ�����͵����ͣ��ɵ����Ҳ�������ͬ�������"
    elseif 2 == typeId then
        return "һ��(one pair)��һ�Լ���3������"
    elseif 3 == typeId then
        return "����(two pairs)�����Լ���һ������"
    elseif 4 == typeId then
        return "3��(three of a kind)�������Ƶ�ֵ��ͬ���������Ÿ���"
    elseif 5 == typeId then
        return "˳��(straight)�����������ţ�����һ�Ż�ɫ��ͬ"
    elseif 6 == typeId then
        return "ͬ��(flush)��5���ƻ�ɫ��ͬ�����ǲ���˳��"
    elseif 7 == typeId then
        return "���ú�(full house)���ֳơ���«������3��ͬ��ֵ��������һ��"
    elseif 8 == typeId then
        return "4��(four of a kind)��4��ͬ��ֵ���Ƽ���һ�������κ���"
    elseif 9 == typeId then
        return "ͬ��˳(straight flush)������������ͬ��ɫ������� "
    elseif 10 == typeId then
        return "�ʼ�ͬ��˳(royal flush)����AKQJ10������ɣ�������5���ƻ�ɫ��ͬ"
    end
end

-- LessTen = "ʮС",	-- 10С
-- Bomb = "ը��" ,   -- ը��
-- FiveJinhua = "�廨", -- ���
-- FourJinhua = "�Ļ�", -- ����
-- Ten_Niu = "ţ10",
-- Nine_Niu = "ţ9",
-- Eight_Niu = "ţ8",
-- Seven_Niu = "ţ7",
-- Six_Niu = "ţ6",
-- Five_Niu = "ţ5",
-- Four_Niu = "ţ4",
-- Three_Niu = "ţ3",
-- Tow_Niu = "ţ2",
-- One_Niu = "ţ1",
-- NoNiu = "��ţ",		-- ûţ
function Common:getCardDescNiuNiu(typeId)
    if 0 == typeId then
        return "��ţ"
    elseif 1 == typeId then
        return "ţ1"
    elseif 2 == typeId then
        return "ţ2"
    elseif 3 == typeId then
        return "ţ3"
    elseif 4 == typeId then
        return "ţ4"
    elseif 5 == typeId then
        return "ţ5"
    elseif 6 == typeId then
        return "ţ6"
    elseif 7 == typeId then
        return "ţ7"
    elseif 8 == typeId then
        return "ţ8"
    elseif 9 == typeId then
        return "ţ9"
    elseif 10 == typeId then
        return "ţ10"
    elseif 11 == typeId then
        return "�Ļ�"
    elseif 12 == typeId then
        return "�廨"
    elseif 13 == typeId then
        return "ը��"
    elseif 14 == typeId then
        return "��С"
    end
end

-- ����
math.randomseed(tostring(os.time()):reverse():sub(1, 7))
function Common:get(_cards)
    -- math.randomseed(os.time())
    -- math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local index = math.random(1, table.getn(_cards))
    local card = _cards[index]
    -- print("ȡ��: " .. index, card.suit, card.id)
    table.remove(_cards, index)
    return card
end



-- �����С����ͬ��˳����������«��ͬ����˳�ӣ����������ԣ�һ�ԣ�����
CardLevel = {
    -- ����
    level1 = 1,
    -- һ��
    level2 = 2,
    -- ����
    level3 = 3,
    -- ����
    level4 = 4,
    -- ˳��
    level5 = 5,
    -- ͬ��
    level6 = 6,
    -- ��«
    level7 = 7,
    -- ����
    level8 = 8,
    -- ͬ��˳
    level9 = 9
}


local CardType = {
    levle = CardLevel.level1,
    param1 = - 1,
    param1 = - 1,
    param1 = - 1,
}

function Common:getType(_cardSet)
    local level = -1
    local len = table.getn(_cardSet)
    if (len <= 1) then
        return level
    end

    local res = {
        -- ����
        isLevel2 = false,

        -- ����
        isLevel3 = false,

        -- ˳��
        isLevel5 = true,
        -- ͬ��
        isLevel6 = true,

        -- ����
        isLevel8 = false
    }

    local sameCardid = -1
    local sameCardNum = 0

    for i = 2, len, 1 do
        local card1 = _cardSet[i]
        local card2 = _cardSet[i - 1]

        if card1.id == card2.id then
            sameCardNum = sameCardNum + 1
            if not res.isLevel2 then
                res.isLevel2 = true
                sameCardid = card2.id
                print("����")
            elseif 3 == sameCardNum then
                res.isLevel3 = true
                print("����")
            elseif 4 == sameCardNum then
                res.isLevel8 = true
                print("����")
            end
        else

        end

        if res.isLevel6 then
            if _cardSet[i].color ~= _cardSet[i - 1].color then
                -- ����ͬ��
                res.isLevel6 = false
            end
        end

        if res.isLevel5 then
            if _cardSet[i].id - _cardSet[i - 1].id ~= 1 then
                -- ����˳��
                res.isLevel5 = false
            end
        elseif _cardSet[i].id == _cardSet[i - 1].id then

        end
    end

end


function Common:getBestCards(_playerCards, _publicCards)
    local len1 = table.getn(_playerCards)
    local len2 = table.getn(_publicCards)

    if (len1 < 2 or len2 > 5) then
        return nil
    end

    local bestCards = { }
    if (len2 <= 3) then
        table.insert(bestCards, _playerCards[1])
        table.insert(bestCards, _playerCards[2])

        for i = 1, len2, 1 do
            table.insert(bestCards, _publicCards[i])
        end
    else
    end

    return bestCards
end

-- ȡ�ƵĻ�ɫ�ʹ�С
function Common:getColorAndid(_cardId)
    local color, val = math.modf(413 / 100);
    return color, val * 100
end

-- ȡ�ƵĻ�ɫ
function Common:getColor(_cardId)
    local color, val = math.modf(413 / 100);
    return color
end

-- ȡ�ƵĴ�С
function Common:getid(_cardId)
    local val = 413 % 100;
    return val
end


-- endregion
