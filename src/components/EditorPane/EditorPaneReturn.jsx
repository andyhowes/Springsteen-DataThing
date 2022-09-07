return (
  <div id="savedLinesBox">
    <h1 className="linesCap">EDITOR</h1>
    {editorStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
    <section><div id="linesBox">
      <h3>{title}</h3>
      <DragDropContext onDragEnd={handleOnDragEnd}>
        <Droppable droppableId="droppableIdForEditorList">
        {(provided) => (
          <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
            {lyrics.map((line, index) => {
              let lineKey = line.line_id + 'b';
              return (
                <Draggable key={lineKey} draggableId={lineKey} index={index}>{(provided) =>
                (<div ref={provided.innerRef} {...provided.draggableProps}{...provided.dragHandleProps}>
                <li><button className="deleteButton" onClick={()=>{deleteLine(line.line_id)}}>⊖</button>
                {line.fragment_text}</li></div>)}</Draggable>
              )
            })}
            {provided.placeholder}
          </ul>
        )}

        </Droppable>
      </DragDropContext>
      <input id="titleInput" onChange={setNewTitle} placeholder="Song Title"></input>
      <label for="saveSlot">Save Slot</label>

      <select name="saveSlot" id="slot" onChange={setSaveSlot}>
        <option value='1'>1</option>
        <option value='2'>2</option>
        <option value='3'>3</option>
        <option value='4'>4</option>
        <option value='5'>5</option>
        <option value='6'>6</option>
        <option value='7'>7</option>
        <option value='8'>8</option>
        <option value='9'>9</option>
      </select>
      <button id="setTitleButton" onClick={submitCreation}>Submit    </button>
    </div></section>)}
  </div>
);