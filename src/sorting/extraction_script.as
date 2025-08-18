/*

dictionary inventory;
const string INDENT = "    ";
const string OUTFILENAME = "dir_structure.txt";

void Render() {
    if (UI::Button("Extract")) {
        startnew(Extract);
    }
}

void Extract() {
    NotifyWarn("OOPS! Don't forget to rename the 'blocks' and 'items' folders in /Documents/Trackmania[2020] to something else, as the inventory will change if there are any custom blocks (and I haven't bothered to take this into account!)");

    log("Extracting data...", LogLevel::Info);

    if (GetApp().Editor is null) {
        log("The editor is null, meaning the 'inventory' is not avalible, please open the editor before running this script.");
        NotifyWarn("Please open the editor before running this script.");
        return;
    }

    CGameCtnApp@ app = GetApp();
    CGameCtnEditorCommon@ editor = cast<CGameCtnEditorCommon@>(app.Editor);
    CGameEditorPluginMapMapType@ pmt = editor.PluginMapType;
    CGameEditorGenericInventory@ g_inventory = pmt.Inventory;

    if (g_inventory.RootNodes.Length > 1) {
        auto blocksNode = cast<CGameCtnArticleNodeDirectory@>(g_inventory.RootNodes[1]);
        if (blocksNode !is null) {
            ExploreBlockNode(blocksNode);
        } else {
            log("RootNodes[1] did not contain a directory (blocks).");
        }
    } else {
        log("Inventory has fewer than 2 root nodes; blocks folder missing?");
    }

    log("Extraction complete. Found " + tostring(inventory.ToJson().Length) + " blocks.", LogLevel::Info);

    WriteExtractedBlockFile();
}

void ExploreBlockNode(CGameCtnArticleNodeDirectory@ dir, const string &in folderPath = "") {
    if (folderPath.Length > 0 && !inventory.Exists(folderPath))
        inventory[folderPath] = true;

    array<CGameCtnArticleNodeDirectory@> subDirs;
    array<CGameCtnArticleNodeArticle@>   articles;

    for (uint i = 0; i < dir.ChildNodes.Length; ++i) {
        auto n = dir.ChildNodes[i];
        if (n.IsDirectory) {
            subDirs.InsertLast(cast<CGameCtnArticleNodeDirectory@>(n));
        } else {
            articles.InsertLast(cast<CGameCtnArticleNodeArticle@>(n));
        }
    }

    for (uint i = 0; i < subDirs.Length; ++i) {
        string subPath = folderPath + subDirs[i].Name + "/";
        ExploreBlockNode(subDirs[i], subPath);
    }

    for (uint i = 0; i < articles.Length; ++i) {
        auto ana = articles[i];
        if (ana.Article is null) continue;
        string idNameLc = ana.Article.IdName.ToLower();
        if (idNameLc.EndsWith("customblock")) {
            NotifyWarn("Custom block '" + ana.Article.IdName + "' detected - aborting extraction to avoid incorrect inventory data.");
            return;
        }

        if (cast<CGameCtnBlockInfo@>(ana.Article.LoadedNod) is null)       continue;

        string fullPath = folderPath + ana.Article.IdName + ".Block.Gbx";
        inventory[fullPath] = false;
    }
}

void WriteExtractedBlockFile() {
    if (inventory.GetSize() == 0) {
        NotifyError("Inventory dictionary is empty - nothing to write.");
        return;
    }

    array<string> paths = inventory.GetKeys();
    paths.SortAsc();

    string outPath = IO::FromStorageFolder(OUTFILENAME);
    IO::File f;
    f.Open(outPath, IO::FileMode::Write);

    for (uint i = 0; i < paths.Length; ++i) {
        const string path = paths[i];
        bool isDir = bool(inventory[path]);

        string trimmed = isDir && path.EndsWith("/")
                       ? path.SubStr(0, path.Length - 1)
                       : path;

        uint depth = 0;
        for (uint c = 0; c < trimmed.Length; ++c) {
            if (trimmed.SubStr(c, 1) == "/") ++depth;
        }

        string indent;
        for (uint d = 0; d < depth; ++d) {
            indent += INDENT;
        }

        int lastSlash = _Text::NthLastIndexOf(trimmed, '/', 1);
        string name = lastSlash >= 0 ? trimmed.SubStr(lastSlash + 1) : trimmed;

        f.WriteLine(indent + name + (isDir ? "/" : ""));
    }
    f.Close();

    log("dir_structure.txt written: " + outPath, LogLevel::Info);
    IO::SetClipboard(outPath);
    NotifyInfo("Inventory exported! (path copied to clipboard)");
}



// expected output

// /
// Opens/
//     OpenDirt/
//         HillsShort/
//             CurveIn/
//                 OpenDirtHillsShortCurve1In.Block.Gbx
//             CurveOut/
//                 OpenDirtHillsShortCurve1Out.Block.Gbx
//             Straight/
//                 OpenDirtHillsShortBase5.Block.Gbx
//                 OpenDirtHillsShortStraight.Block.Gbx
//         OpenDirt/
//             OpentDirtRoadCheckpoints/
//                 OpenDirtRoadCheckpoint.Block.Gbx
//                 OpenDirtRoadCheckpointSlope2Down.Block.Gbx
//                 OpenDirtRoadCheckpointSlope2Left.Block.Gbx
//                 OpenDirtRoadCheckpointSlope2Right.Block.Gbx
//                 OpenDirtRoadCheckpointSlope2Up.Block.Gbx
//             RoadCurve2/
//                 OpenDirtRoadCurve2.Block.Gbx
//                 OpenDirtRoadCurve2Slope2DownLeft.Block.Gbx
//                 OpenDirtRoadCurve2Slope2DownRight.Block.Gbx
//                 OpenDirtRoadCurve2Slope2UpLeft.Block.Gbx
//                 OpenDirtRoadCurve2Slope2UpRight.Block.Gbx
//             RoadCurves/
//                 OpenDirtRoadCurve1.Block.Gbx
//                 OpenDirtRoadCurve1Slope2DownLeft.Block.Gbx
//                 OpenDirtRoadCurve1Slope2DownRight.Block.Gbx
//                 OpenDirtRoadCurve1Slope2UpLeft.Block.Gbx
//                 OpenDirtRoadCurve1Slope2UpRight.Block.Gbx
//             RoadOnSlopes/


namespace _Text {
    int NthLastIndexOf(const string &in str, const string &in value, int n) {
        int index = -1;
        for (int i = str.Length - 1; i >= 0; --i) {
            if (str.SubStr(i, value.Length) == value) {
                if (n == 1) {
                    index = i;
                    break;
                }
                --n;
            }
        }
        return index;
    }
}
*/