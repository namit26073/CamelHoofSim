% Specify the model name (without .slx extension)
modelName = 'testingPlatform';

% Open the model if it is not already open
open_system(modelName);

% Define the list of Rigid Transform block names
existingBlocks = ["Rigid Transform21", "Rigid Transform22", "Rigid Transform23", ...
                  "Rigid Transform24", "Rigid Transform25", "Rigid Transform26", ...
                  "Rigid Transform27", "Rigid Transform28", "Rigid Transform29", ...
                  "Rigid Transform30", "Rigid Transform31", "Rigid Transform32", ...
                  "Rigid Transform33", "Rigid Transform34", "Rigid Transform35", ...
                  "Rigid Transform36", "Rigid Transform37", "Rigid Transform38", ...
                  "Rigid Transform39", "Rigid Transform40", "Rigid Transform41", ...
                  "Rigid Transform42", "Rigid Transform43", "Rigid Transform44", ...
                  "Rigid Transform45", "Rigid Transform46", "Rigid Transform47", ...
                  "Rigid Transform48", "Rigid Transform49", "Rigid Transform50"];

newBlocks = ["Rigid Transform1", "Rigid Transform2", "Rigid Transform3", ...
             "Rigid Transform4", "Rigid Transform5", "Rigid Transform6", ...
             "Rigid Transform7", "Rigid Transform8", "Rigid Transform9", ...
             "Rigid Transform10", "Rigid Transform11", "Rigid Transform12", ...
             "Rigid Transform13", "Rigid Transform14", "Rigid Transform15", ...
             "Rigid Transform16", "Rigid Transform17", "Rigid Transform18", ...
             "Rigid Transform19", "Rigid Transform20", ...
             "Rigid Transform51", "Rigid Transform52", "Rigid Transform53", ...
             "Rigid Transform54", "Rigid Transform55", "Rigid Transform56", ...
             "Rigid Transform57", "Rigid Transform58", "Rigid Transform59", "Rigid Transform60"];

% Define the grid size and offset step
gridSizeX = 5; % Number of columns
gridSizeY = 10; % Number of rows
offsetStepX = 0.01; % Horizontal offset step (X direction)
offsetStepY = 0.01; % Vertical offset step (Y direction)
verticalShiftY = 0.05; % Shift in the Y-axis for the new block of 25

% Initialize counters for row and column positions
rowIndex = 0;
colIndex = 0;

% Update the positions for the existing blocks (21-50)
for i = 1:length(existingBlocks)
    try
        % Construct the full path of the block
        blockPath = strcat(modelName, '/', existingBlocks(i));

        % Calculate the new translation offset (X and Y positions)
        xOffset = colIndex * offsetStepX;
        yOffset = rowIndex * offsetStepY;

        % Update the TranslationCartesianOffset parameter
        set_param(blockPath, 'TranslationCartesianOffset', ['[', num2str(xOffset), ' ', num2str(yOffset), ' 0]']);

        % Update column and row indices
        colIndex = colIndex + 1;
        if colIndex >= gridSizeX
            colIndex = 0;
            rowIndex = rowIndex + 1;
        end
    catch ME
        warning('Could not update Rigid Transform block: %s\nError: %s', existingBlocks(i), ME.message);
    end
end

% Reset row and column indices for the new blocks
rowIndex = 0;
colIndex = 0;

% Update the positions for the new blocks (1-20 and 51-60)
for i = 1:length(newBlocks)
    try
        % Construct the full path of the block
        blockPath = strcat(modelName, '/', newBlocks(i));

        % Calculate the new translation offset (X and Y positions)
        xOffset = colIndex * offsetStepX;
        yOffset = verticalShiftY + rowIndex * offsetStepY; % Shifted down in the Y-axis

        % Update the TranslationCartesianOffset parameter
        set_param(blockPath, 'TranslationCartesianOffset', ['[', num2str(xOffset), ' ', num2str(yOffset), ' 0]']);

        % Update column and row indices
        colIndex = colIndex + 1;
        if colIndex >= gridSizeX
            colIndex = 0;
            rowIndex = rowIndex + 1;
        end
    catch ME
        warning('Could not update Rigid Transform block: %s\nError: %s', newBlocks(i), ME.message);
    end
end

disp('All Rigid Transform offsets have been updated.');
