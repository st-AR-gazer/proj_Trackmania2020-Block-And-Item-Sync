[Setting category="general" name="Show UI"]
bool S_showUI = true;
[Setting category="general" name="Run Process Automatically"]
bool S_runProcessAutomatically = false;

bool isFirstEntry = false;
bool blockIsSpecial = false;
string currentBlockName = "";
[Setting hidden]
string materialIdLookingFor = "ThemeSnowRoad";
[Setting hidden]
string physicsIdLookingFor = "Wood";
[Setting hidden]
string endStringAttacher = "-HeavyWood";

int part = 0;

void RenderInterface() {
    if (!S_showUI) return;
    if  (GetApp().Editor is null) return;
    
    RenderSpecialHelper();
    RenderNormalHelper();
}

void RenderNormalHelper() {
    CGameEditorItem@ editorItem = cast<CGameEditorItem@>(GetApp().Editor);
    if (editorItem !is null) { 
        CGameBlockItem@ blockItem = cast<CGameBlockItem@>(editorItem.ItemModel.EntityModelEdition);
        currentBlockName = blockItem.ArchetypeBlockInfoId.GetName();
        // part = 0;
    }
    
    if (BlockIsSpecial(currentBlockName)) return; 
    if (Get_MeshModeller_CControlFrameStyled_frame() is null) { return; }

    if (S_runProcessAutomatically && !isFirstEntry) {
        startnew(SelectMaterial);
        isFirstEntry = true;
        part++;
    }

    if (UI::Begin("Helper", UI::WindowFlags::NoTitleBar|UI::WindowFlags::NoResize|UI::WindowFlags::AlwaysAutoResize)) {
        // if (UI::Button("Test")) {
        //     startnew(SetLayerSpecialMaterial);
        // }
        UI::Text("normal block");
        if (UI::Button("Step " + part, vec2(200, 200))) {
            switch(part) {
                case 0: 
                    startnew(SelectMaterial);
                    part = 1;
                    break;
            }
        }
        UI::SameLine();
        S_runProcessAutomatically = UI::Checkbox("  Auto", S_runProcessAutomatically);
        UI::Separator();
        materialIdLookingFor = UI::InputText("Material to look for", materialIdLookingFor);
        physicsIdLookingFor = UI::InputText("Physics to look for", physicsIdLookingFor);
        endStringAttacher = UI::InputText("End String Attacher", endStringAttacher);
        switch(part) {
            case 0: 
                UI::Text("Open Geometry Layer and select MATERIAL to apply. (e.g wood)");
                break;
        }
    }
    UI::End();
}

void SelectMaterial() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }

    yield();
    MeshModeller.Layers_SetLayerIdSelected(MeshModeller.Layers_GetLayerIdFromIndex(6).Value);
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(6)).Childs[0]).OnAction(); // Selects the bottom most layer
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(6)).Childs[6]).OnAction(); // Will click the 'gear' icon
    yield(50);
    cast<CControlQuad>(Tools_SetToolToMaterial_paintbucket()).OnAction();
    yield();
    SetProperMaterial();
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Materials_GetCurrentMaterialUVSettings()).Childs[0]).OnAction();
}




// =========== SPECIAL BLOCKS Helper =========== //


void RenderSpecialHelper() {
    if (cast<CGameCtnEditorFree>(GetApp().Editor) !is null) { part = 0; }

    CGameEditorItem@ editorItem = cast<CGameEditorItem@>(GetApp().Editor);
    if (editorItem !is null) { 
        CGameBlockItem@ blockItem = cast<CGameBlockItem@>(editorItem.ItemModel.EntityModelEdition);
        currentBlockName = blockItem.ArchetypeBlockInfoId.GetName();
    }

    if (BlockIsSpecial(currentBlockName)) { blockIsSpecial = true; } else { blockIsSpecial = false; }
    // if (Get_MeshModeller_CControlFrameStyled_frame() is null) { return; }

    if (!blockIsSpecial) { return; }

    if (S_runProcessAutomatically && !isFirstEntry) {
        startnew(CreateLayer4);
        isFirstEntry = true;
        part++;
    }

    if (UI::Begin("Helper", UI::WindowFlags::NoTitleBar|UI::WindowFlags::NoResize|UI::WindowFlags::AlwaysAutoResize)) {
        // if (UI::Button("Test")) {
        //     startnew(SetLayerSpecialMaterial);
        // }
        if (UI::Button("Step " + part, vec2(200, 75))) {
            switch(part) {
                case 0:
                    startnew(OpenMeshModeller);
                    part = 1;
                    break;
                case 1:
                    startnew(CreateLayer4);
                    part = 2;
                    break;
                case 2:
                    startnew(MoveToGeometryNoCollision);
                    part = 3;
                    break;
                case 3:
                    startnew(SetLayerMaterial);
                    part = 4;
                    break;
                case 4:
                    startnew(SetLayerSpecialMaterial);
                    part = 5;
                    break;
                case 5:
                    startnew(ExitMeshModeller);
                    part = 6;
                    break;
                case 6:
                    startnew(SetIcon);
                    part = 7;
                    break;
                case 7:
                    startnew(SaveFile);
                    part = 8;
                    break;
                    
            }
        }
        UI::SameLine();
        S_runProcessAutomatically = UI::Checkbox("  Auto", S_runProcessAutomatically);
        UI::Separator();
        materialIdLookingFor = UI::InputText("Material to look for", materialIdLookingFor);
        physicsIdLookingFor = UI::InputText("Physics to look for", physicsIdLookingFor);
        endStringAttacher = UI::InputText("End String Attacher", endStringAttacher);
        // switch(part) {
        //     case 0: 
        //         UI::Text("");
        //         break;
        // }
    }
    UI::End();
}

// Start automation

void OpenMeshModeller() {
    UI__OpenMeshModeller().OnAction();

    part = 1;
}


void CreateLayer4() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }

    MeshModeller.Layers_AddLayer(CGameEditorMesh::ELayerType::AddGeometry);
    yield();
    MeshModeller.Layers_SetLayerIdSelected(MeshModeller.Layers_GetLayerIdFromIndex(4).Value);
    yield();
    MeshModeller.EditedMesh_Clear();
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(4)).Childs[0]).OnAction(); // Selects the third layer from the bottom
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(4)).Childs[6]).OnAction(); // Will click the 'gear' icon
    yield(50);
    Geometry_CollidableGeometryButton().OnAction(); // Will set the collidable geometry to off
    yield();
    Layers_OpenLayersMenu().OnAction(); // Will re-open the layers menu
    yield();
    cast<CGameManialinkEntry>(cast<CControlEntry>(cast<CControlFrame>(Layers_LayerSelectableUI(4)).Childs[2]).Nod).SetText("Geometry (no collision)", true);

    yield(50);

    OpenLayer6(MeshModeller);
}

void OpenLayer6(CGameEditorMesh@ MeshModeller) {
    yield();
    MeshModeller.Layers_SetLayerIdSelected(MeshModeller.Layers_GetLayerIdFromIndex(6).Value);
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(6)).Childs[0]).OnAction(); // Selects the bottom most layer
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(6)).Childs[6]).OnAction(); // Will click the 'gear' icon
    yield(50);
}

// After select automation

void MoveToGeometryNoCollision() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }

    Layers_OpenLayersMenu().OnAction(); // Will re-open the layers menu
    yield(50);

    MeshModeller.Layers_SetLayerIdSelected(MeshModeller.Layers_GetLayerIdFromIndex(4).Value);
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(4)).Childs[0]).OnAction(); // Selects the third layer from the bottom
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(4)).Childs[6]).OnAction(); // Will click the 'gear' icon
    yield(50);
    SetToolStepSize(0);
    yield();
}

void SetToolStepSize(float step) {
    cast<CGameManialinkEntry>(Tools_GetToolStep().Nod).SetText(tostring(step), true);
}

// After select automation

void SetLayerMaterial() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }
    yield();
    cast<CControlQuad>(Tools_SetToolToMaterial_paintbucket()).OnAction();
    yield();
    SetProperMaterial();
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Materials_GetCurrentMaterialUVSettings()).Childs[0]).OnAction();
}

void SetProperMaterial() {
    string targetMaterial = "Stadium : " + materialIdLookingFor;
    CControlFrame@ materialsFrame = cast<CControlFrame>(Materials_GetCurrentAvalableMaterials());
    if (materialsFrame is null) { return; }
    CControlLabel@ tabLabel = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[4]);
    if (tabLabel is null) { return; }
    array<string>@ tabParts = string(tabLabel.Label).Split(" / ");
    int totalTabs = Text::ParseInt(tabParts[1]);
    for (int t = 0; t < totalTabs; t++) {
        for (int i = 0; i < 10; i++) {
            CControlLabel@ materialLabel = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[i]).Childs[2]);
            if (materialLabel !is null && materialLabel.Label == targetMaterial) {
                cast<CControlQuad>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[i]).Childs[4]).OnAction();
                return;
            }
        }
        if (t < totalTabs - 1) {
            CControlQuad@ nextTabButton = cast<CControlQuad>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[2]);
            if (nextTabButton !is null) {
                nextTabButton.OnAction();
                yield();
            }
        }
    }
    for (int t = 1; t < totalTabs; t++) {
        CControlLabel@ prevTabButton = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[1]);
        if (prevTabButton !is null) {
            prevTabButton.OnAction();
            yield();
        }
    }
}

// After select automation

void SetProperPhysicsMaterial() {
    string targetMaterial = "PhysicsId : " + physicsIdLookingFor;
    CControlFrame@ materialsFrame = cast<CControlFrame>(Materials_GetCurrentAvalableMaterials());
    if (materialsFrame is null) { return; }
    CControlLabel@ tabLabel = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[4]);
    if (tabLabel is null) { return; }
    array<string>@ tabParts = string(tabLabel.Label).Split(" / ");
    if (tabParts.Length != 2) { return; }
    int totalTabs = Text::ParseInt(tabParts[1]);
    for (int t = 0; t < totalTabs; t++) {
        for (int i = 0; i < 10; i++) {
            CControlLabel@ materialLabel = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[i]).Childs[2]);
            if (materialLabel !is null && materialLabel.Label == targetMaterial) {
                cast<CControlQuad>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[i]).Childs[4]).OnAction();
                return;
            }
        }
        if (t < totalTabs - 1) {
            CControlQuad@ nextTabButton = cast<CControlQuad>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[2]);
            if (nextTabButton !is null) {
                nextTabButton.OnAction();
                yield();
            }
        }
    }
    for (int t = 1; t < totalTabs; t++) {
        CControlLabel@ prevTabButton = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(materialsFrame).Childs[10]).Childs[1]);
        if (prevTabButton !is null) {
            prevTabButton.OnAction();
            yield();
        }
    }
}

void SetLayerSpecialMaterial() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }
    Layers_OpenLayersMenu().OnAction();
    yield(50);
    MeshModeller.Layers_SetLayerIdSelected(MeshModeller.Layers_GetLayerIdFromIndex(5).Value);
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(5)).Childs[0]).OnAction();
    yield();
    cast<CControlQuad>(cast<CControlFrame>(Layers_LayerSelectableUI(5)).Childs[6]).OnAction();
    yield(50);
    yield();
    cast<CControlQuad>(Tools_SetToolToMaterial_paintbucket()).OnAction();
    yield();
    SetProperPhysicsMaterial();
    yield(50);
    cast<CControlQuad>(Materials_SetMaterialSpecialAbilityButton()).OnAction();
    yield();
    SetProperGameplayMaterial();
}

void SetProperGameplayMaterial() {
    string targetGameplay = DetermineGameplayPhysicsId(currentBlockName);
    print(currentBlockName + " || " + targetGameplay);
    if (targetGameplay == "") { return; }
    CControlFrame@ specialAbilityFrame = cast<CControlFrame>(Materials_SetMaterialSpecialAbilitySelector());
    if (specialAbilityFrame is null) { return; }
    CControlLabel@ tabLabel = cast<CControlLabel>(cast<CControlFrame>(specialAbilityFrame).Childs[17]);
    if (tabLabel is null) { return; }
    // print("aa");
    // print(cast<CControlLabel>(cast<CControlFrame>(specialAbilityFrame.Childs[4]).Childs[2]).Label);
    array<string>@ tabParts = string(tabLabel.Label).Split(" / ");
    if (tabParts.Length != 2) { return; }
    int totalTabs = Text::ParseInt(tabParts[1]);
    for (int t = 0; t < totalTabs; t++) {
        for (int i = 4; i <= 13; i++) {
            CControlLabel@ gameplayLabel = cast<CControlLabel>(cast<CControlFrame>(cast<CControlFrame>(specialAbilityFrame).Childs[i]).Childs[2]);
            if (gameplayLabel !is null && gameplayLabel.Label == targetGameplay) {
                cast<CControlQuad>(cast<CControlFrame>(cast<CControlFrame>(specialAbilityFrame).Childs[i]).Childs[3]).OnAction();
                return;
            }
        }
        if (t < totalTabs - 1) {
            CControlQuad@ nextTabButton = cast<CControlQuad>(cast<CControlFrame>(specialAbilityFrame).Childs[14]);
            if (nextTabButton !is null) {
                nextTabButton.OnAction();
                yield();
            }
        }
    }
    for (int t = 1; t < totalTabs; t++) {
        CControlQuad@ prevTabButton = cast<CControlQuad>(cast<CControlFrame>(specialAbilityFrame).Childs[13]);
        if (prevTabButton !is null) {
            prevTabButton.OnAction();
            yield();
        }
    }
}

string DetermineGameplayPhysicsId(string blockName) {

    if (blockName.Contains("Roulette") && blockName.Contains("Turbo")) {
        return "PhysicsId : "+physicsIdLookingFor+"TurboRoulette";
    } else if (blockName.Contains("Reactor") && blockName.Contains("Boost") && blockName.Contains("2")) {
        return "PhysicsId : "+physicsIdLookingFor+"ReactorBoost2_Oriented";
    } else if (blockName.Contains("Reactor") && blockName.Contains("Boost")) {
        return "PhysicsId : "+physicsIdLookingFor+"ReactorBoost_Oriented";
    } else if (blockName.Contains("Turbo")) {
        if (blockName.Contains("2")) {
            return "PhysicsId : "+physicsIdLookingFor+"Turbo2";
        }
        return "PhysicsId : "+physicsIdLookingFor+"Turbo";
    } else if (blockName.Contains("NoEngine")) {
        return "PhysicsId : "+physicsIdLookingFor+"FreeWheeling";
    } else if (blockName.Contains("NoBrake")) {
        return "PhysicsId : "+physicsIdLookingFor+"NoBrakes";
    } else if (blockName.Contains("NoGrip")) {
        return "PhysicsId : "+physicsIdLookingFor+"NoGrip";
    } else if (blockName.Contains("NoSteering")) {
        return "PhysicsId : "+physicsIdLookingFor+"NoSteering";
    } else if (blockName.Contains("ForceAcceleration")) {
        return "PhysicsId : "+physicsIdLookingFor+"ForceAcceleration";
    } else if (blockName.Contains("Reset")) {
        return "PhysicsId : "+physicsIdLookingFor+"Reset";
    } else if (blockName.Contains("SlowMotion")) {
        return "PhysicsId : "+physicsIdLookingFor+"SlowMotion";
    } else if (blockName.Contains("Bumper") && blockName.Contains("2")) {
        return "PhysicsId : "+physicsIdLookingFor+"Bumper2";
    } else if (blockName.Contains("Bumper")) {
        return "PhysicsId : "+physicsIdLookingFor+"Bumper";
    } else if (blockName.Contains("Fragile")) {
        return "PhysicsId : "+physicsIdLookingFor+"Fragile";
    } else if (blockName.Contains("NoBrakes")) {
        return "PhysicsId : "+physicsIdLookingFor+"NoBrakes";
    } else if (blockName.Contains("Cruise")) {
        return "PhysicsId : "+physicsIdLookingFor+"Cruise";
    } else if (blockName.Contains("Boost")) {
        if (blockName.Contains("2")) {
            return "PhysicsId : "+physicsIdLookingFor+"Boost2_Oriented";
        }
        return "PhysicsId : "+physicsIdLookingFor+"Boost_Oriented";
    }
    return "";
}

// -----

void ExitMeshModeller() {
    CGameEditorMesh@ MeshModeller = GetMeshModeller();
    if (MeshModeller is null) { return; }
    
    UI__ExitMeshModeller().OnAction();
    // yield(50);
    // UI__ExitMeshModellerKeepChangesButton().OnAction();
}

// -----

void SetIcon() {
    UI__OpenIconSelection().OnAction();
    yield();
}

// -----

void SaveFile() {
    CGameEditorItem@ editorItem = cast<CGameEditorItem@>(GetApp().Editor);
    if (editorItem is null) { return; }

    editorItem.FileSaveAs();
    yield();
    yield(30);

    CGameBlockItem@ blockItem = cast<CGameBlockItem@>(editorItem.ItemModel.EntityModelEdition);
    currentBlockName = blockItem.ArchetypeBlockInfoId.GetName();
    GetApp().BasicDialogs.String = currentBlockName + endStringAttacher;

    print(currentBlockName + endStringAttacher);

    yield();
}