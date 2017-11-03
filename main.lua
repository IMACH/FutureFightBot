-- ========== Main Program =========

-- all process start from the main home screen 

-- Timeline Battle Mission --> Arena --> Timeline --> Get Ready --> If Close --> Search for Opponent --> Fight --> Repeat Button 
--FINISHED

function timelineBattle (times)
    isRunning = false

    waitClick("enter.png")
    waitClick("arena.png")
    waitClick("timeline.png")
    if exists("close.png") then
        click("close.png")
    end
    waitClick("get_ready.png")
    wait(3)
    if exists("close.png") then
        click("close.png")
    end
    wait(2)
    if exists("recommended.png") then
        click("close.png")
    end

    click("search_for.png")

    -- notice you cannot hold more than 60000 honor tokens
    if exists("notice.png") then
        click("okgreen.png")
    end
    -- loop here 
    for i=times,1,-1
    do
        wait(3)
        waitClick("timeline_fight.png",30)

        isRunning = true

        while (isRunning) do
            if exists("shield_safe.png") then
                wait(2)
                click("ok.png")
            end

            if exists("repeat.png") then
                isRunning = false
            end
        end

        waitClick("repeat.png", 200)
        wait(3)
    end
    wait(3)
    waitClick("leave.png")
    -- this ends up at the home screen

    print("Ran timeline Battle" .. times .. 'Times!')
end

function chooseChapter (chapterNumber)
    repeat 
        waitClick("rightarrow.png")
    until exists("chapter" .. chapterNumber .. ".png")
end 

function chooseStage (chapterNumber, stageNumber)
    ch1_offset = 115 
    ch2_offset = 116
    ch3_offset = 115 
    ch4_offset = 115 
    ch5_offset = 115 
    ch6_offset = 115 
    ch7_offset = 115 
    ch8_offset = 115 
    ch9_offset = 115 
    ch10_offset = 115 
    ch11_offset = 115 
    ch12_offset = 115 

    -- this will be the offset value used for all logic 
    offset = 0 
    if chapterNumber == 1 then 
        offset = ch1_offset
    elseif chapterNumber == 2 then
        offset = ch2_offset
    elseif chapterNumber == 2 then
        offset = ch2_offset
    elseif chapterNumber == 3 then
        offset = ch3_offset
    elseif chapterNumber == 4 then
        offset = ch4_offset
    elseif chapterNumber == 5 then
        offset = ch5_offset
    elseif chapterNumber == 6 then
        offset = ch6_offset
    elseif chapterNumber == 7 then
        offset = ch7_offset
    elseif chapterNumber == 8 then
        offset = ch8_offset
    elseif chapterNumber == 9 then
        offset = ch9_offset
    elseif chapterNumber == 10 then
        offset = ch10_offset
    elseif chapterNumber == 11 then
        offset = ch11_offset
    elseif chapterNumber == 12 then
        offset = ch12_offset
    end 
    chapter_pattern = Pattern("ch" .. chapterNumber .. "_offset.png")
    stage_offset = click(chapter_pattern:targetOffset(offset*(stageNumber - 1),0)) --if stage 2 is choosen by user click based on offset value

end 

function runStoryMissions(chapter, stage, times)

    isRunning = false

    waitClick("enter.png")
    waitClick("story.png")
    chooseChapter(chapter)
    chooseStage(chapter,stage)
    
    for i = times,1, -1
    do
        waitClick("start.png") 
        isRunning = true 
        while (isRunning) do
            if exists("repeat.png") then
                isRunning = false
            end
        end
        
        if exists("herorankup.png") then
            waitClick("cancel.png")
        end

        waitClick("repeat.png")
        wait(3)

        if exists("shield_safe.png") then
                click("ok.png")
        end
        wait(3)

    end 

    wait(3)
    waitClick("home.png")

    print("Ran Normal Missions: " .. times .. " times!")

end 

function getCoordinates(pattern)
    if exists(pattern) then
        local m = getLastMatch()

        x1 = m:getX()
        y1 = m:getY()

        print("x:" .. x1 .. "y:" .. y1)
    end 
end 

function runDailyMission()
    waitClick("enter.png")
    waitClick("daily.png")

end

--FINISHED WORKS GOOD!
function runSpecialMission(times, hiddenTicket)
    isRunning = false

    waitClick("enter.png")
    waitClick("special.png")
    waitClick("sandman.png")
    wait(1)
    waitClick("enter_level.png")

    for i = times,1, -1
    do
        wait(4)
        waitClick("start.png")
        wait(3)

        if exists("notice.png") then
            if hiddenTicket == true then

            end -- if want hidden ticket click ok else click cancel
            click("ok.png")
        end
        isRunning= true

        while (isRunning) do
            if exists("shield_safe.png") then
                click("ok.png")
            end

            if exists("repeat.png") then
                isRunning = false
            end
        end

        wait(3)
        click("repeat.png")

        wait(3)
        if exists("shield_safe.png", 10) then
            click("ok.png")
        end
    end

    wait(4)
    waitClick("ok.png")
    wait(2)
    waitClick("leave.png")

    print("Ran Special Missions: " .. times .. " times!")
end

function runDarkDimension(times)
    isRunning = false
    waitClick("enter.png")
    waitClick("epic_quest.png")
    waitClick("sorcerer.png")
    waitClick("dark_dimension.png")
    waitClick("increasing_darkness.png")

    for i=times,1,-1
    do
        wait(2)
        waitClick("start.png")
        isRunning = true

        while (isRunning) do

            if exists("repeat.png") then
                isRunning = false
            end
        end

        wait(3)
        waitClick("repeat.png")
    end

    wait(3)

    if exists("shield_safe.png") then
        click("ok.png")
    end

    if exists("hero_rank_up.png") then
        click("cancel.png")
    end

    if exists("tap_to_continue.png") then
        click("tap_to_continue.png")
    end

    wait(3)
    waitClick("leave.png")

    print("Ran Dark Dimension: " .. times .. " times!")
end

function runMemoryMission(times)
    waitClick("enter.png")
    waitClick("epic_quest.png")
    waitClick("sorcerer.png")
    waitClick("memory.png")

    --TODO: change next line for who to farm
    waitClick("monastery.png")
    wait(1)
    swipe("lv4.png", "lv1.png")
    wait(2)

    enter = findAll("enter_level.png")

    for i, m in ipairs(enter) do
        m:highlight(1)
        x = m:getX()
        y = m:getY()

        print("X: " .. x .. "and" .. "Y: " .. y)
    end

    click(enter[3])

    for i=times,1,-1
    do
        wait(2)
        waitClick("start.png",150)

        wait("repeat.png", 150)
        wait(2)

        if exists("hero_rank_up.png") then
            click("cancel.png")
        end

        if exists("tap_to_continue.png") then
            click("tap_to_continue.png")
        end
        waitClick("repeat.png")
    end
end

function findAllImp(pattern)
    enter = findAll("enter_level.png")

    for i, m in ipairs(enter) do
        m:highlight(1)
        x = m:getX()
        y = m:getY()

        print("X: " .. x .. "and" .. "Y: " .. y)
    end

    click(enter[3])

    -- print (table.getn(enter)) -- print the number of matches
end

-- runDarkDimension(2)
--timelineBattle(9)
--chooseChapter(12)
--chooseStage(1,8)
-- runStoryMissions(4,5,1)
-- getCoordinates()
-- local l=Location(123,411)
-- runSpecialMission(20)
-- runMemoryMission(2)

-- Start Program and create UI
function UI() 
    dialogInit()
    addTextView("Run Story Missions(chapter, stage, times):")
    addEditText("story_chapter", "1")
    addEditText("story_stage", "1")
    addEditText("story_times", "1")
    newRow()

    addTextView("Run Memory Mission:")
    addEditText("memory_times", "1")

    dialogShow("Future Fight Bot")
    runStoryMissions(tonumber(story_chapter),tonumber(story_stage),tonumber(story_times))
    wait(3)
    runMemoryMission(tonumber(memory_times))
end

UI()
