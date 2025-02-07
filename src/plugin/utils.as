bool BlockIsSpecial(string editorItem) {
    if (editorItem.Contains("Special")) { return true; }
    return false;
}

CGameEditorMesh@ GetMeshModeller() {
    return cast<CGameEditorMesh>(GetApp().Editor);
}