*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    ../AndroidBaseUICore.py
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CathyBankVariable.txt
Resource    ../Variable/URLVariable.txt


Suite Setup    Android Open Chrome Browser

Test Setup    Go To Url    ${HomePageURL}

Suite Teardown    Close Application


*** Test Cases ***
開啟國泰首頁並且截圖
    [Documentation]    使用Chrome App到國泰世華銀行官網(https://www.cathaybk.com.tw/cathaybk/)並將畫面截圖。 答案位置reports/cathay_case1.png
    ...    判斷國泰以下元素是否查詢的到 > 截圖
    [Tags]    P3
    Wait Until Element Is Visible    ${HomePage_text_Title}    10
    Wait Until Element Is Visible    ${HomePage_text_subTitle}    10
    Wait Until Element Is Visible    ${HomePage_text_createAccount}    20
    Wait Until Element Is Visible    ${HomePage_text_chooseCreditcard}    10
    Capture Page Screenshot    cathay_case1.png

計算信用卡列表項目
    [Documentation]    點選左上角選單，進入 個人金融 > 產品介紹 > 信用卡列表，需計算有幾個項目並將畫面截圖。 答案位置reports/cathay_case2.png
    ...    導向國泰首頁 > 點擊個人金融 > 產品介紹 > 信用卡 > 卡片介紹 > 計算符合元素數量並截圖
    [Tags]    P3
    Wait Until Element Is Visible    ${HomePage_text_createAccount}    10
    Click Element After It Is Visible    ${HomePage_button_selectButton}    20
    Click Element After It Is Visible    ${HomePageSelectList_select_productIntroduce}    20
    Click Element After It Is Visible    ${HomePageSelectList_select_creditcard}    20
    Wait Until Element Is Visible    xpath=(//*[@text="信用卡"])[2]    10
    Capture Page Screenshot    cathay_case2.png
    ${elements_count}    Wait For Element And Get Count    xpath=(//*[@text="信用卡"])[2]//following-sibling::*    10
    Log To Console    !!!!!!信用卡列表項目為${elements_count}!!!!!!!

計算頁面上所有停發信用卡數量
    [Documentation]    個人金融 > 產品介紹 > 信用卡 > 卡片介紹 > 計算頁面上所有(停發)信用卡數量並截圖 答案位置reports/card1.png~card11.png
    ...    導向國泰首頁 > 點擊個人金融 > 產品介紹 > 信用卡 > 卡片介紹 > 切換webview模式 > 計算卡片出現數量與截圖數量(在過程中切換不同的卡片並且截圖)
    [Tags]    P2
    Wait Until Element Is Visible    ${HomePage_text_createAccount}    10
    Click Element After It Is Visible    ${HomePage_button_selectButton}    20
    Click Element After It Is Visible    ${HomePageSelectList_select_productIntroduce}    20
    Click Element After It Is Visible    ${HomePageSelectList_select_creditcard}    20
    Wait Until Element Is Visible    xpath=(//*[@text="信用卡"])[2]    10
    Click Element After It Is Visible    ${HomePageSelectList_select_creditcardIntroduce}    10
    Switch To WebView And Get Source    WEBVIEW_chrome
    Scroll Element Into View    ${CardIntroductionPage_text_blockCardTitle}
    ${card_count}    Wait For Element And Get Count    ${CardIntroductionPage__button_cardSelectButton}    10
    Log To Console    !!!!停發信用卡數量為${card_count}!!!
    Capture Page Screenshot    card1.png    ##第一張卡
    FOR    ${counter}    IN RANGE    2    ${card_count}+1
        Click Pagination Bullet    xpath=(//*[contains(@class, 'cubre-a-iconTitle__text') and contains(text(), '停發卡')]/following::span[contains(@class, 'swiper-pagination-bullet') ])[${counter}]    10
        Sleep    1
        Capture Page Screenshot    card${counter}.png
    END
    ${block_card_list}    Get Webelements    ${CardIntroductionPage_image_cardNumber}
    ${block_block_card_number}    Get Length    ${block_card_list}
    Should Be Equal As Numbers    ${block_block_card_number}    ${card_count}    ##判斷截圖數量是否與卡片數量一致
