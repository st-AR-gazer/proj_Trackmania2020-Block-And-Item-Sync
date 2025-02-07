// Item Edit screen

string GetLabel() {
    CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[2]);
    CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    CScene2d@ scene = cast<CScene2d>(sector.Scene);
    CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]);
    CControlFrame@ frame2 = cast<CControlFrame>(frame.Childs[0]);  // InterfaceRoot
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[4]); // FrameClassEditor
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[1]); // FramePropertiesContainer
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]); // FrameProperties
    CControlListCard@ listCard = cast<CControlListCard>(frame5.Childs[1]); // ListCardProperties
    CControlFrame@ frame6 = cast<CControlFrame>(listCard.Childs[9]); // #6
    CControlLabel@ label = cast<CControlLabel>(frame6.Childs[0]); // LabelName
    
    return label.Label;
}

CControlButton@ UI__OpenIconSelection() {
    CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[2]); // Unassigned
    CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    CScene2d@ scene = cast<CScene2d>(sector.Scene);
    CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]); // Unassigned
    CControlFrame@ frame2 = cast<CControlFrame>(frame.Childs[0]);  // InterfaceRoot
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[4]); // FrameClassEditor
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[1]); // FramePropertiesContainer
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]); // FrameProperties
    CControlListCard@ listCard = cast<CControlListCard>(frame5.Childs[1]); // ListCardProperties
    CControlFrame@ frame6 = cast<CControlFrame>(listCard.Childs[6]);
    CControlFrame@ frame7 = cast<CControlFrame>(frame6.Childs[5]);
    CControlButton@ button = cast<CControlButton>(frame7.Childs[3]);

    return button;
}

CControlButton@ UI__OpenMeshModeller() {
    CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[2]); // Unassigned
    CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    CScene2d@ scene = cast<CScene2d>(sector.Scene);
    CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]); // Unassigned
    CControlFrame@ frame2 = cast<CControlFrame>(frame.Childs[0]);  // InterfaceRoot
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[4]); // FrameClassEditor
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[1]); // FramePropertiesContainer
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]); // FrameProperties
    CControlListCard@ listCard = cast<CControlListCard>(frame5.Childs[1]); // ListCardProperties
    CControlFrame@ frame6 = cast<CControlFrame>(listCard.Childs[11]); // #6
    CControlFrame@ frame7 = cast<CControlFrame>(frame6.Childs[6]); // ButtonMeshModeller
    CControlButton@ button = cast<CControlButton>(frame7.Childs[3]); // ButtonMeshModeller

    return button;
}

CControlButton@ UI__ExitMeshModeller() {
    CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[3]); // Unassigned
    CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    CScene2d@ scene = cast<CScene2d>(sector.Scene);
    CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]); // Unassigned
    CControlFrame@ frame2 = cast<CControlFrame>(frame.Childs[0]);  // InterfaceRoot
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[0]); // FrameEditorGlobal
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]); // FrameBottomBar
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[2]); // FrameFileToolBar
    CControlButton@ button = cast<CControlButton>(frame5.Childs[0]); // Buttonexit

    return button;
}

CControlButton@ UI__ExitMeshModellerKeepChangesButton() {
    // CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    // CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[3]); // Unassigned
    // CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    // CScene2d@ scene = cast<CScene2d>(sector.Scene);
    // CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]); // Unassigned
    // CGameMenuFrame@ frame2 = cast<CGameMenuFrame>(frame.Childs[0]);  // FrameAskYesNoCancel
    // CControlContainer@ frame3 = cast<CControlContainer>(frame2.Childs[0]); // GridLayout
    // CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]); // TrameTop
    // CControlContainer@ frame5 = cast<CControlContainer>(frame4.Childs[2]); // GridContent
    // CControlFrame@ frame6 = cast<CControlFrame>(frame5.Childs[1]); // FrameButtons
    // CControlContainer@ card = cast<CControlContainer>(frame6.Childs[0]); // ButtonYes
    // CControlButton@ button = cast<CControlButton>(card.Childs[0]); // ButtonSelect

    // return button;
    return CControlButton();
}

// Mesh Modeller screen

CControlFrameStyled@ Get_MeshModeller_CControlFrameStyled_frame() {
    CDx11Viewport@ viewport = cast<CDx11Viewport>(GetApp().Viewport);
    if (viewport.Overlays.Length <= 16) { return null; }
    CHmsZoneOverlay@ overlay = cast<CHmsZoneOverlay>(viewport.Overlays[16]); // Unassigned
    CSceneSector@ sector = cast<CSceneSector>(overlay.UserData);
    CScene2d@ scene = cast<CScene2d>(sector.Scene);
    CControlFrameStyled@ frame = cast<CControlFrameStyled>(scene.Mobils[0]); // First #0

    return frame;
}

CControlFrame@ Layers_LayerSelectableUI(int i) {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[3]); // #3 // LayersUI
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[1]); // #1 // LayersSelector
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[2]); // #2 // LayersLayers
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]); // #0 // LayersLayers

    switch(i) {
        case 0: return cast<CControlFrame>(frame5.Childs[0]); // #0 // LayersLayers_specific // Layer 1
        case 1: return cast<CControlFrame>(frame5.Childs[1]); // #1 // LayersLayers_specific // Layer 2
        case 2: return cast<CControlFrame>(frame5.Childs[2]); // #2 // LayersLayers_specific // Layer 3
        case 3: return cast<CControlFrame>(frame5.Childs[3]); // #3 // LayersLayers_specific // Layer 4
        case 4: return cast<CControlFrame>(frame5.Childs[4]); // #4 // LayersLayers_specific // Layer 5
        case 5: return cast<CControlFrame>(frame5.Childs[5]); // #5 // LayersLayers_specific // Layer 6
        case 6: return cast<CControlFrame>(frame5.Childs[6]); // #6 // LayersLayers_specific // Layer 7
        default: return CControlFrame(); // return empty frame
    }
}

CControlQuad@ Geometry_CollidableGeometryButton() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[0]); // #3 // MainUI
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[4]); // 
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]); // 
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[3]); // 
    CControlFrame@ frame6 = cast<CControlFrame>(frame5.Childs[0]); // 
    CControlFrame@ frame7 = cast<CControlFrame>(frame6.Childs[1]); // 
    CControlQuad@ quad = cast<CControlQuad>(frame7.Childs[5]); // 

    return quad;
}

CControlQuad@ Layers_OpenLayersMenu() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[0]);
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[5]);
    CControlQuad@ quad = cast<CControlQuad>(frame3.Childs[0]);

    return quad;
}

CControlEntry@ Tools_GetToolStep() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[6]); // #3 // MainUI
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[1]);
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[1]);
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[1]);
    CControlEntry@ entry = cast<CControlEntry>(frame5.Childs[4]);

    return entry;
}

CControlQuad@ Tools_SetToolToMaterial_paintbucket() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[0]); // #0 // MainUI
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[2]); // #3 // MainUI
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[1]);
    CControlQuad@ quad = cast<CControlQuad>(frame4.Childs[3]);

    return quad;
}

CControlFrame@ Materials_GetCurrentAvalableMaterials() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[1]);
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[3]);
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]);
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]);
    CControlFrame@ frame6 = cast<CControlFrame>(frame5.Childs[5]);

    return frame6;
}

CControlFrame@ Materials_GetCurrentMaterialUVSettings() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[1]);
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[0]);
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[6]);

    return frame4;
}

CControlQuad@ Materials_SetMaterialSpecialAbilityButton() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[1]);
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[3]);
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]);
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]);
    CControlFrame@ frame6 = cast<CControlFrame>(frame5.Childs[4]);
    CControlQuad@ quad = cast<CControlQuad>(frame6.Childs[1]);

    return quad;
}

CControlFrame@ Materials_SetMaterialSpecialAbilitySelector() {
    CControlFrameStyled@ frame = Get_MeshModeller_CControlFrameStyled_frame();
    CControlFrame@ frame1 = cast<CControlFrame>(frame.Childs[0]); // #0 // MainUI
    CControlFrame@ frame2 = cast<CControlFrame>(frame1.Childs[1]);
    CControlFrame@ frame3 = cast<CControlFrame>(frame2.Childs[3]);
    CControlFrame@ frame4 = cast<CControlFrame>(frame3.Childs[0]);
    CControlFrame@ frame5 = cast<CControlFrame>(frame4.Childs[0]);
    CControlFrame@ frame6 = cast<CControlFrame>(frame5.Childs[6]);
    CControlFrame@ frame7 = cast<CControlFrame>(frame6.Childs[0]);

    return frame7;
}