% Specify the model name (without .slx extension)
modelName = 'testingPlatform';

% Open the model if it is not already open
open_system(modelName);

% Define the list of solid block names without spaces
blockNames = ["Brick Solid1", "Brick Solid2", "Brick Solid3", ...
              "Brick Solid4", "Brick Solid5", "Brick Solid6", ...
              "Brick Solid7", "Brick Solid8", "Brick Solid9", ...
              "Brick Solid10", "Brick Solid11", "Brick Solid12", ...
              "Brick Solid13", "Brick Solid14", "Brick Solid15", ...
              "Brick Solid16", "Brick Solid17", "Brick Solid18", ...
              "Brick Solid19", "Brick Solid20", "Brick Solid21", ...
              "Brick Solid22", "Brick Solid23", "Brick Solid24", "Brick Solid25"];

% Define new dimensions for the solid blocks
Dimensions = '[0.01 0.01 0.1]';

% Loop through each block name and update its dimensions
for i = 1:length(blockNames)
    try
        % Construct the full path of the block
        blockPath = strcat(modelName, '/', blockNames(i));

        % Update the dimensions of the solid block
        set_param(blockPath, 'BrickDimensions', Dimensions);
       % set_param(blockPath, 'PrimitiveWidth', num2str(newWidth));
        %set_param(blockPath, 'PrimitiveHeight', num2str(newHeight));
    catch ME
        % Display a warning if a block cannot be updated
        warning('Could not update block: %s\nError: %s', blockNames(i), ME.message);
    end
end

disp('All specified solid block dimensions have been updated.');

