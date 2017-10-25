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

function chooseStage (stageNumber)
    Settings:set("MinSimilarity", 0.85)
    click("stage" .. stageNumber .. ".png")
end 

function runStoryMissions(chapter, stage, times)

    waitClick("enter.png")
    waitClick("story.png")
    chooseChapter(chapter)
    chooseStage(stage)
    waitClick("start.png")
    -- loop is configured for number of times 3 times = 3-2 +1 
    for i= times-1,1,-1
    do
        if exists("herorankup.png") then
            waitClick("cancel.png")
        end
        waitClick("repeatstory.png",200)
        if exists("jocasta.png", 10) then 
            click("ok.png")
        end 
        waitClick("start.png",30)
    end 
    waitClick("leave.png",200)

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
function runSpecialMission(times)
    isRunning = false

    waitClick("enter.png")
    waitClick("special.png")
    waitClick("new_avengers.png")
    waitClick("new_york.png")
    wait(1)
    swipe("new_york4.png", "new_york1.png")
    waitClick("enter_level.png")

    for i = times,1, -1
    do
        wait(4)
        waitClick("start.png")
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
-- Content Status Board

--Dark Dimension
-- Dark Dimension

-- Daily Challenge
-- Clear 1 Story Stage
-- Clear 1 Daily Mission Stage
-- Send 1 Alliance Point
-- Clear 1 Special Mission
-- Play Co-Op Once
-- Claim 25 Crystals

--findAllImp("enter_level.png")
-- runDarkDimension(2)
-- timelineBattle(5)
 --chooseChapter(12)
  --chooseStage(1)
--runStoryMissions(3,6,2)
-- getCoordinates()
-- local l=Location(123,411)
-- click(l)
runSpecialMission(15)
-- runMemoryMission(2)