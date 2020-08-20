if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list')
    document.getElementById('item_image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      };
      const file = e.target.files[0]
      const blob = window.URL.createObjectURL(file);
      blob.width = 100;

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')

      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.width = 100;
      imageElement.appendChild(blobImage)
      ImageList.appendChild(imageElement)
    });
  });
}