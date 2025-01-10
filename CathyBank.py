def scrore(scoreList):
    # 國泰補習班中，有五位學生期中考的成績分別為[53, 64, 75, 19, 92]，但是老師在輸入成績的時候看反了，把五位學生的成績改成了[35, 46, 57, 91, 29]，請用一個函數來將學生的成績修正。
    ## 十位數字除以十 各位數字乘以十
    correct_scoreList = []
    for each_score in scoreList:
        units_digit = each_score % 10
        tens_digit = each_score // 10
        new_score = units_digit * 10 + tens_digit
        correct_scoreList.append(new_score)
    return correct_scoreList

def celebrate(celebrate_string):
    # 國泰銀行要慶祝六十周年，需要買字母貼紙來布置活動空間，文字為"Hello welcome to Cathay 60th year anniversary"，請寫一個程式計算每個字母(大小寫視為同個字母)出現次數
    ## 邏輯是因題目說大小寫視為同個字母 先全部變成大寫 然後存成字典變成key是字 value是數量 然後再把它組成字串印出
    celebrate_string = celebrate_string.upper()
    caculate_string_dic = {}
    for char in celebrate_string:
        if char.isalnum():  # 判斷是不是數字或字母
            if char in caculate_string_dic:
                caculate_string_dic[char] += 1
            else:
                caculate_string_dic[char] = 1
    sorted_items = sorted(caculate_string_dic.items())
    formatted_items = [f"{key} {value}" for key, value in sorted_items]
    result = "\n".join(formatted_items)
    return result

def find_last_person(people_num):
    # QA部門今天舉辦團康活動，有n個人圍成一圈，順序排號。從第一個人開始報數（從1到3報數），凡報到3的人退出圈子。請利用一段程式計算出，最後留下的那位同事，是所有同事裡面的第幾順位?
    ## 邏輯是從基準點+2剔除那個人 然後用%len(list)的方式達到圍成一圈的效果
    if people_num >= 0 and people_num <=100:
        people = list(range(1, people_num + 1))
        index = 0
    else:
        return "請輸入(0-100)的數字"
        
    while len(people) > 1:
        index = (index + 2) % len(people)
        people.pop(index)
    return people[0]
